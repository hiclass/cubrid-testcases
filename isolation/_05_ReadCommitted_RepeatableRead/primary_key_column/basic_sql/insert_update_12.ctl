/*
Test Case: insert & update
Priority: 1
Reference case:
Author: Rong Xu

Test Point:
-    Insert: X_LOCK on first key OID for unique indexes.
-    Update: X_LOCK acquired on current instance
use index in where clause
C1: update 1 ... 10
C2: insert 5, confict with old update value
comparing to MySQL, expect no range lock

NUM_CLIENTS = 2
C1: update(1,2,7) to (2,3,8)
C2: insert 7, conflict with C1 on value 7, wait C1 to commit or rollback
C1: commit
C2: insert 7 successfully, select value should be 2,3,8,7  --maybe violate repeatable read snapshot which is 1,2,7
*/

MC: setup NUM_CLIENTS = 2;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level read committed;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level repeatable read;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int primary key,col varchar(10));
C1: insert into t values(1,'a');
C1: insert into t values(2,'b');
C1: insert into t values(7,'c');
C1: commit work;
MC: wait until C1 ready;

/* test case */
C1: update t set id=id+1 where id between 1 and 10;
/* expect 1,2,7 */
C2: select * from t where id>0 order by id;
C2: insert into t values(7,'abc');
MC: wait until C2 blocked;

/* expect 1->2,2->3,7->8 */
C1: select * from t order by 1; 
C1: commit;
MC: wait until C2 ready;
/* expect 2,3,8,7 */
C2: select * from t order by 1;
C2: commit;          

/* expect 2,3,8,7 */
C2: select * from t order by 1; 
C2: commit;

C2: quit;
C1: quit;

