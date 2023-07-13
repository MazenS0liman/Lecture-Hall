LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_arith.ALL;

ENTITY Timer IS
GENERIC (ClockFrequency : integer);
	PORT(
		Clock : IN STD_LOGIC;
		Seconds : OUT STD_LOGIC);
END Timer;

ARCHITECTURE Behavior OF Timer IS
	SIGNAL Ticks : integer;
	BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL Clock'EVENT AND Clock = '1';
		-- Ticks Once Every Second
		IF Ticks = ClockFrequency - 1 THEN
			Ticks <= 0;
		ELSE
			Ticks <= Ticks + 1;
		END IF;
	END PROCESS;
END Behavior;
			