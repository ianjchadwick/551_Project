// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\RADIX22FFT_SDNF1_3_block2.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_SDNF1_3_block2
// Source Path: joe_fft/FFT/RADIX22FFT_SDNF1_3
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_SDNF1_3_block2
          (clk,
           reset,
           enb_1_8_0,
           twdlXdin_6_re,
           twdlXdin_6_im,
           twdlXdin_8_re,
           twdlXdin_8_im,
           twdlXdin_1_vld,
           dout_7_re,
           dout_7_im,
           dout_8_re,
           dout_8_im);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   signed [19:0] twdlXdin_6_re;  // sfix20
  input   signed [19:0] twdlXdin_6_im;  // sfix20
  input   signed [19:0] twdlXdin_8_re;  // sfix20
  input   signed [19:0] twdlXdin_8_im;  // sfix20
  input   twdlXdin_1_vld;
  output  signed [19:0] dout_7_re;  // sfix20
  output  signed [19:0] dout_7_im;  // sfix20
  output  signed [19:0] dout_8_re;  // sfix20
  output  signed [19:0] dout_8_im;  // sfix20


  reg signed [20:0] Radix22ButterflyG1_NF_btf1_re_reg;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf1_im_reg;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf2_re_reg;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf2_im_reg;  // sfix21
  reg  Radix22ButterflyG1_NF_dinXtwdl_vld_dly1;
  reg signed [20:0] Radix22ButterflyG1_NF_btf1_re_reg_next;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf1_im_reg_next;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf2_re_reg_next;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_btf2_im_reg_next;  // sfix21
  reg  Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next;
  reg signed [19:0] dout_7_re_1;  // sfix20
  reg signed [19:0] dout_7_im_1;  // sfix20
  reg signed [19:0] dout_8_re_1;  // sfix20
  reg signed [19:0] dout_8_im_1;  // sfix20
  reg  dout_7_vld;
  reg signed [20:0] Radix22ButterflyG1_NF_t_0_0;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_1;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_2_0;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_3;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_4_0;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_5;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_6_0;  // sfix21
  reg signed [20:0] Radix22ButterflyG1_NF_t_7;  // sfix21


  // Radix22ButterflyG1_NF
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG1_NF_process
      if (reset == 1'b1) begin
        Radix22ButterflyG1_NF_btf1_re_reg <= 21'sb000000000000000000000;
        Radix22ButterflyG1_NF_btf1_im_reg <= 21'sb000000000000000000000;
        Radix22ButterflyG1_NF_btf2_re_reg <= 21'sb000000000000000000000;
        Radix22ButterflyG1_NF_btf2_im_reg <= 21'sb000000000000000000000;
        Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          Radix22ButterflyG1_NF_btf1_re_reg <= Radix22ButterflyG1_NF_btf1_re_reg_next;
          Radix22ButterflyG1_NF_btf1_im_reg <= Radix22ButterflyG1_NF_btf1_im_reg_next;
          Radix22ButterflyG1_NF_btf2_re_reg <= Radix22ButterflyG1_NF_btf2_re_reg_next;
          Radix22ButterflyG1_NF_btf2_im_reg <= Radix22ButterflyG1_NF_btf2_im_reg_next;
          Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next;
        end
      end
    end

  always @(Radix22ButterflyG1_NF_btf1_im_reg, Radix22ButterflyG1_NF_btf1_re_reg,
       Radix22ButterflyG1_NF_btf2_im_reg, Radix22ButterflyG1_NF_btf2_re_reg,
       Radix22ButterflyG1_NF_dinXtwdl_vld_dly1, twdlXdin_1_vld, twdlXdin_6_im,
       twdlXdin_6_re, twdlXdin_8_im, twdlXdin_8_re) begin
    Radix22ButterflyG1_NF_t_0_0 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_1 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_2_0 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_3 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_4_0 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_5 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_6_0 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_t_7 = 21'sb000000000000000000000;
    Radix22ButterflyG1_NF_btf1_re_reg_next = Radix22ButterflyG1_NF_btf1_re_reg;
    Radix22ButterflyG1_NF_btf1_im_reg_next = Radix22ButterflyG1_NF_btf1_im_reg;
    Radix22ButterflyG1_NF_btf2_re_reg_next = Radix22ButterflyG1_NF_btf2_re_reg;
    Radix22ButterflyG1_NF_btf2_im_reg_next = Radix22ButterflyG1_NF_btf2_im_reg;
    Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next = twdlXdin_1_vld;
    if (twdlXdin_1_vld) begin
      Radix22ButterflyG1_NF_t_0_0 = {twdlXdin_6_re[19], twdlXdin_6_re};
      Radix22ButterflyG1_NF_t_1 = {twdlXdin_8_re[19], twdlXdin_8_re};
      Radix22ButterflyG1_NF_btf1_re_reg_next = Radix22ButterflyG1_NF_t_0_0 + Radix22ButterflyG1_NF_t_1;
      Radix22ButterflyG1_NF_t_2_0 = {twdlXdin_6_re[19], twdlXdin_6_re};
      Radix22ButterflyG1_NF_t_3 = {twdlXdin_8_re[19], twdlXdin_8_re};
      Radix22ButterflyG1_NF_btf2_re_reg_next = Radix22ButterflyG1_NF_t_2_0 - Radix22ButterflyG1_NF_t_3;
      Radix22ButterflyG1_NF_t_4_0 = {twdlXdin_6_im[19], twdlXdin_6_im};
      Radix22ButterflyG1_NF_t_5 = {twdlXdin_8_im[19], twdlXdin_8_im};
      Radix22ButterflyG1_NF_btf1_im_reg_next = Radix22ButterflyG1_NF_t_4_0 + Radix22ButterflyG1_NF_t_5;
      Radix22ButterflyG1_NF_t_6_0 = {twdlXdin_6_im[19], twdlXdin_6_im};
      Radix22ButterflyG1_NF_t_7 = {twdlXdin_8_im[19], twdlXdin_8_im};
      Radix22ButterflyG1_NF_btf2_im_reg_next = Radix22ButterflyG1_NF_t_6_0 - Radix22ButterflyG1_NF_t_7;
    end
    dout_7_re_1 = Radix22ButterflyG1_NF_btf1_re_reg[19:0];
    dout_7_im_1 = Radix22ButterflyG1_NF_btf1_im_reg[19:0];
    dout_8_re_1 = Radix22ButterflyG1_NF_btf2_re_reg[19:0];
    dout_8_im_1 = Radix22ButterflyG1_NF_btf2_im_reg[19:0];
    dout_7_vld = Radix22ButterflyG1_NF_dinXtwdl_vld_dly1;
  end



  assign dout_7_re = dout_7_re_1;

  assign dout_7_im = dout_7_im_1;

  assign dout_8_re = dout_8_re_1;

  assign dout_8_im = dout_8_im_1;

endmodule  // RADIX22FFT_SDNF1_3_block2
