// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
  // Your adder code here
wire carryout0, axorb, carryin0;
`AND andgate0(carryout0, a, b);
`XOR xorgate0(axorb,a,b);
`XOR xorgate1(out, axorb, carryin);
`AND andgate1(carryin0, axorb, carryin);
`OR orgate0(carryout, carryout0, carryin0);

endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//behavioralFullAdder adder (sum, carryout, a, b, carryin);
structuralFullAdder adder(sum, carryout, a, b, carryin);

initial begin
$display("A  B Carryin| Carryout Sum");
a=0;b=0; carryin=0; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=0;b=1; carryin=0; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=1;b=0; carryin=0; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=1;b=1; carryin=0; #1000
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=0;b=0; carryin=1; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=0;b=1; carryin=1; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=1;b=0; carryin=1; #1000 
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);
a=1;b=1; carryin=1; #1000
$display("%b  %b   %b    |     %b     %b", a, b, carryin, carryout, sum);

end
endmodule
