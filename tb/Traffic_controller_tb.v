`timescale 1ns/1ps

module Traffic_controller_tb;
reg clk, rst;
wire [1:0] NS,EW;

Traffic_controller uut(
	.clk(clk),
	.rst(rst),
	.NS(NS),
	.EW(EW)
);

initial begin
	clk=0;
	forever #5 clk=~clk;
end

initial begin
	$monitor("\t Time=%0t \t clk=%b \t rst=%b \t NS=%b \t EW=%b ",$time,clk,rst,NS,EW);
	rst= 1'b0; #10;
	rst= 1'b1; #500;
	$finish;
end
endmodule

