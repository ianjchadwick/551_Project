// -------------------------------------------------------------
// 
// File Name: C:\Users\jwbie\OneDrive\Documents\Academics\F22\551\551_Final_Project\fft_v2\hdl\joe_fft\TWDLROM_3_3.v
// Created: 2022-12-08 20:30:07
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: TWDLROM_3_3
// Source Path: joe_fft/FFT/TWDLROM_3_3
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module TWDLROM_3_3
          (clk,
           reset,
           enb_1_8_0,
           dout_2_vld,
           twdl_3_3_re,
           twdl_3_3_im);


  input   clk;
  input   reset;
  input   enb_1_8_0;
  input   dout_2_vld;
  output  signed [16:0] twdl_3_3_re;  // sfix17_En15
  output  signed [16:0] twdl_3_3_im;  // sfix17_En15


  reg [1:0] Radix22TwdlMapping_cnt;  // ufix2
  reg [1:0] Radix22TwdlMapping_phase;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1;  // ufix3
  reg [3:0] Radix22TwdlMapping_twdlAddr_raw;  // ufix4
  reg  Radix22TwdlMapping_twdlAddrMap;  // ufix1
  reg  Radix22TwdlMapping_twdl45Reg;
  reg  Radix22TwdlMapping_dvldReg1;
  reg  Radix22TwdlMapping_dvldReg2;
  reg [1:0] Radix22TwdlMapping_cnt_next;  // ufix2
  reg [1:0] Radix22TwdlMapping_phase_next;  // ufix2
  reg [2:0] Radix22TwdlMapping_octantReg1_next;  // ufix3
  reg [3:0] Radix22TwdlMapping_twdlAddr_raw_next;  // ufix4
  reg  Radix22TwdlMapping_twdlAddrMap_next;  // ufix1
  reg  Radix22TwdlMapping_twdl45Reg_next;
  reg  Radix22TwdlMapping_dvldReg1_next;
  reg  Radix22TwdlMapping_dvldReg2_next;
  reg  twdlAddr;  // ufix1
  reg  twdlAddrVld;
  reg [2:0] twdlOctant;  // ufix3
  reg  twdl45;
  wire signed [16:0] Twiddle_re_table_data [0:1];  // sfix17_En15 [2]
  wire signed [16:0] twiddleS_re;  // sfix17_En15
  reg signed [16:0] twiddleReg_re;  // sfix17_En15
  wire signed [16:0] Twiddle_im_table_data [0:1];  // sfix17_En15 [2]
  wire signed [16:0] twiddleS_im;  // sfix17_En15
  reg signed [16:0] twiddleReg_im;  // sfix17_En15
  reg [2:0] twdlOctantReg;  // ufix3
  reg  twdl45Reg;
  reg signed [16:0] twdl_3_3_re_1;  // sfix17_En15
  reg signed [16:0] twdl_3_3_im_1;  // sfix17_En15
  reg [2:0] Radix22TwdlMapping_octant;  // ufix3
  reg [3:0] Radix22TwdlMapping_cnt_cast;  // ufix4
  reg signed [9:0] Radix22TwdlMapping_sub_cast;  // sfix10_En1
  reg signed [9:0] Radix22TwdlMapping_sub_temp;  // sfix10_En1
  reg signed [5:0] Radix22TwdlMapping_sub_temp_0;  // sfix6
  reg signed [5:0] Radix22TwdlMapping_sub_temp_1;  // sfix6
  reg signed [9:0] Radix22TwdlMapping_sub_cast_0;  // sfix10_En1
  reg signed [9:0] Radix22TwdlMapping_sub_temp_2;  // sfix10_En1
  reg signed [9:0] Radix22TwdlMapping_sub_cast_1;  // sfix10_En1
  reg signed [9:0] Radix22TwdlMapping_sub_temp_3;  // sfix10_En1
  reg [3:0] Radix22TwdlMapping_t_0_0;  // ufix4
  reg signed [5:0] Radix22TwdlMapping_t_1;  // sfix6
  reg signed [5:0] Radix22TwdlMapping_t_2_0;  // sfix6
  reg signed [16:0] Radix22TwdlOctCorr_twdlIn_re;  // sfix17_En15
  reg signed [16:0] Radix22TwdlOctCorr_twdlIn_im;  // sfix17_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_0;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_1;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_2;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_3;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_4;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_5;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_6;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_7;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_8;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_9;  // sfix18_En15
  reg signed [17:0] Radix22TwdlOctCorr_cast_10;  // sfix18_En15


  // Radix22TwdlMapping
  always @(posedge clk or posedge reset)
    begin : Radix22TwdlMapping_process
      if (reset == 1'b1) begin
        Radix22TwdlMapping_octantReg1 <= 3'b000;
        Radix22TwdlMapping_twdlAddr_raw <= 4'b0000;
        Radix22TwdlMapping_twdlAddrMap <= 1'b0;
        Radix22TwdlMapping_twdl45Reg <= 1'b0;
        Radix22TwdlMapping_dvldReg1 <= 1'b0;
        Radix22TwdlMapping_dvldReg2 <= 1'b0;
        Radix22TwdlMapping_cnt <= 2'b10;
        Radix22TwdlMapping_phase <= 2'b00;
      end
      else begin
        if (enb_1_8_0) begin
          Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
          Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
          Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
          Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
          Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
          Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
          Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
          Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
        end
      end
    end

  always @(Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_2_vld) begin
    Radix22TwdlMapping_sub_temp = 10'sb0000000000;
    Radix22TwdlMapping_sub_temp_0 = 6'sb000000;
    Radix22TwdlMapping_sub_temp_1 = 6'sb000000;
    Radix22TwdlMapping_sub_temp_2 = 10'sb0000000000;
    Radix22TwdlMapping_sub_temp_3 = 10'sb0000000000;
    Radix22TwdlMapping_cnt_cast = 4'b0000;
    Radix22TwdlMapping_sub_cast = 10'sb0000000000;
    Radix22TwdlMapping_sub_cast_0 = 10'sb0000000000;
    Radix22TwdlMapping_sub_cast_1 = 10'sb0000000000;
    Radix22TwdlMapping_t_0_0 = 4'b0000;
    Radix22TwdlMapping_t_1 = 6'sb000000;
    Radix22TwdlMapping_t_2_0 = 6'sb000000;
    Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase;
    Radix22TwdlMapping_twdlAddr_raw_next = Radix22TwdlMapping_twdlAddr_raw;
    Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_twdlAddrMap;
    Radix22TwdlMapping_twdl45Reg_next = Radix22TwdlMapping_twdl45Reg;
    Radix22TwdlMapping_dvldReg2_next = Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next = dout_2_vld;
    case ( Radix22TwdlMapping_twdlAddr_raw)
      4'b0010 :
        begin
          Radix22TwdlMapping_octant = 3'b000;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      4'b0100 :
        begin
          Radix22TwdlMapping_octant = 3'b001;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      4'b0110 :
        begin
          Radix22TwdlMapping_octant = 3'b010;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      4'b1000 :
        begin
          Radix22TwdlMapping_octant = 3'b011;
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
      4'b1010 :
        begin
          Radix22TwdlMapping_octant = 3'b100;
          Radix22TwdlMapping_twdl45Reg_next = 1'b1;
        end
      default :
        begin
          Radix22TwdlMapping_octant = Radix22TwdlMapping_twdlAddr_raw[3:1];
          Radix22TwdlMapping_twdl45Reg_next = 1'b0;
        end
    endcase
    Radix22TwdlMapping_octantReg1_next = Radix22TwdlMapping_octant;
    case ( Radix22TwdlMapping_octant)
      3'b000 :
        begin
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_twdlAddr_raw[0];
        end
      3'b001 :
        begin
          Radix22TwdlMapping_t_1 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_0 = 6'sb000100 - Radix22TwdlMapping_t_1;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_0[0];
        end
      3'b010 :
        begin
          Radix22TwdlMapping_t_2_0 = {2'b0, Radix22TwdlMapping_twdlAddr_raw};
          Radix22TwdlMapping_sub_temp_1 = Radix22TwdlMapping_t_2_0 - 6'sb000100;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_1[0];
        end
      3'b011 :
        begin
          Radix22TwdlMapping_sub_cast_0 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 1'b0}};
          Radix22TwdlMapping_sub_temp_2 = 10'sb0000010000 - Radix22TwdlMapping_sub_cast_0;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_2[1];
        end
      3'b100 :
        begin
          Radix22TwdlMapping_sub_cast_1 = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 1'b0}};
          Radix22TwdlMapping_sub_temp_3 = Radix22TwdlMapping_sub_cast_1 - 10'sb0000010000;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp_3[1];
        end
      default :
        begin
          Radix22TwdlMapping_sub_cast = {5'b0, {Radix22TwdlMapping_twdlAddr_raw, 1'b0}};
          Radix22TwdlMapping_sub_temp = 10'sb0000011000 - Radix22TwdlMapping_sub_cast;
          Radix22TwdlMapping_twdlAddrMap_next = Radix22TwdlMapping_sub_temp[1];
        end
    endcase
    if (Radix22TwdlMapping_phase == 2'b00) begin
      Radix22TwdlMapping_twdlAddr_raw_next = 4'b0000;
    end
    else if (Radix22TwdlMapping_phase == 2'b01) begin
      Radix22TwdlMapping_t_0_0 = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = Radix22TwdlMapping_t_0_0 <<< 8'd1;
    end
    else if (Radix22TwdlMapping_phase == 2'b10) begin
      Radix22TwdlMapping_twdlAddr_raw_next = {2'b0, Radix22TwdlMapping_cnt};
    end
    else begin
      Radix22TwdlMapping_cnt_cast = {2'b0, Radix22TwdlMapping_cnt};
      Radix22TwdlMapping_twdlAddr_raw_next = (Radix22TwdlMapping_cnt_cast <<< 8'd1) + Radix22TwdlMapping_cnt_cast;
    end
    if (dout_2_vld && (Radix22TwdlMapping_cnt > 2'b00)) begin
      Radix22TwdlMapping_phase_next = Radix22TwdlMapping_phase + 2'b10;
    end
    Radix22TwdlMapping_cnt_next = 2'b10;
    twdlAddr = Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld = Radix22TwdlMapping_dvldReg2;
    twdlOctant = Radix22TwdlMapping_octantReg1;
    twdl45 = Radix22TwdlMapping_twdl45Reg;
  end



  // Twiddle ROM1
  assign Twiddle_re_table_data[0] = 17'sb01000000000000000;
  assign Twiddle_re_table_data[1] = 17'sb00111011001000010;
  assign twiddleS_re = Twiddle_re_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_RE_process
      if (reset == 1'b1) begin
        twiddleReg_re <= 17'sb00000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          twiddleReg_re <= twiddleS_re;
        end
      end
    end



  // Twiddle ROM2
  assign Twiddle_im_table_data[0] = 17'sb00000000000000000;
  assign Twiddle_im_table_data[1] = 17'sb11100111100000100;
  assign twiddleS_im = Twiddle_im_table_data[twdlAddr];



  always @(posedge clk or posedge reset)
    begin : TWIDDLEROM_IM_process
      if (reset == 1'b1) begin
        twiddleReg_im <= 17'sb00000000000000000;
      end
      else begin
        if (enb_1_8_0) begin
          twiddleReg_im <= twiddleS_im;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        twdlOctantReg <= 3'b000;
      end
      else begin
        if (enb_1_8_0) begin
          twdlOctantReg <= twdlOctant;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        twdl45Reg <= 1'b0;
      end
      else begin
        if (enb_1_8_0) begin
          twdl45Reg <= twdl45;
        end
      end
    end



  // Radix22TwdlOctCorr
  always @(twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re) begin
    Radix22TwdlOctCorr_cast_0 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_2 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_4 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_6 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_8 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_10 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_1 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_3 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_5 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_7 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_cast_9 = 18'sb000000000000000000;
    Radix22TwdlOctCorr_twdlIn_re = twiddleReg_re;
    Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
    if (twdl45Reg) begin
      case ( twdlOctantReg)
        3'b000 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 17'sb00101101010000010;
            Radix22TwdlOctCorr_twdlIn_im = 17'sb11010010101111110;
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 17'sb11010010101111110;
            Radix22TwdlOctCorr_twdlIn_im = 17'sb11010010101111110;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 17'sb11010010101111110;
            Radix22TwdlOctCorr_twdlIn_im = 17'sb00101101010000010;
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = 17'sb00101101010000010;
            Radix22TwdlOctCorr_twdlIn_im = 17'sb11010010101111110;
          end
      endcase
    end
    else begin
      case ( twdlOctantReg)
        3'b000 :
          begin
          end
        3'b001 :
          begin
            Radix22TwdlOctCorr_cast = {twiddleReg_im[16], twiddleReg_im};
            Radix22TwdlOctCorr_cast_0 =  - (Radix22TwdlOctCorr_cast);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_0[16:0];
            Radix22TwdlOctCorr_cast_5 = {twiddleReg_re[16], twiddleReg_re};
            Radix22TwdlOctCorr_cast_6 =  - (Radix22TwdlOctCorr_cast_5);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_6[16:0];
          end
        3'b010 :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_cast_7 = {twiddleReg_re[16], twiddleReg_re};
            Radix22TwdlOctCorr_cast_8 =  - (Radix22TwdlOctCorr_cast_7);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_8[16:0];
          end
        3'b011 :
          begin
            Radix22TwdlOctCorr_cast_1 = {twiddleReg_re[16], twiddleReg_re};
            Radix22TwdlOctCorr_cast_2 =  - (Radix22TwdlOctCorr_cast_1);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_2[16:0];
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_im;
          end
        3'b100 :
          begin
            Radix22TwdlOctCorr_cast_3 = {twiddleReg_re[16], twiddleReg_re};
            Radix22TwdlOctCorr_cast_4 =  - (Radix22TwdlOctCorr_cast_3);
            Radix22TwdlOctCorr_twdlIn_re = Radix22TwdlOctCorr_cast_4[16:0];
            Radix22TwdlOctCorr_cast_9 = {twiddleReg_im[16], twiddleReg_im};
            Radix22TwdlOctCorr_cast_10 =  - (Radix22TwdlOctCorr_cast_9);
            Radix22TwdlOctCorr_twdlIn_im = Radix22TwdlOctCorr_cast_10[16:0];
          end
        default :
          begin
            Radix22TwdlOctCorr_twdlIn_re = twiddleReg_im;
            Radix22TwdlOctCorr_twdlIn_im = twiddleReg_re;
          end
      endcase
    end
    twdl_3_3_re_1 = Radix22TwdlOctCorr_twdlIn_re;
    twdl_3_3_im_1 = Radix22TwdlOctCorr_twdlIn_im;
  end



  assign twdl_3_3_re = twdl_3_3_re_1;

  assign twdl_3_3_im = twdl_3_3_im_1;

endmodule  // TWDLROM_3_3

