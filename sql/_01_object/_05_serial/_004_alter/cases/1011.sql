-- create serial,alter this serial with condition of 'INCREMENT BY -1 MINVALUE -10000000000000000000000000000000000 maxVALUE 1000000 CYCLE;'

CREATE SERIAL ddl_0001
	START WITH -10000000000000000000000000000000000;
ALTER SERIAL ddl_0001
	INCREMENT BY -1
	MINVALUE -10000000000000000000000000000000000
	maxVALUE 1000000
	CYCLE;




drop serial ddl_0001;