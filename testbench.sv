`timescale 1 ps / 1 ps
module testbench();
    //////////////////
    // DUT SIGNALS //
    ////////////////

    ///////// ADC /////////
    wire                ADC_CS_N;
    logic               ADC_DIN;
    logic               ADC_DOUT;
    logic               ADC_SCLK;

    ///////// AUD /////////
    logic               AUD_ADCDAT;
    wire                AUD_ADCLRCK;
    wire                AUD_BCLK;
    logic               AUD_DACDAT;
    wire                AUD_DACLRCK;
    logic               AUD_XCK;

    ///////// CLOCK2 /////////
    logic               CLOCK2_50;

    ///////// CLOCK3 /////////
    logic               CLOCK3_50;

    ///////// CLOCK4 /////////
    logic               CLOCK4_50;

    ///////// CLOCK /////////
    logic               CLOCK_50;

    ///////// DRAM /////////
    logic       [12:0]  DRAM_ADDR;
    logic       [1:0]   DRAM_BA;
    logic               DRAM_CAS_N;
    logic               DRAM_CKE;
    logic               DRAM_CLK;
    logic               DRAM_CS_N;
    wire        [15:0]  DRAM_DQ;
    logic               DRAM_LDQM;
    logic               DRAM_RAS_N;
    logic               DRAM_UDQM;
    logic               DRAM_WE_N;

    ///////// FAN /////////
    logic               FAN_CTRL;

    ///////// FPGA /////////
    logic               FPGA_I2C_SCLK;
    wire                FPGA_I2C_SDAT;

    ///////// GPIO /////////
    wire        [35:0]  GPIO_0;

    ///////// HEX0 /////////
    logic       [6:0]   HEX0;

    ///////// HEX1 /////////
    logic       [6:0]   HEX1;

    ///////// HEX2 /////////
    logic       [6:0]   HEX2;

    ///////// HEX3 /////////
    logic       [6:0]   HEX3;

    ///////// HEX4 /////////
    logic       [6:0]   HEX4;

    ///////// HEX5 /////////
    logic       [6:0]   HEX5;

    ///////// IRDA /////////
    logic               IRDA_RXD;
    logic               IRDA_TXD;

    ///////// KEY /////////
    logic       [3:0]   KEY;

    ///////// LEDR /////////
    logic       [9:0]   LEDR;

    ///////// PS2 /////////
    wire                PS2_CLK;
    wire                PS2_CLK2;
    wire                PS2_DAT;
    wire                PS2_DAT2;

    ///////// SW /////////
    logic       [9:0]   SW;

    ///////// TD /////////
    logic               TD_CLK27;
    logic       [7:0]   TD_DATA;
    logic               TD_HS;
    logic               TD_RESET_N;
    logic               TD_VS;

    ///////// VGA /////////
    logic       [7:0]   VGA_B;
    logic               VGA_BLANK_N;
    logic               VGA_CLK;
    logic       [7:0]   VGA_G;
    logic               VGA_HS;
    logic       [7:0]   VGA_R;
    logic               VGA_SYNC_N;
    logic               VGA_VS;
    
    //////////// GPIO1; GPIO1 connect to D5M - 5M Pixel Camera //////////
    logic       [11:0]  D5M_D;
    logic		        D5M_FVAL;
    logic		        D5M_LVAL;
    logic		        D5M_PIXLCLK;
    logic		        D5M_RESET_N;
    logic		        D5M_SCLK;
    wire		        D5M_SDATA;
    logic		        D5M_STROBE;
    logic		        D5M_TRIGGER;
    logic		        D5M_XCLKIN;

    /////////////////////////
    // END OF DUT SIGNALS //
    ///////////////////////

    //////////////////////////
    // INSTANTIATE THE DUT //
    ////////////////////////
    DE1_SoC_CAMERA DUT(
        .ADC_CS_N(ADC_CS_N),
        .ADC_DIN(ADC_DIN),
        .ADC_DOUT(ADC_DOUT),
        .ADC_SCLK(ADC_SCLK),
        .AUD_ADCDAT(AUD_ADCDAT),
        .AUD_ADCLRCK(AUD_ADCLRCK),
        .AUD_BCLK(AUD_BCLK),
        .AUD_DACDAT(AUD_DACDAT),
        .AUD_DACLRCK(AUD_DACLRCK),
        .AUD_XCK(AUD_XCK),
        .CLOCK2_50(CLOCK2_50),
        .CLOCK3_50(CLOCK3_50),
        .CLOCK4_50(CLOCK4_50),
        .CLOCK_50(CLOCK_50),
        .DRAM_ADDR(DRAM_ADDR),
        .DRAM_BA(DRAM_BA),
        .DRAM_CAS_N(DRAM_CAS_N),
        .DRAM_CKE(DRAM_CKE),
        .DRAM_CLK(DRAM_CLK),
        .DRAM_CS_N(DRAM_CS_N),
        .DRAM_DQ(DRAM_DQ),
        .DRAM_LDQM(DRAM_LDQM),
        .DRAM_RAS_N(DRAM_RAS_N),
        .DRAM_UDQM(DRAM_UDQM),
        .DRAM_WE_N(DRAM_WE_N),
        .FAN_CTRL(FAN_CTRL),
        .FPGA_I2C_SCLK(FPGA_I2C_SCLK),
        .FPGA_I2C_SDAT(FPGA_I2C_SDAT),
        .GPIO_0(GPIO_0),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5),
        .IRDA_RXD(IRDA_RXD),
        .IRDA_TXD(IRDA_TXD),
        .KEY(KEY),
        .LEDR(LEDR),
        .PS2_CLK(PS2_CLK),
        .PS2_CLK2(PS2_CLK2),
        .PS2_DAT(PS2_DAT),
        .PS2_DAT2(PS2_DAT2),
        .SW(SW),
        .TD_CLK27(TD_CLK27),
        .TD_DATA(TD_DATA),
        .TD_HS(TD_HS),
        .TD_RESET_N(TD_RESET_N),
        .TD_VS(TD_VS),
        .VGA_B(VGA_B),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_CLK(VGA_CLK),
        .VGA_G(VGA_G),
        .VGA_HS(VGA_HS),
        .VGA_R(VGA_R),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_VS(VGA_VS),
        .D5M_D(D5M_D),
        .D5M_FVAL(D5M_FVAL),
        .D5M_LVAL(D5M_LVAL),
        .D5M_PIXLCLK(D5M_PIXLCLK),
        .D5M_RESET_N(D5M_RESET_N),
        .D5M_SCLK(D5M_SCLK),
        .D5M_SDATA(D5M_SDATA),
        .D5M_STROBE(D5M_STROBE),
        .D5M_TRIGGER(D5M_TRIGGER),
        .D5M_XCLKIN(D5M_XCLKIN)
    );

    initial begin
        // Reset the DUT
        $display("Resetting DUT...");
        CLOCK_50 = 0;
        @(negedge CLOCK_50) KEY[0] = 1;
        @(negedge CLOCK_50) KEY[0] = 0; 
        $display("Successfully reset the DUT.");

        // Test that SW[1] chooses grayscale mode
        $display("////////////////////////////////\n// Testing grayscale mode... //\n//////////////////////////////");
        fork 
            begin: grayscale_to
                @(negedge CLOCK_50) SW[1] = 1;
                force DUT.mCCD_DATA = 12'h101;
                force DUT.mCCD_DVAL = 0;
                force DUT.X_Cont = 11'h000;
                force DUT.Y_Cont = 11'h000;
                $display("------------------------\nForced values:");
                $display("    mCCD_DATA: %h", DUT.mCCD_DATA);
                $display("    mCCD_DVAL: %b", DUT.mCCD_DVAL);
                $display("    X_Cont: %h", DUT.X_Cont);
                $display("    Y_Cont: %h", DUT.Y_Cont);
                $display("------------------------");
                @(negedge CLOCK_50);
                force DUT.mCCD_DVAL = 1;
                repeat(25000) @(posedge CLOCK_50);
                $display("  ERR: timeout reached waiting for grayscale mode to be switched on.");
                $stop();
            end: grayscale_to
            begin
                @(posedge DUT.mCCD_DVAL) begin
                    $display("Checking on valid signal that the selected pixel was swapped to our image_processing module...");
                    $display("------------------------");
                    if (DUT.sCCD_R !== DUT.sCCD_R_EDGE) begin
                        $display("  ERR: selected red pixel was not swapped.");
                        $stop();
                    end
                    $display("  Red pixel was swapped.");
                    if (DUT.sCCD_G !== DUT.sCCD_G_EDGE) begin
                        $display("  ERR: selected green pixel was not swapped.");
                        $stop();
                    end
                    $display("  Green pixel was swapped.");
                    if (DUT.sCCD_B !== DUT.sCCD_B_EDGE) begin
                        $display("  ERR: selected blue pixel was not swapped.");
                        $stop();
                    end
                    $display("  Blue pixel was swapped.");
                    $display("  SUCCESS: all selected pixels were swapped.");
                    $display("------------------------");
                    $display("Checking that the selected pixel was converted to grayscale...");
                    $display("------------------------");
                    if (DUT.u4_5.pixel_value !== DUT.u4_5.grayscale_pixel_value) begin
                        $display("  ERR: pixel value was not converted to grayscale.");
                        $stop();
                    end
                    $display("  Pixel value was converted to grayscale.");
                    if (DUT.u4_5.oRed !== DUT.u4_5.pixel_value) begin
                        $display("  ERR: red pixel was not converted to grayscale.");
                        $stop();
                    end
                    $display("  Red pixel was converted to grayscale.");
                    if (DUT.u4_5.oGreen !== DUT.u4_5.pixel_value) begin
                        $display("  ERR: green pixel was not converted to grayscale.");
                        $stop();
                    end
                    $display("  Green pixel was converted to grayscale.");
                    if (DUT.u4_5.oBlue !== DUT.u4_5.pixel_value) begin
                        $display("  ERR: blue pixel was not converted to grayscale.");
                        $stop();
                    end
                    $display("  Blue pixel was converted to grayscale.");
                    $display("  SUCCESS: all pixels were converted to grayscale.");
                    $display("------------------------");
                end
                disable grayscale_to;
                $display("//////////////////////////////////\n// Grayscale mode test passed. //\n////////////////////////////////");
            end
        join
        // Turn off grayscale mode
        $display("Setting SW[1] to 0 to turn off grayscale mode...");
        @(negedge CLOCK_50) SW[1] = 0;

        // Test that SW[1] off turns off grayscale mode and turns on RGB mode
        




        $stop();
    end

    always #1 CLOCK_50 = ~CLOCK_50; // Artificial clock signal

endmodule