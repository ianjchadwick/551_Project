// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\Complex4Multiply_block2.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Complex4Multiply_block2
// Source Path: joe_fft/FFT/TWDLMULT_SDNF1_3/Complex4Multiply
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Complex4Multiply_block2
          (clk,
           reset,
           enb_1_8_0,
           din2_re_dly3,
           din2_im_dly3,
           di2_vld_dly3,
           twdl_3_6_re,
           twdl_3_6_im,
           twdlXdin_6_re,
           twdlXdin_6_im);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   signed [19:0] din2_re_dly3;  // sfix20
  input   signed [19:0] din2_im_dly3;  // sfix20
  input   di2_vld_dly3;
  input   signed [16:0] twdl_3_6_re;  // sfix17_En15
  input   signed [16:0] twdl_3_6_im;  // sfix17_En15
  output  signed [19:0] twdlXdin_6_re;  // sfix20
  output  signed [19:0] twdlXdin_6_im;  // sfix20


  reg signed [19:0] din_re_reg;  // sfix20
  reg signed [19:0] din_im_reg;  // sfix20
  reg signed [16:0] twdl_re_reg;  // sfix17_En15
  reg signed [16:0] twdl_im_reg;  // sfix17_En15
  reg signed [19:0] Complex4Multiply_din1_re_pipe1;  // sfix20
  reg signed [19:0] Complex4Multiply_din1_im_pipe1;  // sfix20
  reg signed [36:0] Complex4Multiply_mult1_re_pipe1;  // sfix37
  reg signed [36:0] Complex4Multiply_mult2_re_pipe1;  // sfix37
  reg signed [36:0] Complex4Multiply_mult1_im_pipe1;  // sfix37
  reg signed [36:0] Complex4Multiply_mult2_im_pipe1;  // sfix37
  reg signed [16:0] Complex4Multiply_twiddle_re_pipe1;  // sfix17
  reg signed [16:0] Complex4Multiply_twiddle_im_pipe1;  // sfix17
  reg signed [36:0] prod1_re;  // sfix37_En15
  reg signed [36:0] prod1_im;  // sfix37_En15
  reg signed [36:0] prod2_re;  // sfix37_En15
  reg signed [36:0] prod2_im;  // sfix37_En15
  reg  din_vld_dly1;
  reg  din_vld_dly2;
  reg  din_vld_dly3;
  reg  prod_vld;
  reg signed [37:0] Complex4Add_multRes_re_reg;  // sfix38
  reg signed [37:0] Complex4Add_multRes_im_reg;  // sfix38
  reg  Complex4Add_prod_vld_reg1;
  reg signed [36:0] Complex4Add_prod1_re_reg;  // sfix37
  reg signed [36:0] Complex4Add_prod1_im_reg;  // sfix37
  reg signed [36:0] Complex4Add_prod2_re_reg;  // sfix37
  reg signed [36:0] Complex4Add_prod2_im_reg;  // sfix37
  wire signed [37:0] Complex4Add_multRes_re_reg_next;  // sfix38_En15
  wire signed [37:0] Complex4Add_multRes_im_reg_next;  // sfix38_En15
  wire signed [37:0] Complex4Add_sub_cast;  // sfix38_En15
  wire signed [37:0] Complex4Add_sub_cast_1;  // sfix38_En15
  wire signed [37:0] Complex4Add_add_cast;  // sfix38_En15
  wire signed [37:0] Complex4Add_add_cast_1;  // sfix38_En15
  wire signed [37:0] mulResFP_re;  // sfix38_En15
  wire signed [37:0] mulResFP_im;  // sfix38_En15
  reg  twdlXdin2_vld;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        din_re_reg <= 20'sb00000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_re_reg <= din2_re_dly3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        din_im_reg <= 20'sb00000000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          din_im_reg <= din2_im_dly3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        twdl_re_reg <= 17'sb00000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          twdl_re_reg <= twdl_3_6_re;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        twdl_im_reg <= 17'sb00000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          twdl_im_reg <= twdl_3_6_im;
        end
      end
    end



  // Complex4Multiply
  always @(posedge clk)
    begin : Complex4Multiply_process
      if (enb_1_8_0) begin
        prod1_re <= Complex4Multiply_mult1_re_pipe1;
        prod2_re <= Complex4Multiply_mult2_re_pipe1;
        prod1_im <= Complex4Multiply_mult1_im_pipe1;
        prod2_im <= Complex4Multiply_mult2_im_pipe1;
        Complex4Multiply_mult1_re_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_mult2_re_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult1_im_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult2_im_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex4Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex4Multiply_din1_re_pipe1 <= din_re_reg;
        Complex4Multiply_din1_im_pipe1 <= din_im_reg;
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        din_vld_dly1 <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          din_vld_dly1 <= di2_vld_dly3;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        din_vld_dly2 <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          din_vld_dly2 <= din_vld_dly1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        din_vld_dly3 <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          din_vld_dly3 <= din_vld_dly2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        prod_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          prod_vld <= din_vld_dly3;
        end
      end
    end



  // Complex4Add
  always @(posedge clk or posedge reset)
    begin : Complex4Add_process
      if (reset == 1'b1) begin
        Complex4Add_multRes_re_reg <= 38'sh0000000000;
        Complex4Add_multRes_im_reg <= 38'sh0000000000;
        Complex4Add_prod1_re_reg <= 37'sh0000000000;
        Complex4Add_prod1_im_reg <= 37'sh0000000000;
        Complex4Add_prod2_re_reg <= 37'sh0000000000;
        Complex4Add_prod2_im_reg <= 37'sh0000000000;
        Complex4Add_prod_vld_reg1 <= 1'b0;
        twdlXdin2_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          Complex4Add_multRes_re_reg <= Complex4Add_multRes_re_reg_next;
          Complex4Add_multRes_im_reg <= Complex4Add_multRes_im_reg_next;
          Complex4Add_prod1_re_reg <= prod1_re;
          Complex4Add_prod1_im_reg <= prod1_im;
          Complex4Add_prod2_re_reg <= prod2_re;
          Complex4Add_prod2_im_reg <= prod2_im;
          twdlXdin2_vld <= Complex4Add_prod_vld_reg1;
          Complex4Add_prod_vld_reg1 <= prod_vld;
        end
      end
    end

  assign Complex4Add_sub_cast = {Complex4Add_prod1_re_reg[36], Complex4Add_prod1_re_reg};
  assign Complex4Add_sub_cast_1 = {Complex4Add_prod2_re_reg[36], Complex4Add_prod2_re_reg};
  assign Complex4Add_multRes_re_reg_next = Complex4Add_sub_cast - Complex4Add_sub_cast_1;
  assign Complex4Add_add_cast = {Complex4Add_prod1_im_reg[36], Complex4Add_prod1_im_reg};
  assign Complex4Add_add_cast_1 = {Complex4Add_prod2_im_reg[36], Complex4Add_prod2_im_reg};
  assign Complex4Add_multRes_im_reg_next = Complex4Add_add_cast + Complex4Add_add_cast_1;
  assign mulResFP_re = Complex4Add_multRes_re_reg;
  assign mulResFP_im = Complex4Add_multRes_im_reg;



  assign twdlXdin_6_re = mulResFP_re[34:15];



  assign twdlXdin_6_im = mulResFP_im[34:15];



endmodule  // Complex4Multiply_block2

