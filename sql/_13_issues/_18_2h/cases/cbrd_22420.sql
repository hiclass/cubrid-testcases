--get optimization level into :c;
drop table if exists t;
create table t(a double);
create  index idx on t(COS(a)) with online;
insert into t values(0);
insert into t values(pi()*2);
alter  index idx on t(COS(a),a) REBUILD;
insert into t values(pi()*2);
drop table t;

drop table if exists t1;
create table t1 (FirstName varchar(20),LastName varchar(20),Age int,gender char (1));
insert into t1 value('yin', 'jian ye',31,'M');
CREATE INDEX first_name_lower ON t1 (LOWER(FirstName)) with online;
ALTER  INDEX first_name_lower on t1 (upper(FirstName))REBUILD;
drop  table t1 ;
create table t1 (FirstName varchar(20),LastName varchar(20),Age int,gender char (1));
insert into t1 value('yin', 'jian ye',31,'M');
CREATE INDEX first_name_lower ON t1 (LOWER(FirstName)) with online;
ALTER  INDEX first_name_lower on t1(firstname) WHERE LOWER(FirstName)='yin' REBUILD;

--set optimization level 513;

SELECT /*+ recompile */ * FROM t1 WHERE LOWER(FirstName)='yin' using index first_name_lower(+);
drop  table t1 ;

create table t1 (FirstName varchar(20),LastName varchar(20),Age int,gender char (1));
insert into t1 value('yin', 'jian ye',31,'M');
CREATE INDEX first_name_lower ON t1 (LOWER(FirstName)) with online;
--TEST Alter successfully 
ALTER  INDEX first_name_lower on t1(firstname) WHERE LOWER(FirstName)='yin' REBUILD;
--TEST Alter successfully 
ALTER  INDEX first_name_lower on t1(LOWER(FirstName)) REBUILD;
drop table t1;

create table t1 (i int, j int);
CREATE INDEX idx1 ON t1 (i) with online;
CREATE  INDEX idx2 on t1(j);
ALTER  INDEX idx1 on t1(j) REBUILD;
show indexes from t1;
drop  table t1 ;

create table t1 (i int, j int);
CREATE INDEX idx1 ON t1 (i);
CREATE  INDEX idx2 on t1(j) with online;
ALTER  INDEX idx1 on t1(j) REBUILD;
show indexes from t1;
drop  table t1 ;

create table t1 (FirstName varchar(20),LastName varchar(20),Age int,gender char (1));
insert into t1 value('yin', 'jian ye',31,'M');
CREATE INDEX first_name_lower ON t1 (LOWER(FirstName)) with online;
create  INDEX first_name_lower1 on t1(firstname) WHERE LOWER(FirstName)='yin' with online;
ALTER  INDEX first_name_lower on t1(firstname) WHERE LOWER(FirstName)='yin' REBUILD;
update statistics on t1;
show indexes from t1;
alter  INDEX first_name_lower1 on t1(firstname) REBUILD;
ALTER  INDEX first_name_lower on t1(FirstName) REBUILD;
ALTER  INDEX first_name_lower on t1(FirstName desc) REBUILD;
drop  table t1 ;

create table t1 (FirstName varchar(20),LastName varchar(20),Age int,gender char (1));
insert into t1 value('yin', 'jian ye',31,'M');
CREATE INDEX first_name_lower ON t1 (LOWER(FirstName)) with online;
create  INDEX first_name_lower1 on t1(firstname) WHERE LOWER(FirstName)='yin' with online;
ALTER  INDEX first_name_lower on t1(firstname) WHERE LOWER(FirstName)='yin' REBUILD;
update statistics on t1;
show indexes from t1;
alter  INDEX first_name_lower1 on t1(firstname) REBUILD;
ALTER  INDEX first_name_lower on t1(FirstName) REBUILD;
ALTER  INDEX first_name_lower on t1(FirstName desc) REBUILD;
drop  table t1 ;
--set optimization level :c ;
