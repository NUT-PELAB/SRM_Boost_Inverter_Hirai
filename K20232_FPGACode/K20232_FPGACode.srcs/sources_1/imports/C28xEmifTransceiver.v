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


`define	SPRCODE 16'h579a

module C28xEmifTransceiver (
	input CLK,
	input RST_,
    input [8:0] A_BUS,
    inout [15:0] D_BUS,
    input OE_,
    input CS_,
    input WE_,
    output [15:0] REG_ARRY_OUT_0,
    output [15:0] REG_ARRY_OUT_1,
    output [15:0] REG_ARRY_OUT_2,
    output [15:0] REG_ARRY_OUT_3,
    output [15:0] REG_ARRY_OUT_4,
    output [15:0] REG_ARRY_OUT_5,
    output [15:0] REG_ARRY_OUT_6,
    output [15:0] REG_ARRY_OUT_7,
    output [15:0] REG_ARRY_OUT_8,
    output [15:0] REG_ARRY_OUT_9,
    output [15:0] REG_ARRY_OUT_a,
    output [15:0] REG_ARRY_OUT_b,
    output [15:0] REG_ARRY_OUT_c,
    output [15:0] REG_ARRY_OUT_d,
    output [15:0] REG_ARRY_OUT_e,
    output [15:0] REG_ARRY_OUT_f,
    output [15:0] REG_ARRY_OUT_10,
    output [15:0] REG_ARRY_OUT_11,
    output [15:0] REG_ARRY_OUT_12,
    output [15:0] REG_ARRY_OUT_13,
    output [15:0] REG_ARRY_OUT_14,
    output [15:0] REG_ARRY_OUT_15,
    output [15:0] REG_ARRY_OUT_16,
    output [15:0] REG_ARRY_OUT_17,
    output [15:0] REG_ARRY_OUT_18,
    output [15:0] REG_ARRY_OUT_19,
    output [15:0] REG_ARRY_OUT_1a,
    output [15:0] REG_ARRY_OUT_1b,
    output [15:0] REG_ARRY_OUT_1c,
    output [15:0] REG_ARRY_OUT_1d,
    output [15:0] REG_ARRY_OUT_1e,
    output [15:0] REG_ARRY_OUT_1f,
    output [15:0] REG_ARRY_OUT_20,
    output [15:0] REG_ARRY_OUT_21,
    output [15:0] REG_ARRY_OUT_22,
    output [15:0] REG_ARRY_OUT_23,
    output [15:0] REG_ARRY_OUT_24,
    output [15:0] REG_ARRY_OUT_25,
    output [15:0] REG_ARRY_OUT_26,
    output [15:0] REG_ARRY_OUT_27,
    output [15:0] REG_ARRY_OUT_28,
    output [15:0] REG_ARRY_OUT_29,
    output [15:0] REG_ARRY_OUT_2a,
    output [15:0] REG_ARRY_OUT_2b,
    output [15:0] REG_ARRY_OUT_2c,
    output [15:0] REG_ARRY_OUT_2d,
    output [15:0] REG_ARRY_OUT_2e,
    output [15:0] REG_ARRY_OUT_2f,
    output [15:0] REG_ARRY_OUT_30,
    output [15:0] REG_ARRY_OUT_31,
    output [15:0] REG_ARRY_OUT_32,
    output [15:0] REG_ARRY_OUT_33,
    output [15:0] REG_ARRY_OUT_34,
    output [15:0] REG_ARRY_OUT_35,
    output [15:0] REG_ARRY_OUT_36,
    output [15:0] REG_ARRY_OUT_37,
    output [15:0] REG_ARRY_OUT_38,
    output [15:0] REG_ARRY_OUT_39,
    output [15:0] REG_ARRY_OUT_3a,
    output [15:0] REG_ARRY_OUT_3b,
    output [15:0] REG_ARRY_OUT_3c,
    output [15:0] REG_ARRY_OUT_3d,
    output [15:0] REG_ARRY_OUT_3e,
    output [15:0] REG_ARRY_OUT_3f,
    input [15:0] REG_MAPPED_PORT_DATA_IN_40,
    input [15:0] REG_MAPPED_PORT_DATA_IN_41,
    input [15:0] REG_MAPPED_PORT_DATA_IN_42,
    input [15:0] REG_MAPPED_PORT_DATA_IN_43,
    input [15:0] REG_MAPPED_PORT_DATA_IN_44,
    input [15:0] REG_MAPPED_PORT_DATA_IN_45,
    input [15:0] REG_MAPPED_PORT_DATA_IN_46,
    input [15:0] REG_MAPPED_PORT_DATA_IN_47,
    input [15:0] REG_MAPPED_PORT_DATA_IN_48,
    input [15:0] REG_MAPPED_PORT_DATA_IN_49,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4a,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4b,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4c,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4d,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4e,
    input [15:0] REG_MAPPED_PORT_DATA_IN_4f,
    output REG_MAPPED_PORT_HEADER_OUT_40,
    output REG_MAPPED_PORT_HEADER_OUT_41,
    output REG_MAPPED_PORT_HEADER_OUT_42,
    output REG_MAPPED_PORT_HEADER_OUT_43,
    output REG_MAPPED_PORT_HEADER_OUT_44,
    output REG_MAPPED_PORT_HEADER_OUT_45,
    output REG_MAPPED_PORT_HEADER_OUT_46,
    output REG_MAPPED_PORT_HEADER_OUT_47,
    output REG_MAPPED_PORT_HEADER_OUT_48,
    output REG_MAPPED_PORT_HEADER_OUT_49,
    output REG_MAPPED_PORT_HEADER_OUT_4a,
    output REG_MAPPED_PORT_HEADER_OUT_4b,
    output REG_MAPPED_PORT_HEADER_OUT_4c,
    output REG_MAPPED_PORT_HEADER_OUT_4d,
    output REG_MAPPED_PORT_HEADER_OUT_4e,
    output REG_MAPPED_PORT_HEADER_OUT_4f,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_40,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_41,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_42,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_43,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_44,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_45,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_46,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_47,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_48,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_49,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4a,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4b,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4c,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4d,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4e,
    output [15:0] REG_MAPPED_PORT_DATA_OUT_4f,
	output test1,
	output test2
    );
	
	wire [15:0] reg_mapped_data_in [0:15];
	reg [15:0]	reg_mapped_header_out;
	reg [15:0] 	reg_mapped_data_out [0:15];
	reg [15:0] 	reg_arry_out [0:63];
	reg [15:0]	a_bus_D1,a_bus_D2;
	reg [15:0]	d_bus_D1,d_bus_D2;
	reg			cs__D1,cs__D2;
	reg			we__D1,we__D2;
	reg			flg_data_held;
	reg	[15:0]	addr_hold;
	reg	[15:0]	data_hold;
	reg			valid_gregspr;

	wire [15:0] in_d_bus;
	wire [15:0] out_d_bus;
	
	wire		test1,test2;
	assign test1 = valid_gregspr;
	assign test2 = flg_data_held;

	assign REG_ARRY_OUT_0  = reg_arry_out[0];
	assign REG_ARRY_OUT_1  = reg_arry_out[1];
	assign REG_ARRY_OUT_2  = reg_arry_out[2];
	assign REG_ARRY_OUT_3  = reg_arry_out[3];
	assign REG_ARRY_OUT_4  = reg_arry_out[4];
	assign REG_ARRY_OUT_5  = reg_arry_out[5];
	assign REG_ARRY_OUT_6  = reg_arry_out[6];
	assign REG_ARRY_OUT_7  = reg_arry_out[7];
	assign REG_ARRY_OUT_8  = reg_arry_out[8];
	assign REG_ARRY_OUT_9  = reg_arry_out[9];
	assign REG_ARRY_OUT_a  = reg_arry_out[10];
	assign REG_ARRY_OUT_b  = reg_arry_out[11];
	assign REG_ARRY_OUT_c  = reg_arry_out[12];
	assign REG_ARRY_OUT_d  = reg_arry_out[13];
	assign REG_ARRY_OUT_e  = reg_arry_out[14];
	assign REG_ARRY_OUT_f  = reg_arry_out[15];
	assign REG_ARRY_OUT_10 = reg_arry_out[16];
	assign REG_ARRY_OUT_11 = reg_arry_out[17];
	assign REG_ARRY_OUT_12 = reg_arry_out[18];
	assign REG_ARRY_OUT_13 = reg_arry_out[19];
	assign REG_ARRY_OUT_14 = reg_arry_out[20];
	assign REG_ARRY_OUT_15 = reg_arry_out[21];
	assign REG_ARRY_OUT_16 = reg_arry_out[22];
	assign REG_ARRY_OUT_17 = reg_arry_out[23];
	assign REG_ARRY_OUT_18 = reg_arry_out[24];
	assign REG_ARRY_OUT_19 = reg_arry_out[25];
	assign REG_ARRY_OUT_1a = reg_arry_out[26];
	assign REG_ARRY_OUT_1b = reg_arry_out[27];
	assign REG_ARRY_OUT_1c = reg_arry_out[28];
	assign REG_ARRY_OUT_1d = reg_arry_out[29];
	assign REG_ARRY_OUT_1e = reg_arry_out[30];
	assign REG_ARRY_OUT_1f = reg_arry_out[31];
	assign REG_ARRY_OUT_20 = reg_arry_out[32];
	assign REG_ARRY_OUT_21 = reg_arry_out[33];
	assign REG_ARRY_OUT_22 = reg_arry_out[34];
	assign REG_ARRY_OUT_23 = reg_arry_out[35];
	assign REG_ARRY_OUT_24 = reg_arry_out[36];
	assign REG_ARRY_OUT_25 = reg_arry_out[37];
	assign REG_ARRY_OUT_26 = reg_arry_out[38];
	assign REG_ARRY_OUT_27 = reg_arry_out[39];
	assign REG_ARRY_OUT_28 = reg_arry_out[40];
	assign REG_ARRY_OUT_29 = reg_arry_out[41];
	assign REG_ARRY_OUT_2a = reg_arry_out[42];
	assign REG_ARRY_OUT_2b = reg_arry_out[43];
	assign REG_ARRY_OUT_2c = reg_arry_out[44];
	assign REG_ARRY_OUT_2d = reg_arry_out[45];
	assign REG_ARRY_OUT_2e = reg_arry_out[46];
	assign REG_ARRY_OUT_2f = reg_arry_out[47];
	assign REG_ARRY_OUT_30 = reg_arry_out[48];
	assign REG_ARRY_OUT_31 = reg_arry_out[49];
	assign REG_ARRY_OUT_32 = reg_arry_out[50];
	assign REG_ARRY_OUT_33 = reg_arry_out[51];
	assign REG_ARRY_OUT_34 = reg_arry_out[52];
	assign REG_ARRY_OUT_35 = reg_arry_out[53];
	assign REG_ARRY_OUT_36 = reg_arry_out[54];
	assign REG_ARRY_OUT_37 = reg_arry_out[55];
	assign REG_ARRY_OUT_38 = reg_arry_out[56];
	assign REG_ARRY_OUT_39 = reg_arry_out[57];
	assign REG_ARRY_OUT_3a = reg_arry_out[58];
	assign REG_ARRY_OUT_3b = reg_arry_out[59];
	assign REG_ARRY_OUT_3c = reg_arry_out[60];
	assign REG_ARRY_OUT_3d = reg_arry_out[61];
	assign REG_ARRY_OUT_3e = reg_arry_out[62];
	assign REG_ARRY_OUT_3f = reg_arry_out[63];

	assign reg_mapped_data_in[0] = REG_MAPPED_PORT_DATA_IN_40;
	assign reg_mapped_data_in[1] = REG_MAPPED_PORT_DATA_IN_41;
	assign reg_mapped_data_in[2] = REG_MAPPED_PORT_DATA_IN_42;
	assign reg_mapped_data_in[3] = REG_MAPPED_PORT_DATA_IN_43;
	assign reg_mapped_data_in[4] = REG_MAPPED_PORT_DATA_IN_44;
	assign reg_mapped_data_in[5] = REG_MAPPED_PORT_DATA_IN_45;
	assign reg_mapped_data_in[6] = REG_MAPPED_PORT_DATA_IN_46;
	assign reg_mapped_data_in[7] = REG_MAPPED_PORT_DATA_IN_47;
	assign reg_mapped_data_in[8] = REG_MAPPED_PORT_DATA_IN_48;
	assign reg_mapped_data_in[9] = REG_MAPPED_PORT_DATA_IN_49;
	assign reg_mapped_data_in[10] = REG_MAPPED_PORT_DATA_IN_4a;
	assign reg_mapped_data_in[11] = REG_MAPPED_PORT_DATA_IN_4b;
	assign reg_mapped_data_in[12] = REG_MAPPED_PORT_DATA_IN_4c;
	assign reg_mapped_data_in[13] = REG_MAPPED_PORT_DATA_IN_4d;
	assign reg_mapped_data_in[14] = REG_MAPPED_PORT_DATA_IN_4e;
	assign reg_mapped_data_in[15] = REG_MAPPED_PORT_DATA_IN_4f;
	
	assign REG_MAPPED_PORT_HEADER_OUT_40 = reg_mapped_header_out[0];
	assign REG_MAPPED_PORT_HEADER_OUT_41 = reg_mapped_header_out[1];
	assign REG_MAPPED_PORT_HEADER_OUT_42 = reg_mapped_header_out[2];
	assign REG_MAPPED_PORT_HEADER_OUT_43 = reg_mapped_header_out[3];
	assign REG_MAPPED_PORT_HEADER_OUT_44 = reg_mapped_header_out[4];
	assign REG_MAPPED_PORT_HEADER_OUT_45 = reg_mapped_header_out[5];
	assign REG_MAPPED_PORT_HEADER_OUT_46 = reg_mapped_header_out[6];
	assign REG_MAPPED_PORT_HEADER_OUT_47 = reg_mapped_header_out[7];
	assign REG_MAPPED_PORT_HEADER_OUT_48 = reg_mapped_header_out[8];
	assign REG_MAPPED_PORT_HEADER_OUT_49 = reg_mapped_header_out[9];
	assign REG_MAPPED_PORT_HEADER_OUT_4a = reg_mapped_header_out[10];
	assign REG_MAPPED_PORT_HEADER_OUT_4b = reg_mapped_header_out[11];
	assign REG_MAPPED_PORT_HEADER_OUT_4c = reg_mapped_header_out[12];
	assign REG_MAPPED_PORT_HEADER_OUT_4d = reg_mapped_header_out[13];
	assign REG_MAPPED_PORT_HEADER_OUT_4e = reg_mapped_header_out[14];
	assign REG_MAPPED_PORT_HEADER_OUT_4f = reg_mapped_header_out[15];
	assign REG_MAPPED_PORT_DATA_OUT_40 = reg_mapped_data_out[0];
	assign REG_MAPPED_PORT_DATA_OUT_41 = reg_mapped_data_out[1];
	assign REG_MAPPED_PORT_DATA_OUT_42 = reg_mapped_data_out[2];
	assign REG_MAPPED_PORT_DATA_OUT_43 = reg_mapped_data_out[3];
	assign REG_MAPPED_PORT_DATA_OUT_44 = reg_mapped_data_out[4];
	assign REG_MAPPED_PORT_DATA_OUT_45 = reg_mapped_data_out[5];
	assign REG_MAPPED_PORT_DATA_OUT_46 = reg_mapped_data_out[6];
	assign REG_MAPPED_PORT_DATA_OUT_47 = reg_mapped_data_out[7];
	assign REG_MAPPED_PORT_DATA_OUT_48 = reg_mapped_data_out[8];
	assign REG_MAPPED_PORT_DATA_OUT_49 = reg_mapped_data_out[9];
	assign REG_MAPPED_PORT_DATA_OUT_4a = reg_mapped_data_out[10];
	assign REG_MAPPED_PORT_DATA_OUT_4b = reg_mapped_data_out[11];
 	assign REG_MAPPED_PORT_DATA_OUT_4c = reg_mapped_data_out[12];
 	assign REG_MAPPED_PORT_DATA_OUT_4d = reg_mapped_data_out[13];
 	assign REG_MAPPED_PORT_DATA_OUT_4e = reg_mapped_data_out[14];
 	assign REG_MAPPED_PORT_DATA_OUT_4f = reg_mapped_data_out[15];
	
	//Data reading of FPGA to DSP 
	assign out_d_bus = (A_BUS < 16'h0040)? reg_arry_out[A_BUS]:
						 ((A_BUS >= 16'h0040) & (A_BUS < 16'h0050))? reg_mapped_data_in[(A_BUS-64)]:16'hxxxx;

	assign in_d_bus = D_BUS;
	assign D_BUS = ((WE_) & (~OE_) & (~CS_)) ? out_d_bus : 16'hzzzz;


	// Data writing of DSP to FPGA 
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			a_bus_D1	<= 16'h0000;
			a_bus_D2	<= 16'h0000;
			d_bus_D1	<= 16'h0000;
			d_bus_D2	<= 16'h0000;
			cs__D2		<= 1'b1;
			cs__D1		<= 1'b1;
			we__D1		<= 1'b1;
			we__D2		<= 1'b1;
		end
		else begin
			a_bus_D2	<= a_bus_D1;
			a_bus_D1	<= { 7'b0000000, A_BUS };
			d_bus_D2	<= d_bus_D1;
			d_bus_D1 	<= in_d_bus;
			cs__D2 		<= cs__D1;
			cs__D1 		<= CS_;
			we__D2		<= we__D1;
			we__D1		<= WE_;
		end
	end
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			flg_data_held	<= 1'b0;
			addr_hold		<= 16'h0000;
			data_hold		<= 16'h0000;
		end
		else if (~cs__D2 & we__D1 & ~we__D2) begin
			addr_hold		<= a_bus_D2;
			data_hold		<= d_bus_D2;
			flg_data_held	<= 1'b1;
		end
		else begin
			flg_data_held	<= 1'b0;
		end
	end

	integer j;
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			for (j=0; j<64; j=j+1) begin
				reg_arry_out[j] <= 16'h0000;
			end			for (j=0; j<16; j=j+1) begin
				reg_mapped_header_out[j] <= 1'b0;
				reg_mapped_data_out[j] <= 16'h0000;
			end
				
		end
		else if (flg_data_held) begin
			if (addr_hold == 16'h0000) begin
				reg_arry_out[addr_hold] <= data_hold;
			end
			else if ((addr_hold < 16'h0040) & (valid_gregspr)) begin
				reg_arry_out[addr_hold] <= data_hold;
			end
			else if  ((addr_hold < 16'h0050) & (valid_gregspr)) begin
				reg_mapped_header_out[addr_hold - 16'h0040] <= 1'b1;
				reg_mapped_data_out[addr_hold - 16'h0040] <= data_hold;
			end
		end
		else begin
			if (reg_arry_out[0] == `SPRCODE) begin
				valid_gregspr <= 1'b1;
			end
			else begin
				valid_gregspr <= 1'b0;
			end
			reg_mapped_header_out[addr_hold - 16'h0040] <= 1'b0;
		end
	end

endmodule
