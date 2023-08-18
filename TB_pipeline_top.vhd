----------------------------------------------------------------
--	////// TESTBENCH ////////////////////
--This Module is an example of Pipelining
-- 		from textbook Advanced FPGA Design:
-- 		Architecture, and optimization.
-- 		I converted it to VHDL.
--
-- By  : Mike Palladino
-- Date: 8/12/23
----------------------------------------------------------------
--Libraries
----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------------------------
--Entity Instantiation
----------------------------------------------------------------
entity tb_mux_2to1 is
end entity tb_mux_2to1;



----------------------------------------------------------------
--Architecture
----------------------------------------------------------------
architecture tb_architecture of tb_mux_2to1 is
constant sim_time_limit : time := 1000 ns;  -- Simulation time limit (adjust as needed)
 constant clock_period : time := 10 ns;  -- Desired clock period (adjust as needed)
    signal tb_clk	: std_logic := '0';
	signal a_tb 	: std_logic := '0';
    signal b_tb 	: std_logic := '1';
    signal sel_tb 	: std_logic := '0';
    signal y_tb 	: std_logic;
	signal i        : natural := 0;
	signal clock_internal : std_logic := '0';

----------------------------------------------------------------
--Component Under Test ports
----------------------------------------------------------------    
	component mux_2to1
        port (
            clk : in std_logic;
			a : in std_logic;
            b : in std_logic;
            sel : in std_logic;
            y : out std_logic
        );
    end component;

	begin
-----------------------------------------------------------------
-- Instantiate/Wire up the UUT/multiplexer
-----------------------------------------------------------------	
		UUT : mux_2to1
			port map (
				clk => tb_clk,
				a => a_tb,
				b => b_tb,
				sel => sel_tb,
				y => y_tb
			);
			
	
-- Clock generation process
    process
    begin
        while now < sim_time_limit loop
            clock_internal <= not clock_internal;
            tb_clk <= clock_internal;  -- Output the clock signal

            wait for clock_period / 2;  -- Half the period for 50% duty cycle
        end loop;
        wait;
    end process;
	

----------------------------------------------------------------
--Stimulus For Test. Start Here to Modify Test Sequence.
----------------------------------------------------------------
		stim_proc: process
		begin
			a_tb <= '0';
			b_tb <= '1';
			sel_tb <= '0';
			wait for 10 ns;

			a_tb <= '1';
			b_tb <= '0';
			sel_tb <= '1';
			wait for 10 ns;
			
        wait;
    end process stim_proc;

end architecture tb_architecture;
