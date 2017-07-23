module cpu (
  output [7:0]  led,
  output [15:0] seg0,
  output [15:0] seg1,
  output [15:0] seg2,
  output [15:0] seg3,
  output [15:0] seg4,
  output [15:0] seg5,
  output [15:0] seg6,
  output [15:0] seg7,
  output [15:0] seg8,
  output [15:0] seg9,
  output [15:0] sega,
  output [15:0] segb,
  output [15:0] segc,
  output [15:0] segd,
  output [15:0] sege,
  output [15:0] segf,
  input  start,
  input  stop,
  input  CLK,
  input  RSTN
  );

  wire [3:0] ph0;
  wire  [15:0] w_imem0;
  wire [15:0] w_dmem0;
  wire [15:0] w_pc0, w_ir0, w_sr1_0, w_sr2_0, w_alu0, w_dr0;
  wire [15:0] r0_0, r1_0, r2_0, r3_0, r4_0, r5_0, r6_0, r7_0;
  wire write_dr0, write_dmem0, write_pc0, write_reg0;
  wire [15:0] w_d0;
  
  wire [3:0] ph1;
  wire  [15:0] w_imem1;
  wire [15:0] w_dmem1;
  wire [15:0] w_pc1, w_ir1, w_sr1_1, w_sr2_1, w_alu1, w_dr1;
  wire [15:0] r0_1, r1_1, r2_1, r3_1, r4_1, r5_1, r6_1, r7_1;
  wire write_dr1, write_dmem1, write_pc1, write_reg1;
  wire [15:0] w_d1;
  
  wire [3:0] ph2;
  wire  [15:0] w_imem2;
  wire [15:0] w_dmem2;
  wire [15:0] w_pc2, w_ir2, w_sr1_2, w_sr2_2, w_alu2, w_dr2;
  wire [15:0] r0_2, r1_2, r2_2, r3_2, r4_2, r5_2, r6_2, r7_2;
  wire write_dr2, write_dmem2, write_pc2, write_reg2;
  wire [15:0] w_d2;
  
  wire [3:0] ph3;
  wire  [15:0] w_imem3;
  wire [15:0] w_dmem3; 
  wire [15:0] w_pc3, w_ir3, w_sr1_3, w_sr2_3, w_alu3, w_dr3;
  wire [15:0] r0_3, r1_3, r2_3, r3_3, r4_3, r5_3, r6_3, r7_3;
  wire write_dr3, write_dmem3, write_pc3, write_reg3;
  wire [15:0] w_d3;
  
  assign led = {4'b0000, ph3[3:0]}; // Core3
  assign seg0 = r0_3;
  assign seg1 = r1_3;
  assign seg2 = r2_3;
  assign seg3 = r3_3;
  assign seg4 = r4_3;
  assign seg5 = r5_3;
  assign seg6 = r6_3;
  assign seg7 = r7_3;
  assign seg8 = w_pc3;
  assign seg9 = w_ir3;
  assign sega = w_sr1_3;
  assign segb = w_sr2_3;
  assign segc = w_alu3;
  assign segd = w_d3;
  assign sege = 16'h0000;
  assign segf = 16'h0000;
  
  assign write_dr0 = ph0[2] && 
          (w_ir0[15:14]==2'b00) && (w_ir0[7:0]==8'b00000001);
			 //LD:load
			 
  assign write_dmem0 = ph0[2] && 
          (w_ir0[15:11]==5'b00000) && (w_ir0[4:0]==5'b00000); 
			 //ST:wren
			 
  assign write_pc0 = ph0[3] && 
          ((w_ir0[15:8]==8'b10000000)
			 || (w_ir0[15:11]==5'b10010)
          || (w_ir0[15:11]==5'b10001)); 
			 //B,BNZ,BZ:load
			 
  assign write_reg0 = ph0[3] && (
          ((w_ir0[15:14]==2'b00) && (w_ir0[7:0]==8'b00000001))
          || ((w_ir0[15:14]==2'b00) && (w_ir0[4:0]==5'b00010))
			 || ((w_ir0[15:14]==2'b00) && (w_ir0[4:0]==5'b00100)) 
			 || ((w_ir0[15:14]==2'b00) && (w_ir0[4:0]==5'b00101))
			 || (w_ir0[15:14]==2'b11)
			 || ((w_ir0[15:14]==2'b01) && (w_ir0[10:8]==3'b000))); 
			 //LD,LI,ADD,ADDi,CMP,MLT:load
			 
  assign w_d0 = ((w_ir0[15:14]==2'b00) && 
          (w_ir0[7:0]==8'b00000001)) ? w_dr0 : w_alu0; 
			 //MUX	
  
  assign write_dr1 = ph1[2] && (w_ir1[15:14]==2'b00) && (w_ir1[7:0]==8'b00000001); //LD:load
  assign write_dmem1 = ph1[2] && (w_ir1[15:11]==5'b00000) && (w_ir1[4:0]==5'b00000); //ST:wren
  assign write_pc1 = ph1[3] && ((w_ir1[15:8]==8'b10000000)
                     || (w_ir1[15:11]==5'b10010)
                     || (w_ir1[15:11]==5'b10001)); //B,BNZ,BZ:load
  assign write_reg1 = ph1[3] && (
                        ((w_ir1[15:14]==2'b00) && (w_ir1[7:0]==8'b00000001))
                     || ((w_ir1[15:14]==2'b00) && (w_ir1[4:0]==5'b00010))
							|| ((w_ir1[15:14]==2'b00) && (w_ir1[4:0]==5'b00100)) 
							|| ((w_ir1[15:14]==2'b00) && (w_ir1[4:0]==5'b00101))
							|| (w_ir1[15:14]==2'b11)
							|| ((w_ir1[15:14]==2'b01) && (w_ir1[10:8]==3'b000))); //LD,LI,ADD,ADDi,CMP,MLT:load
  assign w_d1 = ((w_ir1[15:14]==2'b00) && (w_ir1[7:0]==8'b00000001)) ? w_dr1 : w_alu1; //MUX	
  
  assign write_dr2 = ph2[2] && (w_ir2[15:14]==2'b00) && (w_ir2[7:0]==8'b00000001); //LD:load
  assign write_dmem2 = ph2[2] && (w_ir2[15:11]==5'b00000) && (w_ir2[4:0]==5'b00000); //ST:wren
  assign write_pc2 = ph2[3] && ((w_ir2[15:8]==8'b10000000)
                     || (w_ir2[15:11]==5'b10010)
                     || (w_ir2[15:11]==5'b10001)); //B,BNZ,BZ:load
  assign write_reg2 = ph2[3] && (
                        ((w_ir2[15:14]==2'b00) && (w_ir2[7:0]==8'b00000001))
                     || ((w_ir2[15:14]==2'b00) && (w_ir2[4:0]==5'b00010))
							|| ((w_ir2[15:14]==2'b00) && (w_ir2[4:0]==5'b00100)) 
							|| ((w_ir2[15:14]==2'b00) && (w_ir2[4:0]==5'b00101))
							|| (w_ir2[15:14]==2'b11)
							|| ((w_ir2[15:14]==2'b01) && (w_ir2[10:8]==3'b000))); //LD,LI,ADD,ADDi,CMP,MLT:load
  assign w_d2 = ((w_ir2[15:14]==2'b00) && (w_ir2[7:0]==8'b00000001)) ? w_dr2 : w_alu2; //MUX	

  assign write_dr3 = ph3[2] && (w_ir3[15:14]==2'b00) && (w_ir3[7:0]==8'b00000001); //LD:load
  assign write_dmem3 = ph3[2] && (w_ir3[15:11]==5'b00000) && (w_ir3[4:0]==5'b00000); //ST:wren
  assign write_pc3 = ph3[3] && ((w_ir3[15:8]==8'b10000000)
                     || (w_ir3[15:11]==5'b10010)
                     || (w_ir3[15:11]==5'b10001)); //B,BNZ,BZ:load
  assign write_reg3 = ph3[3] && (
                        ((w_ir3[15:14]==2'b00) && (w_ir3[7:0]==8'b00000001))
                     || ((w_ir3[15:14]==2'b00) && (w_ir3[4:0]==5'b00010))
							|| ((w_ir3[15:14]==2'b00) && (w_ir3[4:0]==5'b00100)) 
							|| ((w_ir3[15:14]==2'b00) && (w_ir3[4:0]==5'b00101))
							|| (w_ir3[15:14]==2'b11)
							|| ((w_ir3[15:14]==2'b01) && (w_ir3[10:8]==3'b000))); //LD,LI,ADD,ADDi,CMP,MLT:load
  assign w_d3 = ((w_ir3[15:14]==2'b00) && (w_ir3[7:0]==8'b00000001)) ? w_dr3 : w_alu3; //MUX	
  
  wire [15:0] w_pc;        // Selecting input of imem            
  wire [15:0] w_imem;      // Intergrated output of imem
  wire [15:0] w_sr1,w_sr2; // Selecting sr1, sr2 input
  wire [15:0] w_dmem;      // Intergrated output of dmem
  wire write_dmem;         // Intergrated input of dmem
  
                           // Edited from here 
  assign w_pc = (ph0[0]) ? w_pc0 :         
                (ph1[0]) ? w_pc1 : 
					 (ph2[0]) ? 
                 w_pc2 : w_pc3;
  
  assign write_dmem = (write_dmem0) || 
                      (write_dmem1) || 
                      (write_dmem2) || 
							 (write_dmem3);
	
  assign w_sr1 = (write_dmem0) ? w_sr1_0 : 
                 (write_dmem1) ? w_sr1_1 : 
					  (write_dmem2) ? 
                  w_sr1_2 : w_sr1_3;
						
  assign w_sr2 = (write_dmem0) ? w_sr2_0 : 
                 (write_dmem1) ? w_sr2_1 : 
					  (write_dmem2) ? 
                  w_sr2_2 : w_sr2_3;       
                          // To here
  
  imem imem (                                  
    .address(w_pc),    // Selected input
    .clock(~CLK), 
    .q(w_imem)         // Intergrated output
  );
  
  dmem dmem (                           
    .address(w_sr1),   // Selected input
    .clock(~CLK),
    .data(w_sr2),      // Selected input
    .wren(write_dmem), // Intergrated input
    .q(w_dmem)         // Intergrated output
  );
  
  sm sm0 (
    .q(ph0), 
	 .d(4'b0000),       // Initializing state
    .start(start), 
    .stop(stop), 
    .CLK(CLK), 
    .RSTN(RSTN)
  );
  
  sm sm1 (
    .q(ph1),           // Initializing state
	 .d(4'b1000),
    .start(start), 
    .stop(stop), 
    .CLK(CLK), 
    .RSTN(RSTN)
  );
  
  sm sm2 (
    .q(ph2), 
	 .d(4'b0100),       // Initializing state
    .start(start), 
    .stop(stop), 
    .CLK(CLK), 
    .RSTN(RSTN)
  );

  sm sm3 (
    .q(ph3), 
	 .d(4'b0010),       // Initializing state
    .start(start), 
    .stop(stop), 
    .CLK(CLK), 
    .RSTN(RSTN)
  );

  count16rle pc0 (
    .q(w_pc0),
	 .def(16'b0000000000001000), // Initializing pc
    .load(write_pc0),
    .inc(ph0[0]),
    .d(w_alu0), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  count16rle pc1 (
    .q(w_pc1),
	 .def(16'b0000000000010000), // Initializing pc
    .load(write_pc1),
    .inc(ph1[0]),
    .d(w_alu1), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  count16rle pc2 (
    .q(w_pc2),
	 .def(16'b0000000000011000), // Initializing pc
    .load(write_pc2),
    .inc(ph2[0]),
    .d(w_alu2), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  count16rle pc3 (
    .q(w_pc3),
	 .def(16'b0000000000000000), // Initializing pc
    .load(write_pc3),
    .inc(ph3[0]),
    .d(w_alu3), 
    .CLK(CLK),
    .RSTN(RSTN)
  );

  reg16 ir0 ( 
    .q(w_ir0),  
    .load(ph0[0]), 
    .d(w_imem), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 ir1 ( 
    .q(w_ir1),  
    .load(ph1[0]), 
    .d(w_imem), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 ir2 ( 
    .q(w_ir2),  
    .load(ph2[0]), 
    .d(w_imem), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 ir3 ( 
    .q(w_ir3),  
    .load(ph3[0]), 
    .d(w_imem), 
    .CLK(CLK),
    .RSTN(RSTN)
  );

  regfile regfile0 (
    .q0(r0_0),
    .q1(r1_0),
    .q2(r2_0),
    .q3(r3_0),
    .q4(r4_0),
    .q5(r5_0),
    .q6(r6_0),
    .q7(r7_0),
    .load(write_reg0), 
    .wsel(w_ir0[13:11]), 
    .d(w_d0), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  regfile regfile1 (
    .q0(r0_1),
    .q1(r1_1),
    .q2(r2_1),
    .q3(r3_1),
    .q4(r4_1),
    .q5(r5_1),
    .q6(r6_1),
    .q7(r7_1),
    .load(write_reg1), 
    .wsel(w_ir1[13:11]), 
    .d(w_d1), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  regfile regfile2 (
    .q0(r0_2),
    .q1(r1_2),
    .q2(r2_2),
    .q3(r3_2),
    .q4(r4_2),
    .q5(r5_2),
    .q6(r6_2),
    .q7(r7_2),
    .load(write_reg2), 
    .wsel(w_ir2[13:11]), 
    .d(w_d2), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  regfile regfile3 (
    .q0(r0_3),
    .q1(r1_3),
    .q2(r2_3),
    .q3(r3_3),
    .q4(r4_3),
    .q5(r5_3),
    .q6(r6_3),
    .q7(r7_3),
    .load(write_reg3), 
    .wsel(w_ir3[13:11]), 
    .d(w_d3), 
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  muxreg16 sr1_0 (
    .q(w_sr1_0),
    .load(ph0[1]),
    .d0(r0_0),
    .d1(r1_0),
    .d2(r2_0),
    .d3(r3_0),
    .d4(r4_0),
    .d5(r5_0),
    .d6(r6_0),
    .d7(r7_0),
    .sel(w_ir0[10:8]),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  muxreg16 sr1_1 (
    .q(w_sr1_1),
    .load(ph1[1]),
    .d0(r0_1),
    .d1(r1_1),
    .d2(r2_1),
    .d3(r3_1),
    .d4(r4_1),
    .d5(r5_1),
    .d6(r6_1),
    .d7(r7_1),
    .sel(w_ir1[10:8]),
    .CLK(CLK),
    .RSTN(RSTN)
  );

  muxreg16 sr1_2 (
    .q(w_sr1_2),
    .load(ph2[1]),
    .d0(r0_2),
    .d1(r1_2),
    .d2(r2_2),
    .d3(r3_2),
    .d4(r4_2),
    .d5(r5_2),
    .d6(r6_2),
    .d7(r7_2),
    .sel(w_ir2[10:8]),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  muxreg16 sr1_3 (
    .q(w_sr1_3),
    .load(ph3[1]),
    .d0(r0_3),
    .d1(r1_3),
    .d2(r2_3),
    .d3(r3_3),
    .d4(r4_3),
    .d5(r5_3),
    .d6(r6_3),
    .d7(r7_3),
    .sel(w_ir3[10:8]),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  muxreg16 sr2_0 (
    .q(w_sr2_0),
    .load(ph0[1]),
    .d0(r0_0),
    .d1(r1_0),
    .d2(r2_0),
    .d3(r3_0),
    .d4(r4_0),
    .d5(r5_0),
    .d6(r6_0),
    .d7(r7_0),
    .sel(w_ir0[7:5]),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  muxreg16 sr2_1 (
    .q(w_sr2_1),
    .load(ph1[1]),
    .d0(r0_1),
    .d1(r1_1),
    .d2(r2_1),
    .d3(r3_1),
    .d4(r4_1),
    .d5(r5_1),
    .d6(r6_1),
    .d7(r7_1),
    .sel(w_ir1[7:5]),
    .CLK(CLK),
    .RSTN(RSTN)
  );

  muxreg16 sr2_2 (
    .q(w_sr2_2),
    .load(ph2[1]),
    .d0(r0_2),
    .d1(r1_2),
    .d2(r2_2),
    .d3(r3_2),
    .d4(r4_2),
    .d5(r5_2),
    .d6(r6_2),
    .d7(r7_2),
    .sel(w_ir2[7:5]),
    .CLK(CLK),
    .RSTN(RSTN)
  );

  muxreg16 sr2_3 (
    .q(w_sr2_3),
    .load(ph3[1]),
    .d0(r0_3),
    .d1(r1_3),
    .d2(r2_3),
    .d3(r3_3),
    .d4(r4_3),
    .d5(r5_3),
    .d6(r6_3),
    .d7(r7_3),
    .sel(w_ir3[7:5]),
    .CLK(CLK),
    .RSTN(RSTN)
  );

  alu alu0 (
    .q(w_alu0),
    .sr1(w_sr1_0),
    .sr2(w_sr2_0),
    .pc(w_pc0),
    .ir(w_ir0),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  alu alu1 (
    .q(w_alu1),
    .sr1(w_sr1_1),
    .sr2(w_sr2_1),
    .pc(w_pc1),
    .ir(w_ir1),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  alu alu2 (
    .q(w_alu2),
    .sr1(w_sr1_2),
    .sr2(w_sr2_2),
    .pc(w_pc2),
    .ir(w_ir2),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  alu alu3 (
    .q(w_alu3),
    .sr1(w_sr1_3),
    .sr2(w_sr2_3),
    .pc(w_pc3),
    .ir(w_ir3),
    .CLK(CLK),
    .RSTN(RSTN)
  );

  reg16 dr0 ( 
    .q(w_dr0),
    .load(write_dr0),
    .d(w_dmem),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 dr1 ( 
    .q(w_dr1),
    .load(write_dr1),
    .d(w_dmem),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 dr2 ( 
    .q(w_dr2),
    .load(write_dr2),
    .d(w_dmem),
    .CLK(CLK),
    .RSTN(RSTN)
  );
  
  reg16 dr3 ( 
    .q(w_dr3),
    .load(write_dr3), 
    .d(w_dmem),
    .CLK(CLK),
    .RSTN(RSTN)
  );
	
endmodule
