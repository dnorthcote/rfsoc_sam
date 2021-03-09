-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR1_to_SSR8.vhd
-- Created: 2021-03-09 14:00:49
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR1_to_SSR8
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Imag/SSR1 to SSR
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_SSR1_to_SSR8 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Data_In                           :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Index                             :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        Valid_In                          :   IN    std_logic;
        Data_Out                          :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
        Valid_Out                         :   OUT   std_logic
        );
END SpectrumAnalyser_src_SSR1_to_SSR8;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR1_to_SSR8 IS

  -- Signals
  SIGNAL Data_In_unsigned                 : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL Index_unsigned                   : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL Data_In_0                        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL Data_In_0_1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous1_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL Data_In_0_2                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous2_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous2_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant3_out1        : std_logic;
  SIGNAL AND3_out1                        : std_logic;
  SIGNAL Data_In_0_3                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous3_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous3_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant4_out1        : std_logic;
  SIGNAL AND4_out1                        : std_logic;
  SIGNAL Data_In_0_4                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous4_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous4_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant5_out1        : std_logic;
  SIGNAL AND5_out1                        : std_logic;
  SIGNAL Data_In_0_5                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous5_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous5_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant6_out1        : std_logic;
  SIGNAL AND6_out1                        : std_logic;
  SIGNAL Data_In_0_6                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous6_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous6_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Compare_To_Constant7_out1        : std_logic;
  SIGNAL AND7_out1                        : std_logic;
  SIGNAL Data_In_0_7                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous7_out1 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Unit_Delay_Enabled_Synchronous7_ectrl : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Vector_Concatenate_out1          : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Delay_out1                       : std_logic;

BEGIN
  Data_In_unsigned <= Data_In;

  Index_unsigned <= unsigned(Index);

  
  Compare_To_Constant_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#0#, 3) ELSE
      '0';

  AND_out1 <= Valid_In AND Compare_To_Constant_out1;

  Data_In_0 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous_ectrl <= Unit_Delay_Enabled_Synchronous_out1 WHEN AND_out1 = '0' ELSE
      Data_In_0;

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Unit_Delay_Enabled_Synchronous_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  
  Compare_To_Constant1_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#1#, 3) ELSE
      '0';

  AND1_out1 <= Valid_In AND Compare_To_Constant1_out1;

  Data_In_0_1 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous1_ectrl <= Unit_Delay_Enabled_Synchronous1_out1 WHEN AND1_out1 = '0' ELSE
      Data_In_0_1;

  Unit_Delay_Enabled_Synchronous1_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous1_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= Unit_Delay_Enabled_Synchronous1_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_lowered_process;


  
  Compare_To_Constant2_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#2#, 3) ELSE
      '0';

  AND2_out1 <= Valid_In AND Compare_To_Constant2_out1;

  Data_In_0_2 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous2_ectrl <= Unit_Delay_Enabled_Synchronous2_out1 WHEN AND2_out1 = '0' ELSE
      Data_In_0_2;

  Unit_Delay_Enabled_Synchronous2_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous2_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= Unit_Delay_Enabled_Synchronous2_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous2_lowered_process;


  
  Compare_To_Constant3_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#3#, 3) ELSE
      '0';

  AND3_out1 <= Valid_In AND Compare_To_Constant3_out1;

  Data_In_0_3 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous3_ectrl <= Unit_Delay_Enabled_Synchronous3_out1 WHEN AND3_out1 = '0' ELSE
      Data_In_0_3;

  Unit_Delay_Enabled_Synchronous3_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous3_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1 <= Unit_Delay_Enabled_Synchronous3_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous3_lowered_process;


  
  Compare_To_Constant4_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#4#, 3) ELSE
      '0';

  AND4_out1 <= Valid_In AND Compare_To_Constant4_out1;

  Data_In_0_4 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous4_ectrl <= Unit_Delay_Enabled_Synchronous4_out1 WHEN AND4_out1 = '0' ELSE
      Data_In_0_4;

  Unit_Delay_Enabled_Synchronous4_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous4_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous4_out1 <= Unit_Delay_Enabled_Synchronous4_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous4_lowered_process;


  
  Compare_To_Constant5_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#5#, 3) ELSE
      '0';

  AND5_out1 <= Valid_In AND Compare_To_Constant5_out1;

  Data_In_0_5 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous5_ectrl <= Unit_Delay_Enabled_Synchronous5_out1 WHEN AND5_out1 = '0' ELSE
      Data_In_0_5;

  Unit_Delay_Enabled_Synchronous5_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous5_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous5_out1 <= Unit_Delay_Enabled_Synchronous5_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous5_lowered_process;


  
  Compare_To_Constant6_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#6#, 3) ELSE
      '0';

  AND6_out1 <= Valid_In AND Compare_To_Constant6_out1;

  Data_In_0_6 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous6_ectrl <= Unit_Delay_Enabled_Synchronous6_out1 WHEN AND6_out1 = '0' ELSE
      Data_In_0_6;

  Unit_Delay_Enabled_Synchronous6_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous6_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous6_out1 <= Unit_Delay_Enabled_Synchronous6_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous6_lowered_process;


  
  Compare_To_Constant7_out1 <= '1' WHEN Index_unsigned = to_unsigned(16#7#, 3) ELSE
      '0';

  AND7_out1 <= Valid_In AND Compare_To_Constant7_out1;

  Data_In_0_7 <= unsigned(Data_In_unsigned(0));

  
  Unit_Delay_Enabled_Synchronous7_ectrl <= Unit_Delay_Enabled_Synchronous7_out1 WHEN AND7_out1 = '0' ELSE
      Data_In_0_7;

  Unit_Delay_Enabled_Synchronous7_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous7_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous7_out1 <= Unit_Delay_Enabled_Synchronous7_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous7_lowered_process;


  Vector_Concatenate_out1(0) <= Unit_Delay_Enabled_Synchronous_out1;
  Vector_Concatenate_out1(1) <= Unit_Delay_Enabled_Synchronous1_out1;
  Vector_Concatenate_out1(2) <= Unit_Delay_Enabled_Synchronous2_out1;
  Vector_Concatenate_out1(3) <= Unit_Delay_Enabled_Synchronous3_out1;
  Vector_Concatenate_out1(4) <= Unit_Delay_Enabled_Synchronous4_out1;
  Vector_Concatenate_out1(5) <= Unit_Delay_Enabled_Synchronous5_out1;
  Vector_Concatenate_out1(6) <= Unit_Delay_Enabled_Synchronous6_out1;
  Vector_Concatenate_out1(7) <= Unit_Delay_Enabled_Synchronous7_out1;

  outputgen: FOR k IN 0 TO 7 GENERATE
    Data_Out(k) <= std_logic_vector(Vector_Concatenate_out1(k));
  END GENERATE;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= AND7_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Valid_Out <= Delay_out1;

END rtl;

