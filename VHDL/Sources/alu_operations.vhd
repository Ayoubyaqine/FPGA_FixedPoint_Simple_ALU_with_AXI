-- Created by Ayoub Yaqine on 10/02/2025, free to be used in any project

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Entity definition for a simple ALU with fixed-point arithmetic
entity alu_operations is
    generic (
        INTEGER_BITS   : integer := 16;  -- Number of bits for the integer part
        FRACTION_BITS  : integer := 16   -- Number of bits for the fractional part
    );
    Port ( 
        clk           : in STD_LOGIC;                                -- Clock signal
        reset         : in STD_LOGIC;                                -- Reset signal
        cmd_op        : in STD_LOGIC_VECTOR(1 downto 0);              -- Command operation signal (2 bits)
        data_in1      : in STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- First input data (fixed-point)
        data_in2      : in STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0);  -- Second input data (fixed-point)
        result        : out STD_LOGIC_VECTOR(INTEGER_BITS + FRACTION_BITS - 1 downto 0)  -- 32-bit result of the operation (fixed-point)
    );
end alu_operations;

architecture Behavioral of alu_operations is
    -- Temporary signal to hold the result of multiplication 
    signal tmp_result : STD_LOGIC_VECTOR(2 * (INTEGER_BITS + FRACTION_BITS) - 1 downto 0) := (others => '0');
begin

    -- Process block that reacts to changes in clock or reset signals
    process(clk, reset)
    begin
        -- Reset condition: when reset is '1', set the result to zero
        if reset = '1' then
            result <= (others => '0');  
        -- On rising edge of the clock, perform the appropriate operation based on cmd_op
        elsif rising_edge(clk) then
            case cmd_op is
                -- Addition operation: perform fixed-point addition between data_in1 and data_in2
                when "00" =>  
                    result <= std_logic_vector(signed(data_in1) + signed(data_in2));  
                
                -- Subtraction operation: perform fixed-point subtraction between data_in1 and data_in2
                when "01" =>  
                    result <= std_logic_vector(signed(data_in1) - signed(data_in2));  
                
                -- Multiplication operation: multiply data_in1 and data_in2 and store the result
                when "10" =>  
                    tmp_result <= std_logic_vector(signed(data_in1) * signed(data_in2));  
                -- Store the appropriate bits from the result
                    result <= tmp_result(tmp_result'high) & tmp_result((INTEGER_BITS + FRACTION_BITS + INTEGER_BITS - 2) downto (INTEGER_BITS + FRACTION_BITS)) & tmp_result((INTEGER_BITS + FRACTION_BITS - 1) downto (INTEGER_BITS));                
                -- Default case: if cmd_op does not match any known operation, set result to zero
                when others =>  
                    result <= (others => '0');
            end case;
        end if;
    end process;

end Behavioral;
