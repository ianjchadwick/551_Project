// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\RADIX22FFT_bitNatural_8.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: RADIX22FFT_bitNatural_8
// Source Path: joe_fft/FFT/RADIX22FFT_bitNatural_8
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module RADIX22FFT_bitNatural_8
          (clk,
           reset,
           enb_1_8_0,
           dout_re_v_0,
           dout_re_v_1,
           dout_re_v_2,
           dout_re_v_3,
           dout_re_v_4,
           dout_re_v_5,
           dout_re_v_6,
           dout_re_v_7,
           dout_im_v_0,
           dout_im_v_1,
           dout_im_v_2,
           dout_im_v_3,
           dout_im_v_4,
           dout_im_v_5,
           dout_im_v_6,
           dout_im_v_7,
           dout_4_vld,
           dMem_im8);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   signed [20:0] dout_re_v_0;  // sfix21
  input   signed [20:0] dout_re_v_1;  // sfix21
  input   signed [20:0] dout_re_v_2;  // sfix21
  input   signed [20:0] dout_re_v_3;  // sfix21
  input   signed [20:0] dout_re_v_4;  // sfix21
  input   signed [20:0] dout_re_v_5;  // sfix21
  input   signed [20:0] dout_re_v_6;  // sfix21
  input   signed [20:0] dout_re_v_7;  // sfix21
  input   signed [20:0] dout_im_v_0;  // sfix21
  input   signed [20:0] dout_im_v_1;  // sfix21
  input   signed [20:0] dout_im_v_2;  // sfix21
  input   signed [20:0] dout_im_v_3;  // sfix21
  input   signed [20:0] dout_im_v_4;  // sfix21
  input   signed [20:0] dout_im_v_5;  // sfix21
  input   signed [20:0] dout_im_v_6;  // sfix21
  input   signed [20:0] dout_im_v_7;  // sfix21
  input   dout_4_vld;
  output  signed [20:0] dMem_im8;  // sfix21


  reg [3:0] fftIdx_cnt;  // ufix4
  reg [3:0] fftIdx_cnt_next;  // ufix4
  reg [3:0] FFTIdx_1;  // ufix4
  reg [3:0] FFTIdxRev;  // ufix4
  reg  fftIdx_vld;
  reg  wrAddrGenBitNaturalP_wrCnt;  // ufix1
  reg  wrAddrGenBitNaturalP_wrOddFrame;
  reg  wrAddrGenBitNaturalP_wrAddrReg;  // ufix1
  reg  wrAddrGenBitNaturalP_wrEnbReg;
  reg  wrAddrGenBitNaturalP_wrCnt_next;  // ufix1
  reg  wrAddrGenBitNaturalP_wrOddFrame_next;
  reg  wrAddrGenBitNaturalP_wrAddrReg_next;  // ufix1
  reg  wrAddrGenBitNaturalP_wrEnbReg_next;
  reg  wrAddr;  // ufix1
  reg  WrEnb;
  reg  sampleCnt;  // ufix1
  reg  [0:3] intdelay_reg;  // ufix1 [4]
  wire [0:3] intdelay_reg_next;  // ufix1 [4]
  wire sampleCntDly;  // ufix1
  reg [2:0] MUXSel;  // ufix3
  reg  MUXSel_vld;
  reg signed [20:0] din_re_reg1;  // sfix21
  reg signed [20:0] din_re_reg2;  // sfix21
  reg signed [20:0] din_re_reg3;  // sfix21
  reg signed [20:0] din_re_reg4;  // sfix21
  reg signed [20:0] din_re_reg5;  // sfix21
  reg signed [20:0] din_re_reg6;  // sfix21
  reg signed [20:0] din_re_reg7;  // sfix21
  reg signed [20:0] din_re_reg8;  // sfix21
  wire signed [20:0] memIn_re;  // sfix21
  reg signed [20:0] intdelay_reg_1 [0:2];  // sfix21 [3]
  wire signed [20:0] intdelay_reg_next_1 [0:2];  // sfix21 [3]
  wire signed [20:0] memIn_re_reg;  // sfix21
  reg signed [20:0] din_im_reg1;  // sfix21
  reg signed [20:0] din_im_reg2;  // sfix21
  reg signed [20:0] din_im_reg3;  // sfix21
  reg signed [20:0] din_im_reg4;  // sfix21
  reg signed [20:0] din_im_reg5;  // sfix21
  reg signed [20:0] din_im_reg6;  // sfix21
  reg signed [20:0] din_im_reg7;  // sfix21
  reg signed [20:0] din_im_reg8;  // sfix21
  wire signed [20:0] memIn_im;  // sfix21
  reg signed [20:0] intdelay_reg_2 [0:2];  // sfix21 [3]
  wire signed [20:0] intdelay_reg_next_2 [0:2];  // sfix21 [3]
  wire signed [20:0] memIn_im_reg;  // sfix21
  reg  [0:2] intdelay_reg_3;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_3;  // ufix1 [3]
  wire wrAddr_reg;  // ufix1
  reg  [0:2] intdelay_reg_4;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_4;  // ufix1 [3]
  wire wrEnb_reg;
  reg  rdAddr;  // ufix1
  reg signed [20:0] twoLocationReg_0_MEM_re_0;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_0;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_re_1;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_1;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_re_reg;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_im_reg;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_re_0_next;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_0_next;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_re_1_next;  // sfix21
  reg signed [20:0] twoLocationReg_0_MEM_im_1_next;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_re_reg_next;  // sfix21
  reg signed [20:0] twoLocationReg_0_dout_im_reg_next;  // sfix21
  reg signed [20:0] memOut_re;  // sfix21
  reg signed [20:0] memOut_im;  // sfix21
  reg  rdAddrGenBitNaturalP_addrReg;  // ufix1
  reg  rdAddrGenBitNaturalP_rdOddFrame;
  reg  rdAddrGenBitNaturalP_rdAddrReg;  // ufix1
  reg  rdAddrGenBitNaturalP_rdState;  // ufix1
  reg  rdAddrGenBitNaturalP_vldOutReg;
  reg  rdAddrGenBitNaturalP_rdCnt;  // ufix1
  reg [3:0] rdAddrGenBitNaturalP_FFTIdxO;  // ufix4
  reg  rdAddrGenBitNaturalP_startOutReg;
  reg  rdAddrGenBitNaturalP_endOutReg;
  reg  rdAddrGenBitNaturalP_startOutRegDly;
  reg  rdAddrGenBitNaturalP_endOutRegDly;
  reg  rdAddrGenBitNaturalP_addrReg_next;  // ufix1
  reg  rdAddrGenBitNaturalP_rdOddFrame_next;
  reg  rdAddrGenBitNaturalP_rdAddrReg_next;  // ufix1
  reg  rdAddrGenBitNaturalP_rdState_next;  // ufix1
  reg  rdAddrGenBitNaturalP_vldOutReg_next;
  reg  rdAddrGenBitNaturalP_rdCnt_next;  // ufix1
  reg [3:0] rdAddrGenBitNaturalP_FFTIdxO_next;  // ufix4
  reg  rdAddrGenBitNaturalP_startOutReg_next;
  reg  rdAddrGenBitNaturalP_endOutReg_next;
  reg  rdAddrGenBitNaturalP_startOutRegDly_next;
  reg  rdAddrGenBitNaturalP_endOutRegDly_next;
  reg signed [20:0] dMem_re8_1;  // sfix21
  reg signed [20:0] dMem_im8_1;  // sfix21
  reg  dMem_vld8;
  reg  startOutW;
  reg  endOutW;
  reg [1:0] wrAddrGenBitNaturalP_add_temp;  // ufix2
  reg [1:0] wrAddrGenBitNaturalP_t_0_0;  // ufix2
  reg [3:0] rdAddrGenBitNaturalP_t_0_0;  // ufix4
  reg [1:0] rdAddrGenBitNaturalP_add_temp;  // ufix2
  reg [1:0] rdAddrGenBitNaturalP_add_temp_0;  // ufix2
  reg [1:0] rdAddrGenBitNaturalP_add_temp_1;  // ufix2
  reg [1:0] rdAddrGenBitNaturalP_t_1;  // ufix2
  reg [1:0] rdAddrGenBitNaturalP_t_2_0;  // ufix2
  reg [1:0] rdAddrGenBitNaturalP_t_3;  // ufix2


  // fftIdx
  always @(posedge clk or posedge reset)
    begin : fftIdx_process
      if (reset == 1'b1) begin
        fftIdx_cnt <= 4'b0111;
      end
      else begin
        if (enb_1_8_0) begin
          fftIdx_cnt <= fftIdx_cnt_next;
        end
      end
    end

  always @(dout_4_vld, fftIdx_cnt) begin
    fftIdx_cnt_next = fftIdx_cnt;
    if (dout_4_vld) begin
      fftIdx_cnt_next = fftIdx_cnt + 4'b1000;
    end
    FFTIdx_1 = fftIdx_cnt;
    FFTIdxRev = {fftIdx_cnt[0], fftIdx_cnt[1], fftIdx_cnt[2], fftIdx_cnt[3]};
    fftIdx_vld = dout_4_vld;
  end



  // wrAddrGenBitNaturalP
  always @(posedge clk or posedge reset)
    begin : wrAddrGenBitNaturalP_process
      if (reset == 1'b1) begin
        wrAddrGenBitNaturalP_wrCnt <= 1'b0;
        wrAddrGenBitNaturalP_wrAddrReg <= 1'b0;
        wrAddrGenBitNaturalP_wrOddFrame <= 1'b0;
        wrAddrGenBitNaturalP_wrEnbReg <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          wrAddrGenBitNaturalP_wrCnt <= wrAddrGenBitNaturalP_wrCnt_next;
          wrAddrGenBitNaturalP_wrOddFrame <= wrAddrGenBitNaturalP_wrOddFrame_next;
          wrAddrGenBitNaturalP_wrAddrReg <= wrAddrGenBitNaturalP_wrAddrReg_next;
          wrAddrGenBitNaturalP_wrEnbReg <= wrAddrGenBitNaturalP_wrEnbReg_next;
        end
      end
    end

  always @(FFTIdxRev, fftIdx_vld, wrAddrGenBitNaturalP_wrAddrReg,
       wrAddrGenBitNaturalP_wrCnt, wrAddrGenBitNaturalP_wrEnbReg,
       wrAddrGenBitNaturalP_wrOddFrame) begin
    wrAddrGenBitNaturalP_add_temp = 2'b00;
    wrAddrGenBitNaturalP_t_0_0 = 2'b00;
    wrAddrGenBitNaturalP_wrCnt_next = wrAddrGenBitNaturalP_wrCnt;
    wrAddrGenBitNaturalP_wrOddFrame_next = wrAddrGenBitNaturalP_wrOddFrame;
    wrAddrGenBitNaturalP_wrAddrReg_next = wrAddrGenBitNaturalP_wrAddrReg;
    wrAddrGenBitNaturalP_wrEnbReg_next = fftIdx_vld;
    if (wrAddrGenBitNaturalP_wrOddFrame) begin
      wrAddrGenBitNaturalP_wrAddrReg_next = wrAddrGenBitNaturalP_wrCnt;
    end
    else begin
      wrAddrGenBitNaturalP_wrAddrReg_next = FFTIdxRev[3] ^ wrAddrGenBitNaturalP_wrCnt;
    end
    if (wrAddrGenBitNaturalP_wrCnt && fftIdx_vld) begin
      wrAddrGenBitNaturalP_wrOddFrame_next =  ! wrAddrGenBitNaturalP_wrOddFrame;
    end
    if (fftIdx_vld) begin
      wrAddrGenBitNaturalP_t_0_0 = {1'b0, wrAddrGenBitNaturalP_wrCnt};
      wrAddrGenBitNaturalP_add_temp = wrAddrGenBitNaturalP_t_0_0 + 2'b01;
      wrAddrGenBitNaturalP_wrCnt_next = wrAddrGenBitNaturalP_add_temp[0];
    end
    wrAddr = wrAddrGenBitNaturalP_wrAddrReg;
    WrEnb = wrAddrGenBitNaturalP_wrEnbReg;
    sampleCnt = wrAddrGenBitNaturalP_wrCnt;
  end



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
        intdelay_reg[2] <= 1'b0;
        intdelay_reg[3] <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
          intdelay_reg[2] <= intdelay_reg_next[2];
          intdelay_reg[3] <= intdelay_reg_next[3];
        end
      end
    end

  assign sampleCntDly = intdelay_reg[3];
  assign intdelay_reg_next[0] = sampleCnt;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];
  assign intdelay_reg_next[3] = intdelay_reg[2];



  // inMUXSel
  always @(posedge clk or posedge reset)
    begin : inMuxSel_process
      if (reset == 1'b1) begin
        MUXSel <= 3'b000;
        MUXSel_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          MUXSel <= FFTIdxRev[2:0] ^ 3'b001;
          MUXSel_vld <= fftIdx_vld;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        din_re_reg1 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg1 <= dout_re_v_0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        din_re_reg2 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg2 <= dout_re_v_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        din_re_reg3 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg3 <= dout_re_v_2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        din_re_reg4 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg4 <= dout_re_v_3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        din_re_reg5 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg5 <= dout_re_v_4;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        din_re_reg6 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg6 <= dout_re_v_5;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        din_re_reg7 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg7 <= dout_re_v_6;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        din_re_reg8 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg8 <= dout_re_v_7;
        end
      end
    end



  assign memIn_re = (MUXSel == 3'b000 ? din_re_reg1 :
              (MUXSel == 3'b001 ? din_re_reg2 :
              (MUXSel == 3'b010 ? din_re_reg3 :
              (MUXSel == 3'b011 ? din_re_reg4 :
              (MUXSel == 3'b100 ? din_re_reg5 :
              (MUXSel == 3'b101 ? din_re_reg6 :
              (MUXSel == 3'b110 ? din_re_reg7 :
              din_re_reg8)))))));



  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        intdelay_reg_1[0] <= 21'sb000000000000000000000;
        intdelay_reg_1[1] <= 21'sb000000000000000000000;
        intdelay_reg_1[2] <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg_1[0] <= intdelay_reg_next_1[0];
          intdelay_reg_1[1] <= intdelay_reg_next_1[1];
          intdelay_reg_1[2] <= intdelay_reg_next_1[2];
        end
      end
    end

  assign memIn_re_reg = intdelay_reg_1[2];
  assign intdelay_reg_next_1[0] = memIn_re;
  assign intdelay_reg_next_1[1] = intdelay_reg_1[0];
  assign intdelay_reg_next_1[2] = intdelay_reg_1[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        din_im_reg1 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg1 <= dout_im_v_0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        din_im_reg2 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg2 <= dout_im_v_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        din_im_reg3 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg3 <= dout_im_v_2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_13_process
      if (reset == 1'b1) begin
        din_im_reg4 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg4 <= dout_im_v_3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_14_process
      if (reset == 1'b1) begin
        din_im_reg5 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg5 <= dout_im_v_4;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_15_process
      if (reset == 1'b1) begin
        din_im_reg6 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg6 <= dout_im_v_5;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_16_process
      if (reset == 1'b1) begin
        din_im_reg7 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg7 <= dout_im_v_6;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_17_process
      if (reset == 1'b1) begin
        din_im_reg8 <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg8 <= dout_im_v_7;
        end
      end
    end



  assign memIn_im = (MUXSel == 3'b000 ? din_im_reg1 :
              (MUXSel == 3'b001 ? din_im_reg2 :
              (MUXSel == 3'b010 ? din_im_reg3 :
              (MUXSel == 3'b011 ? din_im_reg4 :
              (MUXSel == 3'b100 ? din_im_reg5 :
              (MUXSel == 3'b101 ? din_im_reg6 :
              (MUXSel == 3'b110 ? din_im_reg7 :
              din_im_reg8)))))));



  always @(posedge clk or posedge reset)
    begin : intdelay_18_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 21'sb000000000000000000000;
        intdelay_reg_2[1] <= 21'sb000000000000000000000;
        intdelay_reg_2[2] <= 21'sb000000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg_2[0] <= intdelay_reg_next_2[0];
          intdelay_reg_2[1] <= intdelay_reg_next_2[1];
          intdelay_reg_2[2] <= intdelay_reg_next_2[2];
        end
      end
    end

  assign memIn_im_reg = intdelay_reg_2[2];
  assign intdelay_reg_next_2[0] = memIn_im;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];
  assign intdelay_reg_next_2[2] = intdelay_reg_2[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_19_process
      if (reset == 1'b1) begin
        intdelay_reg_3[0] <= 1'b0;
        intdelay_reg_3[1] <= 1'b0;
        intdelay_reg_3[2] <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg_3[0] <= intdelay_reg_next_3[0];
          intdelay_reg_3[1] <= intdelay_reg_next_3[1];
          intdelay_reg_3[2] <= intdelay_reg_next_3[2];
        end
      end
    end

  assign wrAddr_reg = intdelay_reg_3[2];
  assign intdelay_reg_next_3[0] = wrAddr;
  assign intdelay_reg_next_3[1] = intdelay_reg_3[0];
  assign intdelay_reg_next_3[2] = intdelay_reg_3[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_20_process
      if (reset == 1'b1) begin
        intdelay_reg_4[0] <= 1'b0;
        intdelay_reg_4[1] <= 1'b0;
        intdelay_reg_4[2] <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          intdelay_reg_4[0] <= intdelay_reg_next_4[0];
          intdelay_reg_4[1] <= intdelay_reg_next_4[1];
          intdelay_reg_4[2] <= intdelay_reg_next_4[2];
        end
      end
    end

  assign wrEnb_reg = intdelay_reg_4[2];
  assign intdelay_reg_next_4[0] = WrEnb;
  assign intdelay_reg_next_4[1] = intdelay_reg_4[0];
  assign intdelay_reg_next_4[2] = intdelay_reg_4[1];



  // twoLocationReg_0
  always @(posedge clk or posedge reset)
    begin : twoLocationReg_0_process
      if (reset == 1'b1) begin
        twoLocationReg_0_MEM_re_0 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_im_0 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_re_1 <= 21'sb000000000000000000000;
        twoLocationReg_0_MEM_im_1 <= 21'sb000000000000000000000;
        twoLocationReg_0_dout_re_reg <= 21'sb000000000000000000000;
        twoLocationReg_0_dout_im_reg <= 21'sb000000000000000000000;
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

  always @(memIn_im_reg, memIn_re_reg, rdAddr, twoLocationReg_0_MEM_im_0,
       twoLocationReg_0_MEM_im_1, twoLocationReg_0_MEM_re_0,
       twoLocationReg_0_MEM_re_1, twoLocationReg_0_dout_im_reg,
       twoLocationReg_0_dout_re_reg, wrAddr_reg, wrEnb_reg) begin
    twoLocationReg_0_MEM_re_0_next = twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next = twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next = twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next = twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_dout_im_reg;
    if (rdAddr == 1'b1) begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_1;
    end
    else begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_0;
    end
    if (wrEnb_reg) begin
      if (wrAddr_reg == 1'b1) begin
        twoLocationReg_0_MEM_re_1_next = memIn_re_reg;
        twoLocationReg_0_MEM_im_1_next = memIn_im_reg;
      end
      else begin
        twoLocationReg_0_MEM_re_0_next = memIn_re_reg;
        twoLocationReg_0_MEM_im_0_next = memIn_im_reg;
      end
    end
    memOut_re = twoLocationReg_0_dout_re_reg;
    memOut_im = twoLocationReg_0_dout_im_reg;
  end



  // rdAddrGenBitNaturalP
  always @(posedge clk or posedge reset)
    begin : rdAddrGenBitNaturalP_process
      if (reset == 1'b1) begin
        rdAddrGenBitNaturalP_addrReg <= 1'b0;
        rdAddrGenBitNaturalP_rdCnt <= 1'b0;
        rdAddrGenBitNaturalP_rdAddrReg <= 1'b0;
        rdAddrGenBitNaturalP_rdOddFrame <= 1'b0;
        rdAddrGenBitNaturalP_vldOutReg <= 1'b0;
        rdAddrGenBitNaturalP_rdState <= 1'b0;
        rdAddrGenBitNaturalP_FFTIdxO <= 4'b0111;
        rdAddrGenBitNaturalP_startOutReg <= 1'b0;
        rdAddrGenBitNaturalP_endOutReg <= 1'b0;
        rdAddrGenBitNaturalP_startOutRegDly <= 1'b0;
        rdAddrGenBitNaturalP_endOutRegDly <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          rdAddrGenBitNaturalP_addrReg <= rdAddrGenBitNaturalP_addrReg_next;
          rdAddrGenBitNaturalP_rdOddFrame <= rdAddrGenBitNaturalP_rdOddFrame_next;
          rdAddrGenBitNaturalP_rdAddrReg <= rdAddrGenBitNaturalP_rdAddrReg_next;
          rdAddrGenBitNaturalP_rdState <= rdAddrGenBitNaturalP_rdState_next;
          rdAddrGenBitNaturalP_vldOutReg <= rdAddrGenBitNaturalP_vldOutReg_next;
          rdAddrGenBitNaturalP_rdCnt <= rdAddrGenBitNaturalP_rdCnt_next;
          rdAddrGenBitNaturalP_FFTIdxO <= rdAddrGenBitNaturalP_FFTIdxO_next;
          rdAddrGenBitNaturalP_startOutReg <= rdAddrGenBitNaturalP_startOutReg_next;
          rdAddrGenBitNaturalP_endOutReg <= rdAddrGenBitNaturalP_endOutReg_next;
          rdAddrGenBitNaturalP_startOutRegDly <= rdAddrGenBitNaturalP_startOutRegDly_next;
          rdAddrGenBitNaturalP_endOutRegDly <= rdAddrGenBitNaturalP_endOutRegDly_next;
        end
      end
    end

  always @(memOut_im, memOut_re, rdAddrGenBitNaturalP_FFTIdxO,
       rdAddrGenBitNaturalP_addrReg, rdAddrGenBitNaturalP_endOutReg,
       rdAddrGenBitNaturalP_endOutRegDly, rdAddrGenBitNaturalP_rdAddrReg,
       rdAddrGenBitNaturalP_rdCnt, rdAddrGenBitNaturalP_rdOddFrame,
       rdAddrGenBitNaturalP_rdState, rdAddrGenBitNaturalP_startOutReg,
       rdAddrGenBitNaturalP_startOutRegDly, rdAddrGenBitNaturalP_vldOutReg,
       sampleCntDly) begin
    rdAddrGenBitNaturalP_t_0_0 = 4'b0000;
    rdAddrGenBitNaturalP_add_temp = 2'b00;
    rdAddrGenBitNaturalP_add_temp_0 = 2'b00;
    rdAddrGenBitNaturalP_add_temp_1 = 2'b00;
    rdAddrGenBitNaturalP_t_1 = 2'b00;
    rdAddrGenBitNaturalP_t_2_0 = 2'b00;
    rdAddrGenBitNaturalP_t_3 = 2'b00;
    rdAddrGenBitNaturalP_addrReg_next = rdAddrGenBitNaturalP_addrReg;
    rdAddrGenBitNaturalP_FFTIdxO_next = rdAddrGenBitNaturalP_FFTIdxO;
    rdAddrGenBitNaturalP_rdOddFrame_next = rdAddrGenBitNaturalP_rdOddFrame;
    rdAddrGenBitNaturalP_rdAddrReg_next = rdAddrGenBitNaturalP_rdAddrReg;
    rdAddrGenBitNaturalP_rdState_next = rdAddrGenBitNaturalP_rdState;
    rdAddrGenBitNaturalP_vldOutReg_next = rdAddrGenBitNaturalP_vldOutReg;
    rdAddrGenBitNaturalP_rdCnt_next = rdAddrGenBitNaturalP_rdCnt;
    rdAddrGenBitNaturalP_startOutReg_next = rdAddrGenBitNaturalP_startOutReg;
    rdAddrGenBitNaturalP_endOutReg_next = rdAddrGenBitNaturalP_endOutReg;
    rdAddrGenBitNaturalP_startOutRegDly_next = rdAddrGenBitNaturalP_startOutReg;
    rdAddrGenBitNaturalP_endOutRegDly_next = rdAddrGenBitNaturalP_endOutReg;
    if (rdAddrGenBitNaturalP_rdOddFrame) begin
      rdAddrGenBitNaturalP_t_0_0 = {rdAddrGenBitNaturalP_FFTIdxO[0], rdAddrGenBitNaturalP_FFTIdxO[1], rdAddrGenBitNaturalP_FFTIdxO[2], rdAddrGenBitNaturalP_FFTIdxO[3]};
      rdAddrGenBitNaturalP_rdAddrReg_next = rdAddrGenBitNaturalP_t_0_0[3] ^ rdAddrGenBitNaturalP_addrReg;
    end
    else begin
      rdAddrGenBitNaturalP_rdAddrReg_next = rdAddrGenBitNaturalP_addrReg;
    end
    case ( rdAddrGenBitNaturalP_rdState)
      1'b0 :
        begin
          rdAddrGenBitNaturalP_rdState_next = 1'b0;
          rdAddrGenBitNaturalP_endOutReg_next = 1'b0;
          rdAddrGenBitNaturalP_rdCnt_next = 1'b0;
          rdAddrGenBitNaturalP_addrReg_next = 1'b0;
          rdAddrGenBitNaturalP_vldOutReg_next = 1'b0;
          rdAddrGenBitNaturalP_startOutReg_next = 1'b0;
          rdAddrGenBitNaturalP_FFTIdxO_next = 4'b0111;
          if (sampleCntDly == 1'b1) begin
            rdAddrGenBitNaturalP_rdState_next = 1'b1;
            rdAddrGenBitNaturalP_addrReg_next = 1'b1;
            rdAddrGenBitNaturalP_FFTIdxO_next = 4'b1111;
            rdAddrGenBitNaturalP_startOutReg_next = 1'b1;
          end
        end
      1'b1 :
        begin
          rdAddrGenBitNaturalP_rdState_next = 1'b1;
          rdAddrGenBitNaturalP_endOutReg_next = 1'b0;
          rdAddrGenBitNaturalP_startOutReg_next = 1'b0;
          rdAddrGenBitNaturalP_vldOutReg_next = 1'b1;
          if (rdAddrGenBitNaturalP_rdCnt == 1'b1) begin
            if (sampleCntDly == 1'b1) begin
              rdAddrGenBitNaturalP_rdState_next = 1'b1;
              rdAddrGenBitNaturalP_startOutReg_next = 1'b1;
              rdAddrGenBitNaturalP_FFTIdxO_next = rdAddrGenBitNaturalP_FFTIdxO + 4'b1000;
              rdAddrGenBitNaturalP_t_2_0 = {1'b0, rdAddrGenBitNaturalP_addrReg};
              rdAddrGenBitNaturalP_add_temp_0 = rdAddrGenBitNaturalP_t_2_0 + 2'b01;
              rdAddrGenBitNaturalP_addrReg_next = rdAddrGenBitNaturalP_add_temp_0[0];
            end
            else begin
              rdAddrGenBitNaturalP_rdState_next = 1'b0;
              rdAddrGenBitNaturalP_FFTIdxO_next = 4'b0111;
              rdAddrGenBitNaturalP_addrReg_next = 1'b0;
            end
          end
          else begin
            rdAddrGenBitNaturalP_FFTIdxO_next = rdAddrGenBitNaturalP_FFTIdxO + 4'b1000;
            rdAddrGenBitNaturalP_t_1 = {1'b0, rdAddrGenBitNaturalP_addrReg};
            rdAddrGenBitNaturalP_add_temp = rdAddrGenBitNaturalP_t_1 + 2'b01;
            rdAddrGenBitNaturalP_addrReg_next = rdAddrGenBitNaturalP_add_temp[0];
          end
          if (rdAddrGenBitNaturalP_rdCnt == 1'b0) begin
            rdAddrGenBitNaturalP_endOutReg_next = 1'b1;
            rdAddrGenBitNaturalP_rdOddFrame_next =  ! rdAddrGenBitNaturalP_rdOddFrame;
          end
          rdAddrGenBitNaturalP_t_3 = {1'b0, rdAddrGenBitNaturalP_rdCnt};
          rdAddrGenBitNaturalP_add_temp_1 = rdAddrGenBitNaturalP_t_3 + 2'b01;
          rdAddrGenBitNaturalP_rdCnt_next = rdAddrGenBitNaturalP_add_temp_1[0];
        end
    endcase
    rdAddr = rdAddrGenBitNaturalP_rdAddrReg;
    dMem_re8_1 = memOut_re;
    dMem_im8_1 = memOut_im;
    dMem_vld8 = rdAddrGenBitNaturalP_vldOutReg;
    startOutW = rdAddrGenBitNaturalP_startOutRegDly;
    endOutW = rdAddrGenBitNaturalP_endOutRegDly;
  end



  assign dMem_im8 = dMem_im8_1;


endmodule  // RADIX22FFT_bitNatural_8

