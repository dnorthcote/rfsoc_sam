-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_RADIX22FFT_SDF1_5_block6.vhd
-- Created: 2021-03-09 14:00:48
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_RADIX22FFT_SDF1_5_block6
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 8192/RADIX22FFT_SDF1_
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_RADIX22FFT_SDF1_5_block6 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_5_1_re_dly                    :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En15
        din_5_1_im_dly                    :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En15
        din_5_vld_dly                     :   IN    std_logic;
        rd_5_Addr                         :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        rd_5_Enb                          :   IN    std_logic;
        twdl_5_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_5_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_5_1_vld                      :   IN    std_logic;
        proc_5_enb                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_5_1_re                       :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        dout_5_1_im                       :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
        dout_5_1_vld                      :   OUT   std_logic;
        dinXTwdl_5_1_vld                  :   OUT   std_logic
        );
END SpectrumAnalyser_src_RADIX22FFT_SDF1_5_block6;


ARCHITECTURE rtl OF SpectrumAnalyser_src_RADIX22FFT_SDF1_5_block6 IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_src_Complex4Multiply_block26
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          din_im                          :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          din_5_vld_dly                   :   IN    std_logic;
          twdl_5_1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_5_1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dinXTwdl_im                     :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dinXTwdl_5_1_vld                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SDFCommutator5_block6
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_5_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          xf_im                           :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dinXTwdlf_im                    :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          btf1_im                         :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          btf2_re                         :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          btf2_im                         :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          btf_vld                         :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          wrData_im                       :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          wrAddr                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          wrEnb                           :   OUT   std_logic;
          dout_5_1_re                     :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dout_5_1_im                     :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En15
          dout_5_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_src_Complex4Multiply_block26
    USE ENTITY work.SpectrumAnalyser_src_Complex4Multiply_block26(rtl);

  FOR ALL : SpectrumAnalyser_src_SimpleDualPortRAM_generic
    USE ENTITY work.SpectrumAnalyser_src_SimpleDualPortRAM_generic(rtl);

  FOR ALL : SpectrumAnalyser_src_SDFCommutator5_block6
    USE ENTITY work.SpectrumAnalyser_src_SDFCommutator5_block6(rtl);

  -- Signals
  SIGNAL din_5_1_re_dly_signed            : signed(19 DOWNTO 0);  -- sfix20_En15
  SIGNAL din_re                           : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL din_5_1_im_dly_signed            : signed(19 DOWNTO 0);  -- sfix20_En15
  SIGNAL din_im                           : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL dinXTwdl_re                      : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL dinXTwdl_im                      : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL dinXTwdl_5_1_vld_1               : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL dinXTwdl_im_signed               : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL btf2_re                          : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL btf1_im                          : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL btf1_re                          : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL dinXTwdlf_im                     : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL dinXTwdlf_re                     : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL xf_im                            : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL wrData_im                        : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL wrAddr                           : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL x_im_signed                      : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL wrData_re                        : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL x_re                             : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL x_re_signed                      : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(21 DOWNTO 0);  -- sfix22
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(21 DOWNTO 0);  -- sfix22
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(21 DOWNTO 0);  -- sfix22
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(21 DOWNTO 0);  -- sfix22
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(20 DOWNTO 0);  -- sfix21
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_add_cast      : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(21 DOWNTO 0);  -- sfix22_En15
  SIGNAL xf_re                            : signed(20 DOWNTO 0);  -- sfix21_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_5_1_re_tmp                  : std_logic_vector(20 DOWNTO 0);  -- ufix21
  SIGNAL dout_5_1_im_tmp                  : std_logic_vector(20 DOWNTO 0);  -- ufix21

BEGIN
  u_MUL4 : SpectrumAnalyser_src_Complex4Multiply_block26
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_re => std_logic_vector(din_re),  -- sfix21_En15
              din_im => std_logic_vector(din_im),  -- sfix21_En15
              din_5_vld_dly => din_5_vld_dly,
              twdl_5_1_re => twdl_5_1_re,  -- sfix16_En14
              twdl_5_1_im => twdl_5_1_im,  -- sfix16_En14
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix21_En15
              dinXTwdl_im => dinXTwdl_im,  -- sfix21_En15
              dinXTwdl_5_1_vld => dinXTwdl_5_1_vld_1
              );

  u_dataMEM_im_0_5 : SpectrumAnalyser_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 21
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_5_Addr,
              rd_dout => x_im
              );

  u_dataMEM_re_0_5 : SpectrumAnalyser_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 21
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_5_Addr,
              rd_dout => x_re
              );

  u_SDFCOMMUTATOR_5 : SpectrumAnalyser_src_SDFCommutator5_block6
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_5_vld_dly => din_5_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix21_En15
              xf_im => std_logic_vector(xf_im),  -- sfix21_En15
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix21_En15
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix21_En15
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix21_En15
              btf1_im => std_logic_vector(btf1_im),  -- sfix21_En15
              btf2_re => std_logic_vector(btf2_re),  -- sfix21_En15
              btf2_im => std_logic_vector(btf2_im),  -- sfix21_En15
              btf_vld => btf_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix21_En15
              wrData_im => wrData_im,  -- sfix21_En15
              wrAddr => wrAddr,  -- ufix8
              wrEnb => wrEnb,
              dout_5_1_re => dout_5_1_re_tmp,  -- sfix21_En15
              dout_5_1_im => dout_5_1_im_tmp,  -- sfix21_En15
              dout_5_1_vld => dout_5_1_vld
              );

  din_5_1_re_dly_signed <= signed(din_5_1_re_dly);

  din_re <= resize(din_5_1_re_dly_signed, 21);

  din_5_1_im_dly_signed <= signed(din_5_1_im_dly);

  din_im <= resize(din_5_1_im_dly_signed, 21);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld <= rd_5_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  x_im_signed <= signed(x_im);

  x_re_signed <= signed(x_re);

  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(16#000000#, 22);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(16#000000#, 22);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(16#000000#, 22);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(16#000000#, 22);
      Radix22ButterflyG1_x_re_dly1 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_x_im_dly1 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_x_vld_dly1 <= '0';
      xf_re <= to_signed(16#000000#, 21);
      xf_im <= to_signed(16#000000#, 21);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#000000#, 21);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
        Radix22ButterflyG1_x_re_dly1 <= x_re_signed;
        Radix22ButterflyG1_x_im_dly1 <= x_im_signed;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_5_enb AND dinXTwdl_5_1_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_5_enb) AND dinXTwdl_5_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 22);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 22);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 22);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 22);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 22);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 22);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 22);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 22);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(20 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(20 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(20 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(20 DOWNTO 0);

  dout_5_1_re <= dout_5_1_re_tmp;

  dout_5_1_im <= dout_5_1_im_tmp;

  dinXTwdl_5_1_vld <= dinXTwdl_5_1_vld_1;

END rtl;
