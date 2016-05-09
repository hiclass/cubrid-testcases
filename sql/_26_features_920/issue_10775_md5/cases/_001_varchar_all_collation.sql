create table t1 (
a1 varchar(10) collate euckr_bin,
a2 varchar(10) collate iso88591_bin      ,
a3 varchar(10) collate iso88591_en_ci    ,
a4 varchar(10) collate iso88591_en_cs    ,
a5 varchar(10) collate utf8_bin          ,
a6 varchar(10) collate utf8_de_exp       ,
a7 varchar(10) collate utf8_de_exp_ai_ci ,
a8 varchar(10) collate utf8_en_ci        ,
a9 varchar(10) collate utf8_en_cs        ,
a10 varchar(10) collate utf8_es_cs        ,
a11 varchar(10) collate utf8_fr_exp_ab    ,
a12 varchar(10) collate utf8_gen          ,
a13 varchar(10) collate utf8_gen_ai_ci    ,
a14 varchar(10) collate utf8_gen_ci       ,
a15 varchar(10) collate utf8_ja_exp       ,
a16 varchar(10) collate utf8_ja_exp_cbm   ,
a17 varchar(10) collate utf8_km_exp       ,
a18 varchar(10) collate utf8_ko_cs        ,
a19 varchar(10) collate utf8_ko_cs_uca    ,
a20 varchar(10) collate utf8_ro_cs        ,
a21 varchar(10) collate utf8_tr_cs        ,
a22 varchar(10) collate utf8_tr_cs_uca    ,
a23 varchar(10) collate utf8_vi_cs        );

insert into t1 values ('a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a');
select md5(a1), 
md5(a2),
md5(a3),
md5(a4),
md5(a5),
md5(a6),
md5(a7),
md5(a8),
md5(a9),
md5(a10),
md5(a11),
md5(a12),
md5(a13),
md5(a14),
md5(a15),
md5(a16),
md5(a17),
md5(a18),
md5(a19),
md5(a20),
md5(a21),
md5(a22),
md5(a23)
from t1;
drop table t1;