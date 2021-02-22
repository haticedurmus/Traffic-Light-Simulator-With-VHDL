library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity trafficlightsimulator is
generic(ClockFrequencyHz : integer);
port(
    clock       : in std_logic;
    nRed        : out std_logic;
    nYellow     : out std_logic;
    nGreen      : out std_logic;
    wRed        : out std_logic;
    wYellow     : out std_logic;
    wGreen      : out std_logic;
    nPathWayRed      :out std_logic;
    nPathWayGreen    :out std_logic;
    wPathWayRed      :out std_logic;
    wPathWayGreen    :out std_logic);
end entity;
 
architecture rtl of trafficlightsimulator is
 
    -- Enumerated type declaration and state signal declaration
    type t_State is ( northYellowSituation, northGreenSituation, northYellowAgainSituation,
                      westYellowSituation, westGreenSituation, westYellowAgainSituation);
    signal State : t_State;
    signal lights :std_logic_vector (9 downto 0);
 
    signal Counter : integer range 0 to ClockFrequencyHz * 15;
 
begin
    process(State) is
    begin
      case State is
      when northGreenSituation  => lights      <= "0011001001";
      when northYellowSituation => lights      <= "0101001001";
      when westYellowSituation  => lights      <= "1000100110";
      when westGreenSituation   => lights      <= "1000010110";
      when westYellowAgainSituation  => lights <= "1000100110";
      when northYellowAgainSituation => lights <= "0101001001";
      when others => lights <= lights;
      end case;
    end process;



    process(clock) is
    begin
        if rising_edge(clock) then
                case Counter is
                    -- Green in north/south direction as default
                    when 0  => State <= northGreenSituation; Counter       <= Counter+1;
                    when 15 => State <= northYellowSituation; Counter      <= Counter+1;
                    when 20 => State <= westYellowSituation; Counter       <= Counter+1;
                    when 25 => State <= westGreenSituation; Counter        <= Counter+1;
                    when 40 => State <= westYellowAgainSituation; Counter  <= Counter+1;
                    when 45 => State <= northYellowAgainSituation; Counter <= Counter+1;
                    when 50 => Counter <= 0;
                    when others => Counter <= Counter+1;
                end case;
                nRed          <= lights(9);
                nYellow       <= lights(8);
                nGreen        <= lights(7);
                wRed          <= lights(6);
                wYellow       <= lights(5);
                wGreen        <= lights(4);
                nPathWayRed   <= lights(3);
                nPathWayGreen <= lights(2);
                wPathWayRed   <= lights(1);
                wPathWayGreen <= lights(0);
                    
        end if;
    end process;

 
end architecture;
