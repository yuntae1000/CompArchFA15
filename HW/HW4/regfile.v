//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------


module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

wire[31:0]	decodedline;

wire[31:0]	registeroutput0;
wire[31:0]	registeroutput1,registeroutput2,registeroutput3,registeroutput4,registeroutput5,registeroutput6,registeroutput7,registeroutput8,registeroutput9,registeroutput10,registeroutput11,registeroutput12,registeroutput13,registeroutput14,registeroutput15,registeroutput16,registeroutput17,registeroutput18,registeroutput19,registeroutput20,registeroutput21,registeroutput22,registeroutput23,registeroutput24,registeroutput25,registeroutput26,registeroutput27,registeroutput28,registeroutput29,registeroutput30,registeroutput31;


	// decoder Regwrite can be changed to something as which can enable decoder
	decoders1to32 Decoder(decodedline,RegWrite,WriteData);
	// register with 0 output
	register32zero RegisterZero(registeroutput0, WriteData, RegWrite, Clk);

	//register with its wrenable from decodedlines	
	register32 Register1(registeroutput1, WriteData, decodedline[1], Clk);
	register32 Register2(registeroutput2, WriteData, decodedline[2], Clk);
	register32 Register3(registeroutput3, WriteData, decodedline[3], Clk);
	register32 Register4(registeroutput4, WriteData, decodedline[4], Clk);
	register32 Register5(registeroutput5, WriteData, decodedline[5], Clk);
	register32 Register6(registeroutput6, WriteData, decodedline[6], Clk);
	register32 Register7(registeroutput7, WriteData, decodedline[7], Clk);
	register32 Register8(registeroutput8, WriteData, decodedline[8], Clk);
	register32 Register9(registeroutput9, WriteData, decodedline[9], Clk);
	register32 Register10(registeroutput10, WriteData, decodedline[10], Clk);
	register32 Register11(registeroutput11, WriteData, decodedline[11], Clk);
	register32 Register12(registeroutput12, WriteData, decodedline[12], Clk);
	register32 Register13(registeroutput13, WriteData, decodedline[13], Clk);
	register32 Register14(registeroutput14, WriteData, decodedline[14], Clk);
	register32 Register15(registeroutput15, WriteData, decodedline[15], Clk);
	register32 Register16(registeroutput16, WriteData, decodedline[16], Clk);
	register32 Register17(registeroutput17, WriteData, decodedline[17], Clk);
	register32 Register18(registeroutput18, WriteData, decodedline[18], Clk);
	register32 Register19(registeroutput19, WriteData, decodedline[19], Clk);
	register32 Register20(registeroutput20, WriteData, decodedline[20], Clk);
	register32 Register21(registeroutput21, WriteData, decodedline[21], Clk);
	register32 Register22(registeroutput22, WriteData, decodedline[22], Clk);
	register32 Register23(registeroutput23, WriteData, decodedline[23], Clk);
	register32 Register24(registeroutput24, WriteData, decodedline[24], Clk);
	register32 Register25(registeroutput25, WriteData, decodedline[25], Clk);
	register32 Register26(registeroutput26, WriteData, decodedline[26], Clk);
	register32 Register27(registeroutput27, WriteData, decodedline[27], Clk);
	register32 Register28(registeroutput28, WriteData, decodedline[28], Clk);
	register32 Register29(registeroutput29, WriteData, decodedline[29], Clk);
	register32 Register30(registeroutput30, WriteData, decodedline[30], Clk);
	register32 Register31(registeroutput31, WriteData, decodedline[31], Clk);
	
	//Read MUX
	mux32to1by32 Mux1(ReadData1, ReadRegister1, registeroutput0, registeroutput1,registeroutput2,registeroutput3,registeroutput4,registeroutput5,registeroutput6,registeroutput7,registeroutput8,registeroutput9,registeroutput10,registeroutput11,registeroutput12,registeroutput13,registeroutput14,registeroutput15,registeroutput16,registeroutput17,registeroutput18,registeroutput19,registeroutput20,registeroutput21,registeroutput22,registeroutput23,registeroutput24,registeroutput25,registeroutput26,registeroutput27,registeroutput28,registeroutput29,registeroutput30,registeroutput31);
	muxreto1by32 Mux2(ReadData2, ReadRegister2, registeroutput0, registeroutput1,registeroutput2,registeroutput3,registeroutput4,registeroutput5,registeroutput6,registeroutput7,registeroutput8,registeroutput9,registeroutput10,registeroutput11,registeroutput12,registeroutput13,registeroutput14,registeroutput15,registeroutput16,registeroutput17,registeroutput18,registeroutput19,registeroutput20,registeroutput21,registeroutput22,registeroutput23,registeroutput24,registeroutput25,registeroutput26,registeroutput27,registeroutput28,registeroutput29,registeroutput30,registeroutput31);


    
  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
  assign ReadData1 = 42;
  assign ReadData2 = 42;

endmodule