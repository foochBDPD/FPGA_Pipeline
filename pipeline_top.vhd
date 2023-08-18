----------------------------------------------------------------
--	This Module is an example of Pipelining
-- 		from textbook Advanced FPGA Design:
-- 		Architecture, and optimization.
-- 		I converted it to VHDL.
--
-- By  : Mike Palladino
-- Date: 8/12/23
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
    port (
        clk : in std_logic;
		a : in std_logic;
        b : in std_logic;
        sel : in std_logic;
        y : out std_logic
    );
end entity mux_2to1;

architecture rtl of mux_2to1 is
begin
    process (a, b, sel)
    begin
        if sel = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end architecture rtl;
