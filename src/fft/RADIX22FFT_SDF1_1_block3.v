// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\RADIX22FFT_SDF1_1_block3.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_SDF1_1_block3
// Source Path: joe_fft/FFT/RADIX22FFT_SDF1_1
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_SDF1_1_block3
          (clk,
           reset,
           enb_1_8_0,
           din_1_5_re_dly,
           din_1_5_im_dly,
           din_1_vld_dly,
           rd_1_Addr,
           rd_1_Enb,
           proc_1_enb,
           dout_1_5_re,
           dout_1_5_im);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   signed [16:0] din_1_5_re_dly;  // sfix17
  input   signed [16:0] din_1_5_im_dly;  // sfix17
  input   din_1_vld_dly;
  input   rd_1_Addr;
  input   rd_1_Enb;
  input   proc_1_enb;
  output  signed [17:0] dout_1_5_re;  // sfix18
  output  signed [17:0] dout_1_5_im;  // sfix18


  wire signed [17:0] din_re;  // sfix18
  reg signed [17:0] dinXTwdl_re;  // sfix18
  wire signed [17:0] din_im;  // sfix18
  reg signed [17:0] dinXTwdl_im;  // sfix18
  reg  dinXTwdl_1_5_vld;
  reg  x_vld;
  wire signed [17:0] wrData_re;  // sfix18
  wire signed [17:0] wrData_im;  // sfix18
  wire wrAddr;  // ufix1
  wire wrEnb;
  reg signed [17:0] twoLocationReg_0_MEM_re_0;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_im_0;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_re_1;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_im_1;  // sfix18
  reg signed [17:0] twoLocationReg_0_dout_re_reg;  // sfix18
  reg signed [17:0] twoLocationReg_0_dout_im_reg;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_re_0_next;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_im_0_next;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_re_1_next;  // sfix18
  reg signed [17:0] twoLocationReg_0_MEM_im_1_next;  // sfix18
  reg signed [17:0] twoLocationReg_0_dout_re_reg_next;  // sfix18
  reg signed [17:0] twoLocationReg_0_dout_im_reg_next;  // sfix18
  reg signed [17:0] x_re;  // sfix18
  reg signed [17:0] x_im;  // sfix18
  reg signed [18:0] Radix22ButterflyG1_btf1_re_reg;  // sfix19
  reg signed [18:0] Radix22ButterflyG1_btf1_im_reg;  // sfix19
  reg signed [18:0] Radix22ButterflyG1_btf2_re_reg;  // sfix19
  reg signed [18:0] Radix22ButterflyG1_btf2_im_reg;  // sfix19
  reg signed [17:0] Radix22ButterflyG1_dinXtwdl_re_dly1;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_dinXtwdl_im_dly1;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_dinXtwdl_re_dly2;  // sfix18
  reg signed [17:0] Radix22ButterflyG1_dinXtwdl_im_dly2;  // sfix18
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly1;
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly2;
  wire signed [18:0] Radix22ButterflyG1_btf1_re_reg_next;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_btf1_im_reg_next;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_btf2_re_reg_next;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_btf2_im_reg_next;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_1;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_2;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_3;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_4;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_5;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_6;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_7;  // sfix19
  wire signed [18:0] Radix22ButterflyG1_8;  // sfix19
  reg signed [17:0] xf_re;  // sfix18
  reg signed [17:0] xf_im;  // sfix18
  reg  xf_vld;
  wire signed [17:0] dinXTwdlf_re;  // sfix18
  wire signed [17:0] dinXTwdlf_im;  // sfix18
  wire dinxTwdlf_vld;
  wire signed [17:0] btf1_re;  // sfix18
  wire signed [17:0] btf1_im;  // sfix18
  wire signed [17:0] btf2_re;  // sfix18
  wire signed [17:0] btf2_im;  // sfix18
  reg  btf_vld;


  assign din_re = {din_1_5_re_dly[16], din_1_5_re_dly};



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        dinXTwdl_re <= 18'sb000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dinXTwdl_re <= din_re;
        end
      end
    end



  assign din_im = {din_1_5_im_dly[16], din_1_5_im_dly};



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        dinXTwdl_im <= 18'sb000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          dinXTwdl_im <= din_im;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        dinXTwdl_1_5_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          dinXTwdl_1_5_vld <= din_1_vld_dly;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        x_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          x_vld <= rd_1_Enb;
        end
      end
    end



  // twoLocationReg_0
  always @(posedge clk or posedge reset)
    begin : twoLocationReg_0_process
      if (reset == 1'b1) begin
        twoLocationReg_0_MEM_re_0 <= 18'sb000000000000000000;
        twoLocationReg_0_MEM_im_0 <= 18'sb000000000000000000;
        twoLocationReg_0_MEM_re_1 <= 18'sb000000000000000000;
        twoLocationReg_0_MEM_im_1 <= 18'sb000000000000000000;
        twoLocationReg_0_dout_re_reg <= 18'sb000000000000000000;
        twoLocationReg_0_dout_im_reg <= 18'sb000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
          twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
          twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
          twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
          twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
          twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
        end
      end
    end

  always @(rd_1_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im, wrData_re, wrEnb) begin
    twoLocationReg_0_MEM_re_0_next = twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next = twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next = twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next = twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_dout_im_reg;
    if (rd_1_Addr) begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_1;
    end
    else begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_0;
    end
    if (wrEnb) begin
      if (wrAddr == 1'b1) begin
        twoLocationReg_0_MEM_re_1_next = wrData_re;
        twoLocationReg_0_MEM_im_1_next = wrData_im;
      end
      else begin
        twoLocationReg_0_MEM_re_0_next = wrData_re;
        twoLocationReg_0_MEM_im_0_next = wrData_im;
      end
    end
    x_re = twoLocationReg_0_dout_re_reg;
    x_im = twoLocationReg_0_dout_im_reg;
  end



  // Radix22ButterflyG1
  always @(posedge clk or posedge reset)
    begin : Radix22ButterflyG1_process
      if (reset == 1'b1) begin
        Radix22ButterflyG1_btf1_re_reg <= 19'sb0000000000000000000;
        Radix22ButterflyG1_btf1_im_reg <= 19'sb0000000000000000000;
        Radix22ButterflyG1_btf2_re_reg <= 19'sb0000000000000000000;
        Radix22ButterflyG1_btf2_im_reg <= 19'sb0000000000000000000;
        xf_re <= 18'sb000000000000000000;
        xf_im <= 18'sb000000000000000000;
        xf_vld <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= 18'sb000000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= 18'sb000000000000000000;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= 18'sb000000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= 18'sb000000000000000000;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= 1'b0;
        btf_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
          Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
          Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
          Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
          btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
          Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
          Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
          Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
          xf_re <= x_re;
          xf_im <= x_im;
          xf_vld <= x_vld;
          Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_1_enb && dinXTwdl_1_5_vld;
        end
      end
    end

  assign dinxTwdlf_vld = ( ! proc_1_enb) && dinXTwdl_1_5_vld;
  assign Radix22ButterflyG1_1 = {x_re[17], x_re};
  assign Radix22ButterflyG1_2 = {Radix22ButterflyG1_dinXtwdl_re_dly2[17], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf1_re_reg_next = Radix22ButterflyG1_1 + Radix22ButterflyG1_2;
  assign Radix22ButterflyG1_3 = {x_re[17], x_re};
  assign Radix22ButterflyG1_4 = {Radix22ButterflyG1_dinXtwdl_re_dly2[17], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf2_re_reg_next = Radix22ButterflyG1_3 - Radix22ButterflyG1_4;
  assign Radix22ButterflyG1_5 = {x_im[17], x_im};
  assign Radix22ButterflyG1_6 = {Radix22ButterflyG1_dinXtwdl_im_dly2[17], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf1_im_reg_next = Radix22ButterflyG1_5 + Radix22ButterflyG1_6;
  assign Radix22ButterflyG1_7 = {x_im[17], x_im};
  assign Radix22ButterflyG1_8 = {Radix22ButterflyG1_dinXtwdl_im_dly2[17], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf2_im_reg_next = Radix22ButterflyG1_7 - Radix22ButterflyG1_8;
  assign dinXTwdlf_re = dinXTwdl_re;
  assign dinXTwdlf_im = dinXTwdl_im;
  assign btf1_re = Radix22ButterflyG1_btf1_re_reg[17:0];
  assign btf1_im = Radix22ButterflyG1_btf1_im_reg[17:0];
  assign btf2_re = Radix22ButterflyG1_btf2_re_reg[17:0];
  assign btf2_im = Radix22ButterflyG1_btf2_im_reg[17:0];



  SDFCommutator1_block3 u_SDFCOMMUTATOR_1 (.clk(clk),
                                           .reset(reset),
                                           .enb_1_8_0(enb_1_8_0),
                                           .din_1_vld_dly(din_1_vld_dly),
                                           .xf_re(xf_re),  // sfix18
                                           .xf_im(xf_im),  // sfix18
                                           .xf_vld(xf_vld),
                                           .dinXTwdlf_re(dinXTwdlf_re),  // sfix18
                                           .dinXTwdlf_im(dinXTwdlf_im),  // sfix18
                                           .dinxTwdlf_vld(dinxTwdlf_vld),
                                           .btf1_re(btf1_re),  // sfix18
                                           .btf1_im(btf1_im),  // sfix18
                                           .btf2_re(btf2_re),  // sfix18
                                           .btf2_im(btf2_im),  // sfix18
                                           .btf_vld(btf_vld),
                                           .wrData_re(wrData_re),  // sfix18
                                           .wrData_im(wrData_im),  // sfix18
                                           .wrAddr(wrAddr),  // ufix1
                                           .wrEnb(wrEnb),
                                           .dout_1_5_re(dout_1_5_re),  // sfix18
                                           .dout_1_5_im(dout_1_5_im)  // sfix18
                                           );

endmodule  // RADIX22FFT_SDF1_1_block3

