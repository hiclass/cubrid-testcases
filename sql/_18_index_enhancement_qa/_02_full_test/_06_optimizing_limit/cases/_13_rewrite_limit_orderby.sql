--+ holdcas on;
set system parameters 'dont_reuse_heap_file=yes';
create table t (id int primary key, a varchar(10));
insert into t values (1,'11');
insert into t values (2,'22');
insert into t values (3,'33');
insert into t values (4,null);
insert into t values (5,'2');
insert into t values (6,'23');

create index i_t_a on t(a);

set system parameters 'xasl_debug_dump=yes';

select /*+ recompile */ a from t where a>'2' order by a asc;

select /*+ recompile */ a from t where a>'2' order by a asc for orderby_num() between 2 and 3;

select /*+ recompile */ a from t where a>'2' order by a asc for orderby_num() <=2;


select /*+ recompile */ a from t where a>'2' order by a desc;

select /*+ recompile */ a from t where a>'2' order by a desc for orderby_num() between 2 and 3;

select /*+ recompile */ a from t where a>'2' order by a desc for orderby_num() <=2;


set system parameters 'xasl_debug_dump=no';

drop table t;




set system parameters 'dont_reuse_heap_file=no';
commit;
--+ holdcas off;
