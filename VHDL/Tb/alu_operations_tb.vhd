-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
-- Modified by Ayoub Yaqine to better test the desired architecture

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity alu_operations_tb is
end;

architecture bench of alu_operations_tb is

  -- Component declaration for the ALU 
  component alu_operations
      generic (
          INTEGER_BITS   : integer := 16;  -- Number of bits for the integer part
          FRACTION_BITS  : integer := 16   -- Number of bits for the fractional part
      );
      Port ( 
          clk           : in STD_LOGIC;                               -- Clock signal
          reset         : in STD_LOGIC;                                -- Reset signal
          cmd_op        : in STD_LOGIC_VECTOR(1 downto 0);              -- Command operation signal (2 bits)
          data_in1      : in STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- First input data (fixed-point)
          data_in2      : in STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- Second input data (fixed-point)
          result        : out STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0)  -- 32-bit result of the operation (fixed-point)
      );
  end component;
  
  
  
  -- Define the number of bits for the integer and fractional parts in the testbench
  constant INTEGER_BITS   : integer := 16;  -- Number of bits for the integer part
  constant FRACTION_BITS  : integer := 16;  -- Number of bits for the fractional part
  
  -- Signals for the clock, reset, command operation, data inputs, and result output
  signal clk: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal cmd_op: STD_LOGIC_VECTOR(1 downto 0);
  signal data_in1: STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- Adjusted for fixed-point size
  signal data_in2: STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- Adjusted for fixed-point size
  signal result: STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- Adjusted for fixed-point size

  -- Constant for the clock period (10 ns)
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

  -- Constants for the test 
  constant C_const_1 : real := 1.5;
  constant C_const_2 : real := 100.5;
  constant C_factor  : real := 2.0**FRACTION_BITS;  -- Scaling factor for fixed-point FPGA operations
  

-- Function to convert real values to STD_LOGIC_VECTOR for the desired format compatible with FPGA calculations
  function real_to_std_logic_vector (value : real) return STD_LOGIC_VECTOR is
    variable result_int : integer;
    variable result_vec : STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);
  begin
    result_int := integer(value);
    result_vec := std_logic_vector(to_unsigned(result_int, INTEGER_BITS + FRACTION_BITS));
    return result_vec;
  end function;

  -- Variables to store the results in real values
  signal real_result1, real_result2, real_result3 : real;

begin

  -- Instantiate the ALU component with generic parameters
  uut: alu_operations generic map (
      INTEGER_BITS => 16,
      FRACTION_BITS => 16
  )
  port map ( 
      clk      => clk,
      reset    => reset,
      cmd_op   => cmd_op,
      data_in1 => data_in1,
      data_in2 => data_in2,
      result   => result
  );

  -- Stimulus process to apply inputs and perform tests
  stimulus: process
  begin
    -- Initialization: reset the system
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;

    -- Step 1: Initialize inputs using constants and conversion
    data_in1 <= real_to_std_logic_vector(C_const_1 * C_factor);  
    data_in2 <= real_to_std_logic_vector(C_const_2 * C_factor);  

    -- Step 2: Perform tests

    -- Addition: cmd_op = "00"
    cmd_op <= "00";  -- Addition
    wait for 10 ns;
    real_result1 <= real(to_integer(signed(result))) / C_factor;

    -- Subtraction: cmd_op = "01"
    cmd_op <= "01";  -- Subtraction
    wait for 10 ns;
    real_result2 <= real(to_integer(signed(result))) / C_factor;

    -- Multiplication: cmd_op = "10"
    cmd_op <= "10";  -- Multiplication
    wait for 100 ns;
    real_result3 <= real(to_integer(signed(result))) / C_factor;

    -- Step 3: Stop the clock
    stop_the_clock <= true;
    wait;

    -- Output results as real numbers (to show in simulation output)
    report "Addition result (real): " & real'image(real_result1);
    report "Subtraction result (real): " & real'image(real_result2);
    report "Multiplication result (real): " & real'image(real_result3);

  end process;

  -- Clock generation process
  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;

