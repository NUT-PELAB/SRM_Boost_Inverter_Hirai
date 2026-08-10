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

module FastAdConverter(
    input CLK,
    input RST_,
    input [4:1] FADC_SDO,
	input FADC_START,
	output FADC_SCK,
    output [4:1] FADC_CS_,
    output [11:0] FADC_DATA_1,
    output [11:0] FADC_DATA_2,
    output [11:0] FADC_DATA_3,
    output [11:0] FADC_DATA_4
    );
	
	reg [4:1] 	fadc_cs_;
	reg [11:0] 	fad_data_1;
	reg [11:0] 	fad_data_2;
	reg [11:0] 	fad_data_3;
	reg [11:0]	fad_data_4;

	reg [15:0]	rcvReg_1;
	reg [15:0]	rcvReg_2;
	reg [15:0]	rcvReg_3;
	reg [15:0]	rcvReg_4;

	reg [4:0] 	cntReg;
	reg [2:0]	fadc_sck_count;
	reg 		fadc_sck_D1;

	wire fadc_sck_NA1;
	wire convCheck;

	
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_sck_count <= 3'b100;
		end
		else begin 
			fadc_sck_count <= fadc_sck_count + 1'b1;
		end
	end
	
	//立ち下がり検出用D_FF
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_sck_D1 <= 1'b1;
		end
		else begin 
			fadc_sck_D1 <= fadc_sck_count[2];
		end
	end
	//立ち下がり検出　反転してAND
	assign fadc_sck_NA1 = fadc_sck_D1 & ~fadc_sck_count[2] ;


	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_cs_ 	<= 4'b1111;
			cntReg 		<= 5'b10000;
		end
		else if (fadc_sck_NA1) begin 
			if (~FADC_START) begin 
				fadc_cs_ 	<= 4'b1111;
				cntReg 		<= 5'b10000;
			end		
			else if (cntReg == 4'b0000) begin
				if (convCheck) begin
					fad_data_1	<= rcvReg_1[13:2];
					fad_data_2	<= rcvReg_2[13:2];
					fad_data_3	<= rcvReg_3[13:2];
					fad_data_4	<= rcvReg_4[13:2];
				end
				fadc_cs_ 	<= 4'b1111;
				cntReg 		<= 5'b10000;
			end
			else if (fadc_cs_ == 4'b1111) begin
				fadc_cs_ 		<= 4'b0000;
			end
			else begin
				rcvReg_1[15:0] 	<= {rcvReg_1[14:0],FADC_SDO[1]};
				rcvReg_2[15:0] 	<= {rcvReg_2[14:0],FADC_SDO[2]};
				rcvReg_3[15:0] 	<= {rcvReg_3[14:0],FADC_SDO[3]};
				rcvReg_4[15:0] 	<= {rcvReg_4[14:0],FADC_SDO[4]};
				cntReg 			<= cntReg - 1'b1;
			end
		end
	end

	assign convCheck = ~(rcvReg_1[15] | rcvReg_1[14] |
						 rcvReg_1[1]  | rcvReg_1[0]  |
						 rcvReg_2[15] | rcvReg_2[14] |
						 rcvReg_2[1]  | rcvReg_2[0]  |
						 rcvReg_3[15] | rcvReg_3[14] |
						 rcvReg_3[1]  | rcvReg_3[0]  |
						 rcvReg_4[15] | rcvReg_4[14] |
						 rcvReg_4[1]  | rcvReg_4[0]  );

	assign FADC_SCK		= fadc_sck_count[2];
	assign FADC_CS_		= fadc_cs_;
	assign FADC_DATA_1	= fad_data_1; 
	assign FADC_DATA_2	= fad_data_2; 
	assign FADC_DATA_3	= fad_data_3; 
	assign FADC_DATA_4	= fad_data_4;
	
	
	

endmodule
