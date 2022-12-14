// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\Downsampler.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Downsampler
// Source Path: joe_fft/downsample_top/Downsampler
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Downsampler
          (clk,
           reset,
           enb,
           dataIn,
           validIn,
           syncReset,
           dataOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   [15:0] dataIn;  // uint16
  input   validIn;
  input   syncReset;
  output  [15:0] dataOut;  // uint16
  output  validOut;


  reg [15:0] dataInreg;  // uint16
  reg  validInreg;
  wire [15:0] dsOut_re;  // ufix16
  wire ds_vout;
  wire [15:0] invalidOut_1;  // uint16


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        dataInreg <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          if (syncReset == 1'b1) begin
            dataInreg <= 16'b0000000000000000;
          end
          else begin
            dataInreg <= dataIn;
          end
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        validInreg <= 1'b0;
      end
      else begin
        if (enb) begin
          if (syncReset == 1'b1) begin
            validInreg <= 1'b0;
          end
          else begin
            validInreg <= validIn;
          end
        end
      end
    end



  dsSection u_dsSection (.clk(clk),
                         .reset(reset),
                         .enb(enb),
                         .dataInreg(dataInreg),  // uint16
                         .validInreg(validInreg),
                         .internalReset(syncReset),
                         .dsOut_re(dsOut_re),  // ufix16
                         .ds_vout(ds_vout)
                         );

  assign invalidOut_1 = 16'b0000000000000000;



  assign dataOut = (ds_vout == 1'b0 ? invalidOut_1 :
              dsOut_re);



  assign validOut = ds_vout;

endmodule  // Downsampler

