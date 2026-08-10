`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: Nagaoka Power ElectronicsCo., Ltd.
// Engineer: Ohnuma
//
// Create Date:2021/08/05
// Target Device: Xc7s100fpga484-2
// Tool versions: Vivado 2021.1
// Description:
//    <Description here>
// Dependencies:
//    <Dependencies here>
// Revision:
//    <Code_revision_information>
// Additional Comments:
//    <Additional_comments>
////////////////////////////////////////////////////////////////////////////////

module HWGB_FADC(
    input CLK,
    input RST_,
	input HWGB_GTBCLEAR,
    input [4:1]  HWGB_CS_,
    input [11:0] HWGB_DATA_1,
    input [11:0] HWGB_DATA_2,
    input [11:0] HWGB_DATA_3,
    input [11:0] HWGB_DATA_4,
    input [11:0] HWGB_UPPER_1,
    input [11:0] HWGB_UPPER_2,
    input [11:0] HWGB_UPPER_3,
    input [11:0] HWGB_UPPER_4,
    input [11:0] HWGB_LOWER_1,
    input [11:0] HWGB_LOWER_2,
    input [11:0] HWGB_LOWER_3,
    input [11:0] HWGB_LOWER_4,
    input [3:0]  HWGB_QUALI_1,
    input [3:0]  HWGB_QUALI_2,
    input [3:0]  HWGB_QUALI_3,
    input [3:0]  HWGB_QUALI_4,
	output [3:0] HWGB_L1,
    output 		 HWGB_FADC
    );
	
	reg		GabClear_D1;
	reg		fadc_hwgb_1_L1,fadc_hwgb_2_L1,fadc_hwgb_3_L1,fadc_hwgb_4_L1;
	wire 	fadc_hwgb_1;
	wire 	fadc_hwgb_2;
	wire 	fadc_hwgb_3;
	wire 	fadc_hwgb_4;
	
	FADC_Protection FADC_Protection1
	(.CLK(CLK),
     .RST_(RST_),
     .FADC_CS_(HWGB_CS_[1]),
     .FADC_DATA(HWGB_DATA_1),
     .FADC_UPPER(HWGB_UPPER_1),
     .FADC_LOWER(HWGB_LOWER_1),
     .FADC_QUALI(HWGB_QUALI_1),
     .FADC_HWGB(fadc_hwgb_1)
	 );
	 
	FADC_Protection FADC_Protection2
	(.CLK(CLK),
     .RST_(RST_),
     .FADC_CS_(HWGB_CS_[2]),
     .FADC_DATA(HWGB_DATA_2),
     .FADC_UPPER(HWGB_UPPER_2),
     .FADC_LOWER(HWGB_LOWER_2),
     .FADC_QUALI(HWGB_QUALI_2),
     .FADC_HWGB(HWGB_hwgb_2)
	 );
	 
	FADC_Protection FADC_Protection3
	(.CLK(CLK),
     .RST_(RST_),
     .FADC_CS_(HWGB_CS_[3]),
     .FADC_DATA(HWGB_DATA_3),
     .FADC_UPPER(HWGB_UPPER_3),
     .FADC_LOWER(HWGB_LOWER_3),
     .FADC_QUALI(HWGB_QUALI_3),
     .FADC_HWGB(fadc_hwgb_3)
	 );

	FADC_Protection FADC_Protection4
	(.CLK(CLK),
     .RST_(RST_),
     .FADC_CS_(HWGB_CS_[4]),
     .FADC_DATA(HWGB_DATA_4),
     .FADC_UPPER(HWGB_UPPER_4),
     .FADC_LOWER(HWGB_LOWER_4),
     .FADC_QUALI(HWGB_QUALI_4),
     .FADC_HWGB(HWGB_hwgb_4)
	 );
	 
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			GabClear_D1 <= 0;
		end
		else begin 
			GabClear_D1 <= HWGB_GTBCLEAR;
		end
	end

	// Latching and GTBCLEAR control
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_hwgb_1_L1 <= 1'b0;
			fadc_hwgb_2_L1 <= 1'b0;
			fadc_hwgb_3_L1 <= 1'b0;
			fadc_hwgb_4_L1 <= 1'b0;
		end
		else if ( GabClear_D1 ) begin
			fadc_hwgb_1_L1 <= 1'b0;
			fadc_hwgb_2_L1 <= 1'b0;
			fadc_hwgb_3_L1 <= 1'b0;
			fadc_hwgb_4_L1 <= 1'b0;
		end
		else if ( fadc_hwgb_1 | fadc_hwgb_2 | fadc_hwgb_3 | fadc_hwgb_4 ) begin
			fadc_hwgb_1_L1 <= fadc_hwgb_1;
			fadc_hwgb_2_L1 <= fadc_hwgb_2;
			fadc_hwgb_3_L1 <= fadc_hwgb_3;
			fadc_hwgb_4_L1 <= fadc_hwgb_4;
		end
	end
	 
	 assign HWGB_L1 = { fadc_hwgb_4_L1, fadc_hwgb_3_L1, fadc_hwgb_2_L1, fadc_hwgb_1_L1 }; 
	 assign HWGB_FADC = fadc_hwgb_1 | fadc_hwgb_2 | fadc_hwgb_3 | fadc_hwgb_4;


endmodule
