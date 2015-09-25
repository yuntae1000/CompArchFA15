// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
  // Your multiplexer code here
wire na0, na1;
wire out0, out1, out2, out3;
`NOT a0inv(na0,address0);
`NOT a1inv(na1, address1);
`AND andgate0(out0, in0, na0, na1);
`AND andgate1(out1, in1, address0, na1);
`AND andgate2(out2, in2, na0, address1);
`AND andgate3(out3, in3, address0, address1);
`OR orgate(out, out0, out1, out2, out3);
endmodule


module testMultiplexer;
reg in0, in1, in2, in3;
reg addr0, addr1;
wire out;
//behavioralMultiplexer mux(out, addr0,addr1, in0,in1,in2,in3);
structuralMultiplexer mux(out, addr0,addr1, in0,in1,in2,in3);

initial begin
$display("A0 A1| In0  In1  In2  In3 | Expected Output | Output");
addr0=0;addr1=0; in0=1;in1=0;in2=0;in3=0;  #1000 
$display("%b  %b|  %b  %b  %b  %b |      In0      |  %b", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0; in0=0;in1=1;in2=0;in3=0;  #1000 
$display("%b  %b|  %b  %b  %b  %b |      In1      |  %b", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1; in0=0;in1=0;in2=1;in3=0;  #1000 
$display("%b  %b|  %b  %b  %b  %b |      In2      |  %b", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1; in0=0;in1=0;in2=0;in3=1;  #1000 
$display("%b  %b|  %b  %b  %b  %b |      In3      |  %b", addr0, addr1, in0, in1, in2, in3, out);
end
endmodule
