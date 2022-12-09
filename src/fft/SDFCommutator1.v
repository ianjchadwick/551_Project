// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\SDFCommutator1.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SDFCommutator1
// Source Path: joe_fft/FFT/RADIX22FFT_SDF1_1/SDFCommutator1
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SDFCommutator1
          (clk,
           reset,
           enb_1_8_0,
           din_1_vld_dly,
           xf_re,
           xf_im,
           xf_vld,
           dinXTwdlf_re,
           dinXTwdlf_im,
           dinxTwdlf_vld,
           btf1_re,
           btf1_im,
           btf2_re,
           btf2_im,
           btf_vld,
           wrData_re,
           wrData_im,
           wrAddr,
           wrEnb,
           dout_1_1_re,
           dout_1_1_im,
           dout_1_1_vld);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   din_1_vld_dly;
  input   signed [17:0] xf_re;  // sfix18
  input   signed [17:0] xf_im;  // sfix18
  input   xf_vld;
  input   signed [17:0] dinXTwdlf_re;  // sfix18
  input   signed [17:0] dinXTwdlf_im;  // sfix18
  input   dinxTwdlf_vld;
  input   signed [17:0] btf1_re;  // sfix18
  input   signed [17:0] btf1_im;  // sfix18
  input   signed [17:0] btf2_re;  // sfix18
  input   signed [17:0] btf2_im;  // sfix18
  input   btf_vld;
  output  signed [17:0] wrData_re;  // sfix18
  output  signed [17:0] wrData_im;  // sfix18
  output  wrAddr;  // ufix1
  output  wrEnb;
  output  signed [17:0] dout_1_1_re;  // sfix18
  output  signed [17:0] dout_1_1_im;  // sfix18
  output  dout_1_1_vld;


  reg signed [17:0] SDFCummutator_out_re;  // sfix18
  reg signed [17:0] SDFCummutator_out_im;  // sfix18
  reg  SDFCummutator_out_vld;
  reg  SDFCummutator_wrAddr_reg;  // ufix1
  reg [2:0] SDFCummutator_wrState;  // ufix3
  reg signed [17:0] SDFCummutator_wrData_re_reg;  // sfix18
  reg signed [17:0] SDFCummutator_wrData_im_reg;  // sfix18
  reg  SDFCummutator_wrEnb_reg;
  reg signed [17:0] SDFCummutator_wrXData_re_reg;  // sfix18
  reg signed [17:0] SDFCummutator_wrXData_im_reg;  // sfix18
  reg [2:0] SDFCummutator_xWrAddr;  // ufix3
  reg  SDFCummutator_wrxEnb_reg;
  reg [2:0] SDFCummutator_xRdAddr;  // ufix3
  reg [2:0] SDFCummutator_XState;  // ufix3
  reg  SDFCummutator_xX_vld_reg;
  reg signed [17:0] SDFCummutator_btf1_re_dly;  // sfix18
  reg signed [17:0] SDFCummutator_btf1_im_dly;  // sfix18
  reg  SDFCummutator_btf1_vld_dly;
  reg signed [17:0] SDFCummutator_out_re_next;  // sfix18
  reg signed [17:0] SDFCummutator_out_im_next;  // sfix18
  reg  SDFCummutator_out_vld_next;
  reg  SDFCummutator_wrAddr_reg_next;  // ufix1
  reg [2:0] SDFCummutator_wrState_next;  // ufix3
  reg signed [17:0] SDFCummutator_wrData_re_reg_next;  // sfix18
  reg signed [17:0] SDFCummutator_wrData_im_reg_next;  // sfix18
  reg  SDFCummutator_wrEnb_reg_next;
  reg signed [17:0] SDFCummutator_wrXData_re_reg_next;  // sfix18
  reg signed [17:0] SDFCummutator_wrXData_im_reg_next;  // sfix18
  reg [2:0] SDFCummutator_xWrAddr_next;  // ufix3
  reg  SDFCummutator_wrxEnb_reg_next;
  reg [2:0] SDFCummutator_xRdAddr_next;  // ufix3
  reg [2:0] SDFCummutator_XState_next;  // ufix3
  reg  SDFCummutator_xX_vld_reg_next;
  reg signed [17:0] SDFCummutator_btf1_re_dly_next;  // sfix18
  reg signed [17:0] SDFCummutator_btf1_im_dly_next;  // sfix18
  reg  SDFCummutator_btf1_vld_dly_next;
  reg signed [17:0] wrData_re_1;  // sfix18
  reg signed [17:0] wrData_im_1;  // sfix18
  reg  wrAddr_1;  // ufix1
  reg  wrEnb_1;
  reg signed [17:0] xData_re;  // sfix18
  reg signed [17:0] xData_im;  // sfix18
  reg [2:0] wrXAddr;  // ufix3
  reg  wrXEnb;
  reg [2:0] rdXAddr;  // ufix3
  reg  xX_vld;
  reg signed [17:0] dout0_re;  // sfix18
  reg signed [17:0] dout0_im;  // sfix18
  reg  dout0_vld;
  wire signed [17:0] xX_re;  // sfix18
  wire signed [17:0] xX_im;  // sfix18
  reg signed [17:0] SDFOutmux_btf2Pipe_re;  // sfix18
  reg signed [17:0] SDFOutmux_btf2Pipe_im;  // sfix18
  reg  SDFOutmux_btfPipe_vld;
  reg signed [17:0] SDFOutmux_btf2Pipe_re_next;  // sfix18
  reg signed [17:0] SDFOutmux_btf2Pipe_im_next;  // sfix18
  reg  SDFOutmux_btfPipe_vld_next;
  reg signed [17:0] dout_1_1_re_1;  // sfix18
  reg signed [17:0] dout_1_1_im_1;  // sfix18
  reg  dout_1_1_vld_1;


  // SDFCummutator
  always @(posedge clk or posedge reset)
    begin : SDFCummutator_process
      if (reset == 1'b1) begin
        SDFCummutator_out_re <= 18'sb000000000000000000;
        SDFCummutator_out_im <= 18'sb000000000000000000;
        SDFCummutator_wrData_re_reg <= 18'sb000000000000000000;
        SDFCummutator_wrData_im_reg <= 18'sb000000000000000000;
        SDFCummutator_wrEnb_reg <= 1'b0;
        SDFCummutator_out_vld <= 1'b0;
        SDFCummutator_wrState <= 3'b000;
        SDFCummutator_wrAddr_reg <= 1'b0;
        SDFCummutator_wrXData_re_reg <= 18'sb000000000000000000;
        SDFCummutator_wrXData_im_reg <= 18'sb000000000000000000;
        SDFCummutator_xWrAddr <= 3'b000;
        SDFCummutator_wrxEnb_reg <= 1'b0;
        SDFCummutator_xRdAddr <= 3'b000;
        SDFCummutator_XState <= 3'b000;
        SDFCummutator_xX_vld_reg <= 1'b0;
        SDFCummutator_btf1_re_dly <= 18'sb000000000000000000;
        SDFCummutator_btf1_im_dly <= 18'sb000000000000000000;
        SDFCummutator_btf1_vld_dly <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          SDFCummutator_out_re <= SDFCummutator_out_re_next;
          SDFCummutator_out_im <= SDFCummutator_out_im_next;
          SDFCummutator_out_vld <= SDFCummutator_out_vld_next;
          SDFCummutator_wrAddr_reg <= SDFCummutator_wrAddr_reg_next;
          SDFCummutator_wrState <= SDFCummutator_wrState_next;
          SDFCummutator_wrData_re_reg <= SDFCummutator_wrData_re_reg_next;
          SDFCummutator_wrData_im_reg <= SDFCummutator_wrData_im_reg_next;
          SDFCummutator_wrEnb_reg <= SDFCummutator_wrEnb_reg_next;
          SDFCummutator_wrXData_re_reg <= SDFCummutator_wrXData_re_reg_next;
          SDFCummutator_wrXData_im_reg <= SDFCummutator_wrXData_im_reg_next;
          SDFCummutator_xWrAddr <= SDFCummutator_xWrAddr_next;
          SDFCummutator_wrxEnb_reg <= SDFCummutator_wrxEnb_reg_next;
          SDFCummutator_xRdAddr <= SDFCummutator_xRdAddr_next;
          SDFCummutator_XState <= SDFCummutator_XState_next;
          SDFCummutator_xX_vld_reg <= SDFCummutator_xX_vld_reg_next;
          SDFCummutator_btf1_re_dly <= SDFCummutator_btf1_re_dly_next;
          SDFCummutator_btf1_im_dly <= SDFCummutator_btf1_im_dly_next;
          SDFCummutator_btf1_vld_dly <= SDFCummutator_btf1_vld_dly_next;
        end
      end
    end

  always @(SDFCummutator_XState, SDFCummutator_btf1_im_dly, SDFCummutator_btf1_re_dly,
       SDFCummutator_btf1_vld_dly, SDFCummutator_out_im, SDFCummutator_out_re,
       SDFCummutator_out_vld, SDFCummutator_wrAddr_reg,
       SDFCummutator_wrData_im_reg, SDFCummutator_wrData_re_reg,
       SDFCummutator_wrEnb_reg, SDFCummutator_wrState,
       SDFCummutator_wrXData_im_reg, SDFCummutator_wrXData_re_reg,
       SDFCummutator_wrxEnb_reg, SDFCummutator_xRdAddr, SDFCummutator_xWrAddr,
       SDFCummutator_xX_vld_reg, btf1_im, btf1_re, btf2_im, btf2_re, btf_vld,
       dinXTwdlf_im, dinXTwdlf_re, dinxTwdlf_vld) begin
    SDFCummutator_wrAddr_reg_next = SDFCummutator_wrAddr_reg;
    SDFCummutator_wrState_next = SDFCummutator_wrState;
    SDFCummutator_wrData_re_reg_next = SDFCummutator_wrData_re_reg;
    SDFCummutator_wrData_im_reg_next = SDFCummutator_wrData_im_reg;
    SDFCummutator_wrEnb_reg_next = SDFCummutator_wrEnb_reg;
    SDFCummutator_wrXData_re_reg_next = SDFCummutator_wrXData_re_reg;
    SDFCummutator_wrXData_im_reg_next = SDFCummutator_wrXData_im_reg;
    SDFCummutator_xWrAddr_next = SDFCummutator_xWrAddr;
    SDFCummutator_wrxEnb_reg_next = SDFCummutator_wrxEnb_reg;
    SDFCummutator_xRdAddr_next = SDFCummutator_xRdAddr;
    SDFCummutator_XState_next = SDFCummutator_XState;
    SDFCummutator_xX_vld_reg_next = SDFCummutator_xX_vld_reg;
    case ( SDFCummutator_XState)
      3'b000 :
        begin
          SDFCummutator_xRdAddr_next = 3'b000;
          SDFCummutator_xX_vld_reg_next = 1'b0;
          SDFCummutator_XState_next = 3'b000;
          SDFCummutator_wrXData_re_reg_next = btf2_re;
          SDFCummutator_wrXData_im_reg_next = btf2_im;
          SDFCummutator_xWrAddr_next = 3'b000;
          if (btf_vld) begin
            SDFCummutator_wrxEnb_reg_next = 1'b1;
            SDFCummutator_XState_next = 3'b010;
          end
        end
      3'b010 :
        begin
          SDFCummutator_xX_vld_reg_next = 1'b0;
          SDFCummutator_wrxEnb_reg_next = 1'b0;
          SDFCummutator_XState_next = 3'b100;
        end
      3'b100 :
        begin
          SDFCummutator_xX_vld_reg_next = 1'b1;
          if (btf_vld) begin
            SDFCummutator_wrXData_re_reg_next = btf2_re;
            SDFCummutator_wrXData_im_reg_next = btf2_im;
            SDFCummutator_wrxEnb_reg_next = 1'b1;
            SDFCummutator_XState_next = 3'b010;
          end
          else begin
            SDFCummutator_wrxEnb_reg_next = 1'b0;
            SDFCummutator_XState_next = 3'b000;
          end
        end
      default :
        begin
          SDFCummutator_wrXData_re_reg_next = 18'sb000000000000000000;
          SDFCummutator_wrXData_im_reg_next = 18'sb000000000000000000;
          SDFCummutator_xWrAddr_next = 3'b000;
          SDFCummutator_xRdAddr_next = 3'b000;
          SDFCummutator_wrxEnb_reg_next = 1'b0;
          SDFCummutator_XState_next = 3'b000;
        end
    endcase
    SDFCummutator_out_re_next = SDFCummutator_btf1_re_dly;
    SDFCummutator_out_im_next = SDFCummutator_btf1_im_dly;
    SDFCummutator_out_vld_next = SDFCummutator_btf1_vld_dly;
    SDFCummutator_btf1_re_dly_next = btf1_re;
    SDFCummutator_btf1_im_dly_next = btf1_im;
    SDFCummutator_btf1_vld_dly_next = btf_vld;
    case ( SDFCummutator_wrState)
      3'b000 :
        begin
          SDFCummutator_wrState_next = 3'b000;
          SDFCummutator_wrAddr_reg_next = 1'b0;
          SDFCummutator_wrData_re_reg_next = dinXTwdlf_re;
          SDFCummutator_wrData_im_reg_next = dinXTwdlf_im;
          if (dinxTwdlf_vld) begin
            SDFCummutator_wrState_next = 3'b001;
            SDFCummutator_wrAddr_reg_next = 1'b0;
            SDFCummutator_wrEnb_reg_next = 1'b1;
          end
        end
      3'b001 :
        begin
          SDFCummutator_wrState_next = 3'b011;
          SDFCummutator_wrAddr_reg_next = 1'b0;
          SDFCummutator_wrEnb_reg_next = 1'b0;
          SDFCummutator_wrData_re_reg_next = dinXTwdlf_re;
          SDFCummutator_wrData_im_reg_next = dinXTwdlf_im;
        end
      3'b011 :
        begin
          SDFCummutator_wrAddr_reg_next = 1'b0;
          if (dinxTwdlf_vld) begin
            SDFCummutator_wrState_next = 3'b001;
          end
          else begin
            SDFCummutator_wrState_next = 3'b000;
          end
          SDFCummutator_wrEnb_reg_next = dinxTwdlf_vld;
          SDFCummutator_wrData_re_reg_next = dinXTwdlf_re;
          SDFCummutator_wrData_im_reg_next = dinXTwdlf_im;
        end
      default :
        begin
          SDFCummutator_wrState_next = 3'b000;
          SDFCummutator_wrAddr_reg_next = 1'b0;
          SDFCummutator_wrEnb_reg_next = dinxTwdlf_vld;
          SDFCummutator_wrData_re_reg_next = dinXTwdlf_re;
          SDFCummutator_wrData_im_reg_next = dinXTwdlf_im;
        end
    endcase
    wrData_re_1 = SDFCummutator_wrData_re_reg;
    wrData_im_1 = SDFCummutator_wrData_im_reg;
    wrAddr_1 = SDFCummutator_wrAddr_reg;
    wrEnb_1 = SDFCummutator_wrEnb_reg;
    xData_re = SDFCummutator_wrXData_re_reg;
    xData_im = SDFCummutator_wrXData_im_reg;
    wrXAddr = SDFCummutator_xWrAddr;
    wrXEnb = SDFCummutator_wrxEnb_reg;
    rdXAddr = SDFCummutator_xRdAddr;
    xX_vld = SDFCummutator_xX_vld_reg;
    dout0_re = SDFCummutator_out_re;
    dout0_im = SDFCummutator_out_im;
    dout0_vld = SDFCummutator_out_vld;
  end



  SimpleDualPortRAM_generic_block #(.AddrWidth(3),
                                    .DataWidth(18)
                                    )
                                  u_dataXMEM_re_0_1_generic (.clk(clk),
                                                             .enb_1_8_0(enb_1_8_0),
                                                             .wr_din(xData_re),
                                                             .wr_addr(wrXAddr),
                                                             .wr_en(wrXEnb),
                                                             .rd_addr(rdXAddr),
                                                             .rd_dout(xX_re)
                                                             );

  SimpleDualPortRAM_generic_block #(.AddrWidth(3),
                                    .DataWidth(18)
                                    )
                                  u_dataXMEM_im_0_1 (.clk(clk),
                                                     .enb_1_8_0(enb_1_8_0),
                                                     .wr_din(xData_im),
                                                     .wr_addr(wrXAddr),
                                                     .wr_en(wrXEnb),
                                                     .rd_addr(rdXAddr),
                                                     .rd_dout(xX_im)
                                                     );

  // SDFOutmux
  always @(posedge clk or posedge reset)
    begin : SDFOutmux_process
      if (reset == 1'b1) begin
        SDFOutmux_btf2Pipe_re <= 18'sb000000000000000000;
        SDFOutmux_btf2Pipe_im <= 18'sb000000000000000000;
        SDFOutmux_btfPipe_vld <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          SDFOutmux_btf2Pipe_re <= SDFOutmux_btf2Pipe_re_next;
          SDFOutmux_btf2Pipe_im <= SDFOutmux_btf2Pipe_im_next;
          SDFOutmux_btfPipe_vld <= SDFOutmux_btfPipe_vld_next;
        end
      end
    end

  always @(SDFOutmux_btf2Pipe_im, SDFOutmux_btf2Pipe_re, SDFOutmux_btfPipe_vld, dout0_im,
       dout0_re, dout0_vld, xX_im, xX_re, xX_vld) begin
    SDFOutmux_btf2Pipe_re_next = SDFOutmux_btf2Pipe_re;
    SDFOutmux_btf2Pipe_im_next = SDFOutmux_btf2Pipe_im;
    SDFOutmux_btfPipe_vld_next = SDFOutmux_btfPipe_vld;
    if (dout0_vld) begin
      SDFOutmux_btf2Pipe_re_next = dout0_re;
      SDFOutmux_btf2Pipe_im_next = dout0_im;
      SDFOutmux_btfPipe_vld_next = 1'b1;
    end
    else if (xX_vld) begin
      SDFOutmux_btf2Pipe_re_next = xX_re;
      SDFOutmux_btf2Pipe_im_next = xX_im;
      SDFOutmux_btfPipe_vld_next = 1'b1;
    end
    else begin
      SDFOutmux_btfPipe_vld_next = 1'b0;
    end
    dout_1_1_re_1 = SDFOutmux_btf2Pipe_re;
    dout_1_1_im_1 = SDFOutmux_btf2Pipe_im;
    dout_1_1_vld_1 = SDFOutmux_btfPipe_vld;
  end



  assign wrData_re = wrData_re_1;

  assign wrData_im = wrData_im_1;

  assign wrAddr = wrAddr_1;

  assign wrEnb = wrEnb_1;

  assign dout_1_1_re = dout_1_1_re_1;

  assign dout_1_1_im = dout_1_1_im_1;

  assign dout_1_1_vld = dout_1_1_vld_1;

endmodule  // SDFCommutator1

