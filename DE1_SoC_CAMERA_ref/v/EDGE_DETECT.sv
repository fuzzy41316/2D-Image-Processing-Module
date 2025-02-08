module EDGE_DETECT	(	
					oRed,
					oGreen,
					oBlue,
					oDVAL,
					iIsEdgeDetect,
					iIsHorizontalEdge,
					iX_Cont,
					iY_Cont,
					iDATA,
					iDVAL,
					iCLK,
					iRST
					);

input	[10:0]	iX_Cont;
input	[10:0]	iY_Cont;
input	[11:0]	iDATA;
input			iDVAL;
input			iCLK;
input			iRST;
input			iIsEdgeDetect;
input			iIsHorizontalEdge;
output	[11:0]	oRed;
output	[11:0]	oGreen;
output	[11:0]	oBlue;
output			oDVAL;

logic	[11:0]	iDATA_ff;
logic	[11:0]	mDATA;
logic	[11:0]	mDATA_ff;
logic			mDVAL;
logic 			edge_done;

logic			[11:0]	pixel_value;
logic			[11:0]	grayscale_pixel_value;
logic signed	[14:0]	edge_pixel_value_signed;
logic			[13:0]  edge_pixel_value_bottom_bits;
logic			[13:0]	edge_pixel_value_abs;
logic			[11:0]  convolution_input[0:2][0:2];

assign edge_pixel_value_bottom_bits = edge_pixel_value_signed[13:0];
assign edge_pixel_value_abs = edge_pixel_value_signed[14] ? (~edge_pixel_value_bottom_bits) + 1 : edge_pixel_value_bottom_bits;
assign pixel_value = iIsEdgeDetect ? edge_pixel_value_abs[11:0] : grayscale_pixel_value;

assign	oRed	=	pixel_value;
assign	oGreen	=	pixel_value;
assign	oBlue	=	pixel_value;
assign	oDVAL	=	iIsEdgeDetect ? edge_done : mDVAL;

// Line buffer used for grayscale conversion
Line_Buffer2 u0 (
	//Inputs
	.clken(iDVAL),
	.clock(iCLK),
	.shiftin(iDATA),
	.taps(mDATA)
);

Line_Buffer3 u1 (
	//Inputs
	.clken(iDVAL),
	.clock(iCLK),
	.shiftin(convolution_input[2][2]),
	.taps(convolution_input[1][2])
);

Line_Buffer3 u2 (
	//Inputs
	.clken(iDVAL),
	.clock(iCLK),
	.shiftin(convolution_input[1][2]),
	.taps(convolution_input[0][2])
);

// Update pixel values every cycle
always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	begin
		iDATA_ff	<=	0;
		mDATA_ff 	<= 	0;
		mDVAL		<=  0;
		grayscale_pixel_value <=  0;
	end
	else
	begin
		mDATA_ff <= mDATA;
		iDATA_ff <= iDATA;
		// Set valid signal high at the same time as the RGB module or else we get distortions when switching
		mDVAL <= {iY_Cont[0]|iX_Cont[0]}	?	1'b0	:	iDVAL;

		grayscale_pixel_value <= (mDATA_ff + mDATA + iDATA_ff + iDATA) / 4;	// Average pixels in a 2x2 square to get the grayscale value
	end
end

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	begin
		convolution_input[0][1]	<=	0;
		convolution_input[0][0]	<=	0;
		convolution_input[1][1]	<=	0;
		convolution_input[1][0]	<=	0;
		convolution_input[2][2] <=  0;
		convolution_input[2][1]	<=	0;
		convolution_input[2][0]	<=	0;
	end
	else
	begin
		convolution_input[0][1]	<=	convolution_input[0][2];
		convolution_input[0][0]	<=	convolution_input[0][1];
		convolution_input[1][1]	<=	convolution_input[1][2];
		convolution_input[1][0]	<=	convolution_input[1][1];
		convolution_input[2][2] <=  grayscale_pixel_value;
		convolution_input[2][1]	<=	convolution_input[2][2];
		convolution_input[2][0]	<=	convolution_input[2][1];
	end
end

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	begin
		edge_pixel_value_signed <= 0;
		edge_done <= 0;
	end
	else
	begin
		edge_done <= mDVAL;
		if(!iIsHorizontalEdge) begin
			edge_pixel_value_signed <= convolution_input[2][0] + 2 * convolution_input[2][1] + convolution_input[2][2]
				- convolution_input[0][0] - 2 * convolution_input[0][1] - convolution_input[0][2];
		end
		else begin
			edge_pixel_value_signed <= convolution_input[0][2] + 2 * convolution_input[1][2] + convolution_input[2][2]
				- convolution_input[0][0] - 2 * convolution_input[1][0] - convolution_input[2][0];
		end
	end
end


endmodule


