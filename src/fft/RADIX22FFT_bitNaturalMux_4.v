// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\RADIX22FFT_bitNaturalMux_4.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_bitNaturalMux_4
// Source Path: joe_fft/FFT/RADIX22FFT_bitNaturalMux_4
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_bitNaturalMux_4
          (clk,
           reset,
           enb_1_8_0,
           dMem_im_v_0,
           dMem_im_v_1,
           dMem_im_v_2,
           dMem_im_v_3,
           dMem_im_v_4,
           dMem_im_v_5,
           dMem_im_v_6,
           dMem_im_v_7,
           dMem_vld1,
           dMux_im4);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   signed [20:0] dMem_im_v_0;  // sfix21
  input   signed [20:0] dMem_im_v_1;  // sfix21
  input   signed [20:0] dMem_im_v_2;  // sfix21
  input   signed [20:0] dMem_im_v_3;  // sfix21
  input   signed [20:0] dMem_im_v_4;  // sfix21
  input   signed [20:0] dMem_im_v_5;  // sfix21
  input   signed [20:0] dMem_im_v_6;  // sfix21
  input   signed [20:0] dMem_im_v_7;  // sfix21
  input   dMem_vld1;
  output  signed [20:0] dMux_im4;  // sfix21


  reg [3:0] outMuxSel_idx;  // ufix4
  reg [2:0] outMuxSel_MUXSelReg1;  // ufix3
  reg  outMuxSel_MUXSelVldReg1;
  reg  outMuxSel_xorCnt;  // ufix1
  reg [3:0] outMuxSel_idx_next;  // ufix4
  reg [2:0] outMuxSel_MUXSelReg1_next;  // ufix3
  reg  outMuxSel_MUXSelVldReg1_next;
  reg  outMuxSel_xorCnt_next;  // ufix1
  reg [2:0] MUXSel;  // ufix3
  reg  MUXSel_vld;
  reg  [0:1] intdelay_reg;  // ufix1 [2]
  wire [0:1] intdelay_reg_next;  // ufix1 [2]
  wire dMuxSelDly_vld;
  reg signed [20:0] intdelay_reg_1 [0:1];  // sfix21 [2]
  wire signed [20:0] intdelay_reg_next_1 [0:1];  // sfix21 [2]
  reg signed [20:0] dMem_im_reg1;  // sfix21
  reg signed [20:0] dMem_im_reg2;  // sfix21
  reg signed [20:0] dMem_im_reg3;  // sfix21
  reg signed [20:0] dMem_im_reg4;  // sfix21
  reg signed [20:0] dMem_im_reg5;  // sfix21
  reg signed [20:0] dMem_im_reg6;  // sfix21
  reg signed [20:0] dMem_im_reg7;  // sfix21
  reg signed [20:0] dMem_im_reg8;  // sfix21
  wire signed [20:0] dMux_im;  // sfix21
  reg signed [20:0] intdelay_reg_2 [0:1];  // sfix21 [2]
  wire signed [20:0] intdelay_reg_next_2 [0:1];  // sfix21 [2]
  wire signed [20:0] dMuxDly_im;  // sfix21
  reg signed [20:0] dMux_im4_1;  // sfix21
  reg [1:0] outMuxSel_add_temp;  // ufix2
  reg  outMuxSel_t_0_0;  // ufix1
  reg [2:0] outMuxSel_t_1;  // ufix3
  reg [1:0] outMuxSel_t_2_0;  // ufix2


  // outMuxSel
  always @(posedge clk or posedge reset)
    begin : outMuxSel_process
      if (reset == 1'b1) begin
        outMuxSel_MUXSelReg1 <= 3'b000;
        outMuxSel_MUXSelVldReg1 <= 1'b0;
        outMuxSel_idx <= 4'b0011;
        outMuxSel_xorCnt <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          outMuxSel_idx <= outMuxSel_idx_next;
          outMuxSel_MUXSelReg1 <= outMuxSel_MUXSelReg1_next;
          outMuxSel_MUXSelVldReg1 <= outMuxSel_MUXSelVldReg1_next;
          outMuxSel_xorCnt <= outMuxSel_xorCnt_next;
        end
      end
    end

  always @(dMem_vld1, outMuxSel_MUXSelReg1, outMuxSel_MUXSelVldReg1, outMuxSel_idx,
       outMuxSel_xorCnt) begin
    outMuxSel_add_temp = 2'b00;
    outMuxSel_t_2_0 = 2'b00;
    outMuxSel_idx_next = outMuxSel_idx;
    outMuxSel_xorCnt_next = outMuxSel_xorCnt;
    outMuxSel_t_0_0 = outMuxSel_xorCnt;
    outMuxSel_t_1 = {2'b0, outMuxSel_t_0_0};
    outMuxSel_MUXSelReg1_next = outMuxSel_idx[2:0] ^ outMuxSel_t_1;
    outMuxSel_MUXSelVldReg1_next = dMem_vld1;
    if (dMem_vld1) begin
      outMuxSel_idx_next = outMuxSel_idx + 4'b1000;
      outMuxSel_t_2_0 = {1'b0, outMuxSel_xorCnt};
      outMuxSel_add_temp = outMuxSel_t_2_0 + 2'b01;
      outMuxSel_xorCnt_next = outMuxSel_add_temp[0];
    end
    MUXSel = outMuxSel_MUXSelReg1;
    MUXSel_vld = outMuxSel_MUXSelVldReg1;
  end



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
        end
      end
    end

  assign dMuxSelDly_vld = intdelay_reg[1];
  assign intdelay_reg_next[0] = MUXSel_vld;
  assign intdelay_reg_next[1] = intdelay_reg[0];



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        dMem_im_reg1 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg1 <= dMem_im_v_0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        dMem_im_reg2 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg2 <= dMem_im_v_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_13_process
      if (reset == 1'b1) begin
        dMem_im_reg3 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg3 <= dMem_im_v_2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_14_process
      if (reset == 1'b1) begin
        dMem_im_reg4 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg4 <= dMem_im_v_3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_15_process
      if (reset == 1'b1) begin
        dMem_im_reg5 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg5 <= dMem_im_v_4;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_16_process
      if (reset == 1'b1) begin
        dMem_im_reg6 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg6 <= dMem_im_v_5;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_17_process
      if (reset == 1'b1) begin
        dMem_im_reg7 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg7 <= dMem_im_v_6;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_18_process
      if (reset == 1'b1) begin
        dMem_im_reg8 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dMem_im_reg8 <= dMem_im_v_7;
        end
      end
    end



  assign dMux_im = (MUXSel == 3'b000 ? dMem_im_reg1 :
              (MUXSel == 3'b001 ? dMem_im_reg2 :
              (MUXSel == 3'b010 ? dMem_im_reg3 :
              (MUXSel == 3'b011 ? dMem_im_reg4 :
              (MUXSel == 3'b100 ? dMem_im_reg5 :
              (MUXSel == 3'b101 ? dMem_im_reg6 :
              (MUXSel == 3'b110 ? dMem_im_reg7 :
              dMem_im_reg8)))))));



  always @(posedge clk or posedge reset)
    begin : intdelay_19_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 21'sb000000000000000000000;
        intdelay_reg_2[1] <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg_2[0] <= intdelay_reg_next_2[0];
          intdelay_reg_2[1] <= intdelay_reg_next_2[1];
        end
      end
    end

  assign dMuxDly_im = intdelay_reg_2[1];
  assign intdelay_reg_next_2[0] = dMux_im;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];



  always @(posedge clk or posedge reset)
    begin : intdelay_20_process
      if (reset == 1'b1) begin
        dMux_im4_1 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0 && dMuxSelDly_vld) begin
          dMux_im4_1 <= dMuxDly_im;
        end
      end
    end



  assign dMux_im4 = dMux_im4_1;

endmodule  // RADIX22FFT_bitNaturalMux_4

