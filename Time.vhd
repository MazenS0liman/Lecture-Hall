LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_arith.ALL;

ENTITY Time IS
	PORT(
		Clock : IN STD_LOGIC;
		Seconds : OUT STD_LOGIC);
END Time;

ARCHITECTURE Behavior OF Time IS
	SIGNAL Ticks : integer;
	BEGIN
	PROCESS
	BEGIN
	WAIT UNTIL Clock'EVENT AND Clock = '1';
		IF rising_edge(Clock) THEN
			-- Ticks Once Every Second
			IF Ticks = 50e7 - 1 THEN
				Ticks <= 0;
				Seconds <= '1';
			ELSE
				Ticks <= Ticks + 1;
				Seconds <= '0';
			END IF;
		END IF;
	END PROCESS;
END Behavior;
			