-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_SSR_Serializer_Real.vhd
-- Created: 2021-03-09 14:00:49
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_SSR_Serializer_Real
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Serializer Rea
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyser_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyser_src_SSR_Serializer_Real IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        SSR_Control                       :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
        );
END SpectrumAnalyser_src_SSR_Serializer_Real;


ARCHITECTURE rtl OF SpectrumAnalyser_src_SSR_Serializer_Real IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser_src_SSR_to_Vector_block2
    PORT( SSR                             :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Vector                          :   OUT   vector_of_std_logic_vector16(0 TO 7)  -- uint16 [8]
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SSR1_to_SSR8_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Data_In                         :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Index                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          Valid_In                        :   IN    std_logic;
          Data_Out                        :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Valid_Out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SSR2_to_SSR8_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Data_In                         :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Index                           :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Valid_In                        :   IN    std_logic;
          Data_Out                        :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Valid_Out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_SSR4_to_SSR8_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Data_In                         :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Index                           :   IN    std_logic;  -- ufix1
          Valid_In                        :   IN    std_logic;
          Data_Out                        :   OUT   vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          Valid_Out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser_src_Vector_to_SSR_block
    PORT( Vector                          :   IN    vector_of_std_logic_vector16(0 TO 7);  -- uint16 [8]
          SSR                             :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser_src_SSR_to_Vector_block2
    USE ENTITY work.SpectrumAnalyser_src_SSR_to_Vector_block2(rtl);

  FOR ALL : SpectrumAnalyser_src_SSR1_to_SSR8_block
    USE ENTITY work.SpectrumAnalyser_src_SSR1_to_SSR8_block(rtl);

  FOR ALL : SpectrumAnalyser_src_SSR2_to_SSR8_block
    USE ENTITY work.SpectrumAnalyser_src_SSR2_to_SSR8_block(rtl);

  FOR ALL : SpectrumAnalyser_src_SSR4_to_SSR8_block
    USE ENTITY work.SpectrumAnalyser_src_SSR4_to_SSR8_block(rtl);

  FOR ALL : SpectrumAnalyser_src_Vector_to_SSR_block
    USE ENTITY work.SpectrumAnalyser_src_Vector_to_SSR_block(rtl);

  -- Signals
  SIGNAL SSR_Control_unsigned             : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL SSR_to_Vector_out1               : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL HDL_Counter_out1                 : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SSR1_to_SSR8_out1                : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL SSR1_to_SSR8_out2                : std_logic;
  SIGNAL Bit_Slice1_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SSR2_to_SSR8_out1                : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL SSR2_to_SSR8_out2                : std_logic;
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL SSR4_to_SSR8_out1                : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL SSR4_to_SSR8_out2                : std_logic;
  SIGNAL Multiport_Switch1_out1           : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL SSR1_to_SSR8_out1_unsigned       : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL SSR2_to_SSR8_out1_unsigned       : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL SSR4_to_SSR8_out1_unsigned       : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL SSR_to_Vector_out1_unsigned      : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Multiport_Switch_out1            : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Unit_Delay_Enabled_Synchronous_out1_1 : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL y                                : std_logic_vector(127 DOWNTO 0);  -- ufix128

BEGIN
  u_SSR_to_Vector : SpectrumAnalyser_src_SSR_to_Vector_block2
    PORT MAP( SSR => Data_In,  -- ufix128
              Vector => SSR_to_Vector_out1  -- uint16 [8]
              );

  u_SSR1_to_SSR8 : SpectrumAnalyser_src_SSR1_to_SSR8_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Data_In => SSR_to_Vector_out1,  -- uint16 [8]
              Index => std_logic_vector(HDL_Counter_out1),  -- ufix3
              Valid_In => Valid_In,
              Data_Out => SSR1_to_SSR8_out1,  -- uint16 [8]
              Valid_Out => SSR1_to_SSR8_out2
              );

  u_SSR2_to_SSR8 : SpectrumAnalyser_src_SSR2_to_SSR8_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Data_In => SSR_to_Vector_out1,  -- uint16 [8]
              Index => std_logic_vector(Bit_Slice1_out1),  -- ufix2
              Valid_In => Valid_In,
              Data_Out => SSR2_to_SSR8_out1,  -- uint16 [8]
              Valid_Out => SSR2_to_SSR8_out2
              );

  u_SSR4_to_SSR8 : SpectrumAnalyser_src_SSR4_to_SSR8_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Data_In => SSR_to_Vector_out1,  -- uint16 [8]
              Index => Bit_Slice_out1,  -- ufix1
              Valid_In => Valid_In,
              Data_Out => SSR4_to_SSR8_out1,  -- uint16 [8]
              Valid_Out => SSR4_to_SSR8_out2
              );

  u_Vector_to_SSR : SpectrumAnalyser_src_Vector_to_SSR_block
    PORT MAP( Vector => Unit_Delay_Enabled_Synchronous_out1_1,  -- uint16 [8]
              SSR => y  -- ufix128
              );

  SSR_Control_unsigned <= unsigned(SSR_Control);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 7
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0#, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' AND Valid_In = '1' THEN
        HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#1#, 3);
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Bit_Slice1_out1 <= HDL_Counter_out1(1 DOWNTO 0);

  Bit_Slice_out1 <= HDL_Counter_out1(0);

  
  Multiport_Switch1_out1 <= SSR1_to_SSR8_out2 WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out2 WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out2 WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      Valid_In;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= Multiport_Switch1_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Valid_Out <= Delay_out1;

  outputgen4: FOR k IN 0 TO 7 GENERATE
    SSR1_to_SSR8_out1_unsigned(k) <= unsigned(SSR1_to_SSR8_out1(k));
  END GENERATE;

  outputgen3: FOR k IN 0 TO 7 GENERATE
    SSR2_to_SSR8_out1_unsigned(k) <= unsigned(SSR2_to_SSR8_out1(k));
  END GENERATE;

  outputgen2: FOR k IN 0 TO 7 GENERATE
    SSR4_to_SSR8_out1_unsigned(k) <= unsigned(SSR4_to_SSR8_out1(k));
  END GENERATE;

  outputgen1: FOR k IN 0 TO 7 GENERATE
    SSR_to_Vector_out1_unsigned(k) <= unsigned(SSR_to_Vector_out1(k));
  END GENERATE;

  
  Multiport_Switch_out1(0) <= SSR1_to_SSR8_out1_unsigned(0) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(0) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(0) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(0);
  
  Multiport_Switch_out1(1) <= SSR1_to_SSR8_out1_unsigned(1) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(1) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(1) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(1);
  
  Multiport_Switch_out1(2) <= SSR1_to_SSR8_out1_unsigned(2) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(2) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(2) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(2);
  
  Multiport_Switch_out1(3) <= SSR1_to_SSR8_out1_unsigned(3) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(3) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(3) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(3);
  
  Multiport_Switch_out1(4) <= SSR1_to_SSR8_out1_unsigned(4) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(4) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(4) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(4);
  
  Multiport_Switch_out1(5) <= SSR1_to_SSR8_out1_unsigned(5) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(5) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(5) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(5);
  
  Multiport_Switch_out1(6) <= SSR1_to_SSR8_out1_unsigned(6) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(6) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(6) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(6);
  
  Multiport_Switch_out1(7) <= SSR1_to_SSR8_out1_unsigned(7) WHEN SSR_Control_unsigned = to_unsigned(16#0#, 4) ELSE
      SSR2_to_SSR8_out1_unsigned(7) WHEN SSR_Control_unsigned = to_unsigned(16#1#, 4) ELSE
      SSR4_to_SSR8_out1_unsigned(7) WHEN SSR_Control_unsigned = to_unsigned(16#2#, 4) ELSE
      SSR_to_Vector_out1_unsigned(7);

  
  Unit_Delay_Enabled_Synchronous_ectrl(0) <= Unit_Delay_Enabled_Synchronous_out1(0) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(0);
  
  Unit_Delay_Enabled_Synchronous_ectrl(1) <= Unit_Delay_Enabled_Synchronous_out1(1) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(1);
  
  Unit_Delay_Enabled_Synchronous_ectrl(2) <= Unit_Delay_Enabled_Synchronous_out1(2) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(2);
  
  Unit_Delay_Enabled_Synchronous_ectrl(3) <= Unit_Delay_Enabled_Synchronous_out1(3) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(3);
  
  Unit_Delay_Enabled_Synchronous_ectrl(4) <= Unit_Delay_Enabled_Synchronous_out1(4) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(4);
  
  Unit_Delay_Enabled_Synchronous_ectrl(5) <= Unit_Delay_Enabled_Synchronous_out1(5) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(5);
  
  Unit_Delay_Enabled_Synchronous_ectrl(6) <= Unit_Delay_Enabled_Synchronous_out1(6) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(6);
  
  Unit_Delay_Enabled_Synchronous_ectrl(7) <= Unit_Delay_Enabled_Synchronous_out1(7) WHEN Multiport_Switch1_out1 = '0' ELSE
      Multiport_Switch_out1(7);

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1(0) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(1) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(2) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(3) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(4) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(5) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(6) <= to_unsigned(16#0000#, 16);
      Unit_Delay_Enabled_Synchronous_out1(7) <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1(0) <= Unit_Delay_Enabled_Synchronous_ectrl(0);
        Unit_Delay_Enabled_Synchronous_out1(1) <= Unit_Delay_Enabled_Synchronous_ectrl(1);
        Unit_Delay_Enabled_Synchronous_out1(2) <= Unit_Delay_Enabled_Synchronous_ectrl(2);
        Unit_Delay_Enabled_Synchronous_out1(3) <= Unit_Delay_Enabled_Synchronous_ectrl(3);
        Unit_Delay_Enabled_Synchronous_out1(4) <= Unit_Delay_Enabled_Synchronous_ectrl(4);
        Unit_Delay_Enabled_Synchronous_out1(5) <= Unit_Delay_Enabled_Synchronous_ectrl(5);
        Unit_Delay_Enabled_Synchronous_out1(6) <= Unit_Delay_Enabled_Synchronous_ectrl(6);
        Unit_Delay_Enabled_Synchronous_out1(7) <= Unit_Delay_Enabled_Synchronous_ectrl(7);
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  outputgen: FOR k IN 0 TO 7 GENERATE
    Unit_Delay_Enabled_Synchronous_out1_1(k) <= std_logic_vector(Unit_Delay_Enabled_Synchronous_out1(k));
  END GENERATE;

  Data_Out <= y;

END rtl;

