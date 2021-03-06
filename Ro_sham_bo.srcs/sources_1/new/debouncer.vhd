------------------------------------------------------------------------------------ 
---- Engineer: Aaron Crump
---- Class: EGR 426
---- Create Date: 01/30/2017 10:07:25 AM
---- Design Name: 
---- Module Name: debouncer - Behavioral
---- Project Name: ROSHAMBO
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debouncer is
    port(clk : in std_logic;
         btn_in : in std_logic;
         btn_out : out std_logic);
end debouncer;

architecture Behavioral of debouncer is
signal latch : std_logic := '0'; -- latch signal for double verification of button press
signal DB_count : std_logic_vector (3 downto 0) := "0000";

begin
    process(btn_in, clk) -- counts up to 15 on 1/10 ms clock cycles, if 0 detected it resets
        begin
        if rising_edge(clk) then
            if btn_in = '1' and latch = '0' then
                DB_count <= DB_count + 1;
                if DB_count = "1111" and btn_in = '1' then 
                latch <= '1';
                DB_count <= "0000";
                end if;
            elsif btn_in = '0' then
                latch <= '0';
                DB_count <= "0000";
            else null;
            end if;
         end if;
    end process;
    
    process(latch, btn_in) -- once DB_count reaches 15 the latch is set, the button is only "depressed" if latch is set and button is pressed
        begin
        if latch = '1' then
            if btn_in = '1' then
                btn_out <= '1';
            elsif btn_in = '0' then
--                latch <= '0';
                btn_out <= '0';
            end if;
        --else btn_out <= '0';
        end if;
     end process;

end Behavioral;
