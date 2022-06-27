library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.array2d_pack.all;

entity array2d_sim is
end array2d_sim;

architecture Behavioral of array2d_sim is

    signal clk : std_logic := '0';
    
    signal test_matrix : array2d(0 to 4, 0 to 4) := (   ('0', '0', '1', '0', '1'),
                                                        ('1', '0', '0', '0', '0'),
                                                        ('0', '0', '1', '0', '1'),
                                                        ('0', '1', '0', '0', '1'),
                                                        ('1', '0', '0', '0', '1'));
    signal test_matrix_out : array2d(0 to 4, 0 to 4);
    
begin

    clk <= not clk after 1 ns;
    
    PROC: process(clk)
    variable i : natural;
    begin
        if(rising_edge(clk)) then
                test_matrix_out <= test_matrix * test_matrix;
        end if;
    end process;

end Behavioral;
