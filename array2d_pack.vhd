library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package array2d_pack is

    type array2d is array (natural range <>, natural range <>) of bit;
    
    function "*" (L : array2d; R : array2d) return array2d;
    
    
end package;

package body array2d_pack is


	function "*" (L : array2d; R : array2d) return array2d is
		constant L_rows : natural := L'length(1) - 1;
		constant L_columns : natural := L'length(2) - 1;
		constant R_rows : natural := R'length(1) - 1;
		constant R_columns : natural := R'length(2) - 1;
		variable result : array2d(0 to L_rows, 0 to R_columns);
		variable row_L : integer := 0;
		variable col_R : integer := 0;
		variable col_L : integer := 0;
	begin
		for row_L in 0 to L_rows loop
			for col_R in 0 to R_columns loop
				result(row_L, col_R) := '0';
				for col_L in 0 to L_columns loop
					result(row_L, col_R) := result(row_L, col_R) xor (L(row_L, col_L) and R(col_L, col_R));
				end loop;
			end loop;
		end loop;

		return result;

	end function;

end package body array2d_pack;
