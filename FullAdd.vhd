LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY FullAdd IS 
	PORT(Cin, X, Y : IN STD_LOGIC;
	     S, Cout   : OUT STD_LOGIC);
END FullAdd;

ARCHITECTURE Structure OF FullAdd IS
	BEGIN
		S <= X XOR Y XOR Cin;
		Cout <= (X AND Y) OR (X AND Cin) OR (Y AND Cin);
END Structure;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE FullAdd_package IS
	COMPONENT FullAdd
		PORT(Cin, X, Y : IN STD_LOGIC;
	     	     S, Cout   : OUT STD_LOGIC);
	END COMPONENT;
END FullAdd_package;
