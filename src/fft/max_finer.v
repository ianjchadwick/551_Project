// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\max_finer.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: max_finer
// Source Path: joe_fft/max_finer
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module max_finer
          (In1_re_0,
           In1_re_1,
           In1_re_2,
           In1_re_3,
           In1_re_4,
           In1_re_5,
           In1_re_6,
           In1_re_7,
           Out1);


  input   signed [20:0] In1_re_0;  // sfix21
  input   signed [20:0] In1_re_1;  // sfix21
  input   signed [20:0] In1_re_2;  // sfix21
  input   signed [20:0] In1_re_3;  // sfix21
  input   signed [20:0] In1_re_4;  // sfix21
  input   signed [20:0] In1_re_5;  // sfix21
  input   signed [20:0] In1_re_6;  // sfix21
  input   signed [20:0] In1_re_7;  // sfix21
  output  [15:0] Out1;  // uint16


  wire signed [20:0] MinMax_stage1_1_val;  // sfix21
  wire signed [20:0] MinMax_stage1_3_val;  // sfix21
  wire signed [20:0] MinMax_stage1_2_val;  // sfix21
  wire signed [20:0] MinMax_stage2_1_val;  // sfix21
  wire signed [20:0] MinMax_stage1_4_val;  // sfix21
  wire signed [20:0] MinMax_stage2_2_val;  // sfix21
  wire signed [20:0] MinMax_stage3_val;  // sfix21
  wire [15:0] MinMax_out1;  // uint16


  // ---- Tree max implementation ----
  assign MinMax_stage1_1_val = (In1_re_0 >= In1_re_1 ? In1_re_0 :
              In1_re_1);



  assign MinMax_stage1_3_val = (In1_re_4 >= In1_re_5 ? In1_re_4 :
              In1_re_5);



  assign MinMax_stage1_2_val = (In1_re_2 >= In1_re_3 ? In1_re_2 :
              In1_re_3);



  assign MinMax_stage2_1_val = (MinMax_stage1_1_val >= MinMax_stage1_2_val ? MinMax_stage1_1_val :
              MinMax_stage1_2_val);



  assign MinMax_stage1_4_val = (In1_re_6 >= In1_re_7 ? In1_re_6 :
              In1_re_7);



  assign MinMax_stage2_2_val = (MinMax_stage1_3_val >= MinMax_stage1_4_val ? MinMax_stage1_3_val :
              MinMax_stage1_4_val);



  assign MinMax_stage3_val = (MinMax_stage2_1_val >= MinMax_stage2_2_val ? MinMax_stage2_1_val :
              MinMax_stage2_2_val);



  assign MinMax_out1 = MinMax_stage3_val[15:0];



  assign Out1 = MinMax_out1;

endmodule  // max_finer

