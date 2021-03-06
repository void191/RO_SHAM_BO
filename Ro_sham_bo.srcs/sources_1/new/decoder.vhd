----------------------------------------------------------------------------------
-- Engineer: Aaron Crump
-- Class: EGR 426
-- Create Date: 01/31/2017 08:14:47 AM
-- Design Name: 
-- Module Name: decoder - Behavioral
-- Project Name: ROSHAMBO
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
  Port (RPS_in : in integer; -- rock paper scissors selection input
        -- rock paper scissors selection seven segment ouptu
        RPS_out : out std_logic_vector (6 downto 0);
        digit_in : in integer; -- score value input
        -- score value seven segment display output
        digit_out : out std_logic_vector (6 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
rock_paper_scissor_decode: process(RPS_in)
    begin
        case(RPS_in) is
            when 0 => RPS_out <= "1111010"; --r
            when 1 => RPS_out <= "0011000"; --p
            when 2 => RPS_out <= "0100100"; --s
            when others => RPS_out <= "1111111";  -- blank for everything else
         end case;
    end process;


bcd_to_decimal: process(digit_in)
    begin
        case(digit_in) is
            when 0 => digit_out <= "0000001";  -- '0'
            when 1 => digit_out <= "1001111";  -- '1'
            when 2 => digit_out <= "0010010";  -- '2'
            when 3 => digit_out <= "0000110";  -- '3'
            when 4 => digit_out <= "1001100";  -- '4' 
            when 5 => digit_out <= "0100100";  -- '5'
            when 6 => digit_out <= "0100000";  -- '6'
            when 7 => digit_out <= "0001111";  -- '7'
            when 8 => digit_out <= "0000000";  -- '8'
            when 9 => digit_out <= "0000100";  -- '9'
            when others => digit_out <= "1111111";  -- blank for everything else
         end case;
    end process;

end Behavioral;
