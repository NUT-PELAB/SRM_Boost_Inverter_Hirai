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

module FpgaGateblock(
   input CLK,
   input RST_,
	input GTBCLEAR,
	input WDT_,
   input TRIP1_,
	input TRIP2_,
   output GTBLOCK_
    );
	
	reg			GabClear_D1;
	reg [15:0] 	wdtcount;
	reg			wdt_;
	reg			trip1__D1,trip1__D2,trip1__D3,trip1__D4,trip1__L1;
	reg			trip2__D1,trip2__D2,trip2__D3,trip2__D4,trip2__L1;
	wire			trip1__A1,trip2__A1;
	
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			GabClear_D1 <= 0;
		end
		else begin 
			GabClear_D1 <= GTBCLEAR;
		end
	end
	
	//Watchdog Timer
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			wdtcount <=  16'h0000;
		end
		else if(~WDT_) begin 
			wdtcount <=  16'h0000;
		end
		else begin
			wdtcount <= wdtcount + 1'b1;
		end
	end

	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			wdt_ <= 1'b1;
		end
		else if ( GabClear_D1 ) begin
			wdt_ <= 1'b1;
		end
		else if ( wdtcount >= 16'hF000 ) begin
			wdt_ <= 1'b0;
		end
	end
	
	//Trip1_
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			trip1__D1 <= 1'b1;
			trip1__D2 <= 1'b1;
			trip1__D3 <= 1'b1;
			trip1__D4 <= 1'b1;
		end
		else begin
			trip1__D4 <= trip1__D3;
			trip1__D3 <= trip1__D2;
			trip1__D2 <= trip1__D1;
			trip1__D1 <= TRIP1_;
		end
	end
	assign	trip1__A1 = trip1__D4 & trip1__D3;   
	// Latching and GTBCLEAR control
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			trip1__L1 <= 1'b1;
		end
		else if ( GabClear_D1 ) begin
			trip1__L1 <= 1'b1;
		end
		else if ( ~trip1__A1 ) begin
			trip1__L1 <= trip1__A1;
		end
	end

	//Trip2_
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			trip2__D1 <= 1'b1;
			trip2__D2 <= 1'b1;
			trip2__D3 <= 1'b1;
			trip2__D4 <= 1'b1;
		end
		else begin
			trip2__D4 <= trip2__D3;
			trip2__D3 <= trip2__D2;
			trip2__D2 <= trip2__D1;
			trip2__D1 <= TRIP2_;
		end
	end
	assign	trip2__A1 = trip2__D4 & trip2__D3;   
	// Latching and GTBCLEAR control
	always@( posedge CLK or negedge RST_ ) begin
		if ( ~RST_ ) begin
			trip2__L1 <= 1'b1;
		end
		else if ( GabClear_D1 ) begin
			trip2__L1 <= 1'b1;
		end
		else if ( ~trip2__A1 ) begin
			trip2__L1 <= trip2__A1;
		end
	end

	
	assign GTBLOCK_ = wdt_ & trip1__L1 & trip2__L1;
	

endmodule
