--TEST: pass unmatched types or formats of values to the 1st param


create class f01(
        col1 char(20),
        col2 nchar(20),
        col3 nchar varying(20),
        col4 bit(8),
        col5 bit varying(8),
        col6 numeric,
        col7 integer,
        col8 smallint,
        col9 monetary,
        col10 float,
        col11 double,
        col12 date,
        col13 time,
        col14 timestamp,
        col15 set,
        col16 multiset,
        col17 sequence,
        col18 blob,
        col19 clob,
	col20 datetime,
	col21 varchar
);

insert into f01 (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14,col15, col16, col17, col18, col19, col20, col21)
 values('aaa', n'aaa', n'aaa', b'0011', b'0011', 10, 11, 12, 13, 14, 15, '1/1/2008', '1:1:1 pm', '01/31/1994 8:15:00 pm', {10, 20}, {'abc','def'}, {50,60,70}, bit_to_blob(B'000010'), char_to_clob('character'), '2010-10-01 1:10:11.5678', 'aaa');

insert into f01 (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14,col15, col16, col17, col18, col19, col20, col21)
 values('bbb', n'bbb', n'bbb', b'1011', b'1010', 20, 21, 22, 23, 24, 25, '5/7/2010', '8:40:22 pm', '05/20/1985 8:15:00 pm', {11, 22}, {'ghj','yut'}, {80,90,100}, bit_to_blob(B'11100010'), char_to_clob('string'), '2022-11-12 12:12:12.1234', 'bbb');

show columns in f01;

--TEST: normal 
select find_in_set(col1, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: normal
select find_in_set(col2, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: normal
select find_in_set(col3, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: normal
select find_in_set(col21, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col4, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col5, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col6, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col7, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col8, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col9, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col10, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col11, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col12, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col13, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col14, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col15, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col16, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col17, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col18, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col19, 'a,b,aaa,bbb') from f01 order by 1;
--TEST: error, unmatched type
select find_in_set(col20, 'a,b,aaa,bbb') from f01 order by 1;


delete from f01;
drop table f01;


