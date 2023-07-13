Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;




Entity proj IS
	Port (
		enter_sensor,exit_sensor,sinitaize_sensor : IN STD_LOGIC;
		clock : IN STD_LOGIC;
		motor : out std_logic;
		bcd0,bcd1 : OUT std_logic_vector(1 to 7));
END proj;

Architecture arc OF proj IS

SIGNAL Count0 : INTEGER RANGE 0 TO 9;
SIGNAL Count1 : INTEGER RANGE 0 TO 9;
SIGNAL Seconds : STD_LOGIC;
SIGNAL Ticks : integer;

BEGIN
PROCESS(clock)
	BEGIN
		IF rising_edge(Clock) THEN
					-- Ticks Once Every Second
					IF Ticks = 50e6 - 1 THEN
						Ticks <= 0;
						IF (clock'EVENT AND clock = '1') THEN
						
							IF(enter_sensor='0' AND exit_sensor='1') THEN
								IF (Count0 = 9) THEN
									Count0 <= 0;
									IF (Count1 = 9) THEN
										Count1 <= 0;
									ELSE
										Count1 <= Count1 + 1;
									END IF;
								ELSE
									Count0 <= Count0 + 1;
								END IF;
							END IF ;
							
							IF(exit_sensor='0' AND enter_sensor='1') THEN
								IF (Count0 = 0 AND Count1 = 0) THEN
									Count0 <= 0; 
									Count1 <= 0;
								ELSIF(Count0 = 0) THEN
									Count0 <= 9;
									Count1 <= Count1 - 1;
								ELSE
									Count0 <= Count0 - 1;
								END IF;
						END IF;
						
						IF(sinitaize_sensor='0')THEN
							motor <= '1';
						ELSE
							motor <= '0';
						END IF;
					END IF;
				ELSE
					Ticks <= Ticks + 1;
			END IF;
		END IF;
End PROCESS ;

PROCESS (Count0)
BEGIN

			CASE Count0 IS
			WHEN 0 => bcd0<="0000001";
			WHEN 1 => bcd0<="1001111";
			WHEN 2 => bcd0<="0010010";
			WHEN 3 => bcd0<="0000110";
			WHEN 4 => bcd0<="1001100";
			WHEN 5 => bcd0<="0100100";
			WHEN 6 => bcd0<="0100000";
			WHEN 7 => bcd0<="0001111";
			WHEN 8 => bcd0<="0000000";
			WHEN 9 => bcd0<="0000100";
			WHEN OTHERS => bcd0<="-------";
			END Case;
END PROCESS;

PROCESS (Count1)
BEGIN
case Count1 IS
			WHEN 0 => bcd1<="0000001";
			WHEN 1 => bcd1<="1001111";
			WHEN 2 => bcd1<="0010010";
			WHEN 3 => bcd1<="0000110";
			WHEN 4 => bcd1<="1001100";
			WHEN 5 => bcd1<="0100100";
			WHEN 6 => bcd1<="0100000";
			WHEN 7 => bcd1<="0001111";
			WHEN 8 => bcd1<="0000000";
			WHEN 9 => bcd1<="0000100";
			WHEN OTHERS => bcd1<="-------";
			End Case;
END PROCESS;
end arc;