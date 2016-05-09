autocommit off;
create table test_translate_table(
    c1 varchar(50),
    c2 varchar(50),
    c3 varchar(50),
    c4 varchar(50),
	c5 varchar(50)
);
insert into test_translate_table (c1,c2,c3) values('2KRW229', '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ', '9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX');
SELECT '2KRW229',c2,c3, translate( '2KRW229',c2,c3) FROM test_translate_table;
SELECT c1,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c3, translate( c1,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c3) FROM test_translate_table;
SELECT c1,c2,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( c1,c2,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT '2KRW229','0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c3, translate( '2KRW229','0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c3) FROM test_translate_table;
SELECT '2KRW229',c2,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( '2KRW229',c2,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT c1,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ','9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( c1,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ','9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT c1,c2,c3, translate( c1,c2,c3) FROM test_translate_table;
SELECT '2KRW229','0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c5, translate( '2KRW229','0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c5) FROM test_translate_table;
SELECT '2KRW229',c4,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( '2KRW229',c4,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT c5,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ','9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( c5,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ','9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT '2KRW229',c4,c5, translate( '2KRW229',c4,c5) FROM test_translate_table;
SELECT c5,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c5, translate( c5,'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ',c5) FROM test_translate_table;
SELECT c5,c4,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX', translate( c5,c4,'9999999999XXXXXXXXXXXXXXXXXXXXXXXXXX') FROM test_translate_table;
SELECT c5,c4,c5, translate( c5,c4,c5) FROM test_translate_table;
drop table test_translate_table;
rollback;