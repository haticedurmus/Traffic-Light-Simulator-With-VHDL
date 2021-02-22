library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity trafficlightsimulatorTB is
end entity;
 
architecture sim of trafficlightsimulatorTB is
 
    constant ClockFrequencyHz : integer := 100; -- 100 Hz
    constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
 
    signal clock        :std_logic := '1';
    signal nRed         :std_logic;
    signal nYellow      :std_logic;
    signal nGreen       :std_logic;
    signal wRed         :std_logic;
    signal wYellow      :std_logic;
    signal wGreen       :std_logic;
    signal nPathWayRed  :std_logic;
    signal nPathWayGreen:std_logic;
    signal wPathWayRed  :std_logic;
    signal wPathWayGreen:std_logic;

 
begin
 
    i_TrafficLights : entity work.trafficlightsimulator(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clock            => clock,
        nRed    		 => nRed,
        nYellow			 => nYellow,
        nGreen  		 => nGreen,
        wRed    		 => wRed,
        wYellow 		 => wYellow,
        wGreen   		 => wGreen,
        wPathWayRed      => wPathWayRed,
        wPathWayGreen    => wPathWayGreen,
        nPathWayRed      => nPathWayRed,
        nPathWayGreen    => nPathWayGreen);
 
    clock <= not clock after ClockPeriod / 2;
 
    -- Testbench sequence
    process is
    begin
        wait until rising_edge(clock);
        wait until rising_edge(clock);
 
       
        wait;
    end process;
 
end architecture;
