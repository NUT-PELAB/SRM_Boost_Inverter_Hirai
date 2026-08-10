`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:30 05/03/2018 
// Design Name: 
// Module Name:    FADC_Protection 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FADC_Protection(
	input			CLK,
    input 			RST_,
    input 			FADC_CS_,
    input [11:0] 	FADC_DATA,
    input [11:0] 	FADC_UPPER,
    input [11:0] 	FADC_LOWER,
    input [3:0] 	FADC_QUALI,
    output 			FADC_HWGB
    );

	reg				fadc_cs__D1;
	reg	[11:0]		fadc_data_D1;
	reg	[11:0]		fadc_upper_D1; 				
	reg	[11:0]		fadc_lower_D1;
	reg	[3:0]		fadc_quali_D1;
	reg [3:0]		countOver;
	reg				fadc_hwgb;
	
	wire			fadc_cs__NA1;
	
	//立ち下がり検出用D_FF
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_cs__D1 <= 1'b1;
		end
		else begin 
			fadc_cs__D1 <= FADC_CS_;
		end
	end
	//立ち下がり検出　反転してAND
	assign fadc_cs__NA1 = fadc_cs__D1 & ~FADC_CS_ ;


	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			fadc_data_D1  	<= 12'h800;
			fadc_upper_D1 	<= 12'hFFF;
			fadc_lower_D1 	<= 12'h000;
			fadc_quali_D1 	<=  4'hF;
			countOver 	  	<= 4'h0;
			fadc_hwgb 		<= 1'b0;

		end
		else if (fadc_cs__NA1) begin 
			fadc_data_D1  <= FADC_DATA;
			fadc_upper_D1 <= FADC_UPPER;
			fadc_lower_D1 <= FADC_LOWER;
			fadc_quali_D1 <= FADC_QUALI;

			if ((fadc_data_D1 > fadc_upper_D1) | (fadc_data_D1 < fadc_lower_D1)) begin
				countOver <= countOver + 1'b1;
			end
			else begin
				countOver <= 4'h0;
			end
			
			if (countOver >= fadc_quali_D1) begin
				fadc_hwgb <= 1'b1;
			end
			else begin
				fadc_hwgb <= 1'b0;
			end
		end
	end
	
	assign FADC_HWGB = fadc_hwgb;

endmodule
