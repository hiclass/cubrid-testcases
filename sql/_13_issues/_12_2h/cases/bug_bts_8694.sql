create table t(a int);create table t2(a string);
insert into t2(a) values('1');
create index t2_a on t2(trim(a));
select /*+ RECOMPILE */ * from t2 where trim(a)=1;
select /*+ RECOMPILE */ * from t2 where trim(a)='1';
drop table t;
create table t1(a string);
insert into t1(a) values('1');
create index t1_a on t1(a);
select /*+ RECOMPILE */ * from t1 where a=1;
drop table t1;
drop table t2;