-- http://stackoverflow.com/questions/30710990/creating-an-oracle-user-if-it-doesnt-already-exist
-- http://blog.lakmali.com/2011/10/oracle-plsql-script-to-drop-user-if-not.html

-- Try to lose the ";" from inside the string that you Execute Immediate
-- http://stackoverflow.com/questions/885304/why-does-running-this-query-with-execute-immediate-cause-it-to-fail

declare
users integer;
begin
  select count(*) into users from dba_users where username='PA';
  if (users != 0) then
    execute immediate 'DROP USER PA CASCADE';
  end if;
end;
/

declare
users integer;
begin
  select count(*) into users from dba_users where username='PAWORK';
  if (users != 0) then
    execute immediate 'DROP USER PAWORK CASCADE';
  end if;
end;
/

-- USER SQL
CREATE USER pawork IDENTIFIED BY pawork
DEFAULT TABLESPACE "BAP_DATA"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER pawork QUOTA UNLIMITED ON BAP_INDX;
ALTER USER pawork QUOTA UNLIMITED ON BAP_DATA;

-- ROLES
GRANT "DATAPUMP_EXP_FULL_DATABASE" TO pawork ;
GRANT "DBA" TO pawork ;
GRANT "HS_ADMIN_EXECUTE_ROLE" TO pawork ;
GRANT "ADM_PARALLEL_EXECUTE_TASK" TO pawork ;
GRANT "CTXAPP" TO pawork ;
GRANT "SELECT_CATALOG_ROLE" TO pawork ;
GRANT "CONNECT" TO pawork ;
GRANT "DATAPUMP_IMP_FULL_DATABASE" TO pawork ;
GRANT "OEM_MONITOR" TO pawork ;
GRANT "APEX_ADMINISTRATOR_ROLE" TO pawork ;
GRANT "AQ_USER_ROLE" TO pawork ;
GRANT "SCHEDULER_ADMIN" TO pawork ;
GRANT "XDB_SET_INVOKER" TO pawork ;
GRANT "RECOVERY_CATALOG_OWNER" TO pawork ;
GRANT "DBFS_ROLE" TO pawork ;
GRANT "XDB_WEBSERVICES_OVER_HTTP" TO pawork ;
GRANT "HS_ADMIN_SELECT_ROLE" TO pawork ;
GRANT "PLUSTRACE" TO pawork ;
GRANT "RESOURCE" TO pawork ;
GRANT "AQ_ADMINISTRATOR_ROLE" TO pawork ;
GRANT "DELETE_CATALOG_ROLE" TO pawork ;
GRANT "XDB_WEBSERVICES_WITH_PUBLIC" TO pawork ;
GRANT "XDB_WEBSERVICES" TO pawork ;
GRANT "EXECUTE_CATALOG_ROLE" TO pawork ;
GRANT "EXP_FULL_DATABASE" TO pawork ;
GRANT "GATHER_SYSTEM_STATISTICS" TO pawork ;
GRANT "LOGSTDBY_ADMINISTRATOR" TO pawork ;
GRANT "AUTHENTICATEDUSER" TO pawork ;
GRANT "OEM_ADVISOR" TO pawork ;
GRANT "HS_ADMIN_ROLE" TO pawork ;
GRANT "XDBADMIN" TO pawork ;
GRANT "IMP_FULL_DATABASE" TO pawork ;

-- SYSTEM PRIVILEGES
GRANT CREATE JOB TO pawork ;
GRANT DROP ANY CONTEXT TO pawork ;
GRANT UPDATE ANY CUBE TO pawork ;
GRANT DROP ANY TRIGGER TO pawork ;
GRANT MANAGE ANY FILE GROUP TO pawork ;
GRANT ALTER PUBLIC DATABASE LINK TO pawork ;
GRANT MANAGE FILE GROUP TO pawork ;
GRANT ALTER ANY INDEX TO pawork ;
GRANT DROP ANY SEQUENCE TO pawork ;
GRANT ALTER PROFILE TO pawork ;
GRANT UNDER ANY TABLE TO pawork ;
GRANT CREATE ASSEMBLY TO pawork ;
GRANT DROP ANY LIBRARY TO pawork ;
GRANT ALTER ANY EDITION TO pawork ;
GRANT CREATE ROLE TO pawork ;
GRANT CREATE LIBRARY TO pawork ;
GRANT DROP ROLLBACK SEGMENT TO pawork ;
GRANT CREATE TRIGGER TO pawork ;
GRANT ALTER ANY PROCEDURE TO pawork ;
GRANT ADMINISTER DATABASE TRIGGER TO pawork ;
GRANT DROP ANY MEASURE FOLDER TO pawork ;
GRANT CREATE ANY PROCEDURE TO pawork ;
GRANT ALTER ANY OUTLINE TO pawork ;
GRANT EXECUTE ANY INDEXTYPE TO pawork ;
GRANT CREATE ANY DIRECTORY TO pawork ;
GRANT ALTER ANY RULE SET TO pawork ;
GRANT ALTER ANY MINING MODEL TO pawork ;
GRANT DEBUG CONNECT SESSION TO pawork ;
GRANT CREATE ANY MINING MODEL TO pawork ;
GRANT ALTER SESSION TO pawork ;
GRANT CREATE MATERIALIZED VIEW TO pawork ;
GRANT MERGE ANY VIEW TO pawork ;
GRANT CREATE ANY INDEX TO pawork ;
GRANT CREATE DIMENSION TO pawork ;
GRANT EXECUTE ANY RULE SET TO pawork ;
GRANT ALTER ANY MATERIALIZED VIEW TO pawork ;
GRANT AUDIT SYSTEM TO pawork ;
GRANT CREATE OPERATOR TO pawork ;
GRANT MANAGE ANY QUEUE TO pawork ;
GRANT ALTER ANY SQL PROFILE TO pawork ;
GRANT GRANT ANY OBJECT PRIVILEGE TO pawork ;
GRANT CREATE INDEXTYPE TO pawork ;
GRANT AUDIT ANY TO pawork ;
GRANT DEBUG ANY PROCEDURE TO pawork ;
GRANT CREATE ANY MEASURE FOLDER TO pawork ;
GRANT CREATE ANY SEQUENCE TO pawork ;
GRANT CREATE MEASURE FOLDER TO pawork ;
GRANT UPDATE ANY CUBE BUILD PROCESS TO pawork ;
GRANT CREATE VIEW TO pawork ;
GRANT ALTER DATABASE LINK TO pawork ;
GRANT ALTER ANY ASSEMBLY TO pawork ;
GRANT CREATE ANY EVALUATION CONTEXT TO pawork ;
GRANT SELECT ANY MINING MODEL TO pawork ;
GRANT DELETE ANY CUBE DIMENSION TO pawork ;
GRANT ALTER ANY TABLE TO pawork ;
GRANT CREATE SESSION TO pawork ;
GRANT CREATE RULE TO pawork ;
GRANT BECOME USER TO pawork ;
GRANT SELECT ANY TABLE TO pawork ;
GRANT INSERT ANY MEASURE FOLDER TO pawork ;
GRANT CREATE ANY SQL PROFILE TO pawork ;
GRANT FORCE ANY TRANSACTION TO pawork ;
GRANT DELETE ANY TABLE TO pawork ;
GRANT ALTER ANY SEQUENCE TO pawork ;
GRANT SELECT ANY CUBE DIMENSION TO pawork ;
GRANT CREATE ANY EDITION TO pawork ;
GRANT CREATE EXTERNAL JOB TO pawork ;
GRANT DROP ANY MATERIALIZED VIEW TO pawork ;
GRANT CREATE ANY CUBE BUILD PROCESS TO pawork ;
GRANT FLASHBACK ANY TABLE TO pawork ;
GRANT DROP ANY RULE SET TO pawork ;
GRANT BACKUP ANY TABLE TO pawork ;
GRANT ALTER ANY CUBE TO pawork ;
GRANT CREATE TABLE TO pawork ;
GRANT EXECUTE ANY LIBRARY TO pawork ;
GRANT DROP ANY OUTLINE TO pawork ;
GRANT EXECUTE ASSEMBLY TO pawork ;
GRANT CREATE ANY DIMENSION TO pawork ;
GRANT DROP ANY TABLE TO pawork ;
GRANT ALTER ANY CLUSTER TO pawork ;
GRANT EXECUTE ANY CLASS TO pawork ;
GRANT DROP ANY DIMENSION TO pawork ;
GRANT CREATE ANY RULE SET TO pawork ;
GRANT SELECT ANY SEQUENCE TO pawork ;
GRANT UNDER ANY TYPE TO pawork ;
GRANT MANAGE TABLESPACE TO pawork ;
GRANT DROP ANY OPERATOR TO pawork ;
GRANT CREATE ANY OPERATOR TO pawork ;
GRANT EXEMPT IDENTITY POLICY TO pawork ;
GRANT CREATE TYPE TO pawork ;
GRANT CREATE TABLESPACE TO pawork ;
GRANT SELECT ANY TRANSACTION TO pawork ;
GRANT DELETE ANY MEASURE FOLDER TO pawork ;
GRANT CREATE ANY CUBE TO pawork ;
GRANT LOCK ANY TABLE TO pawork ;
GRANT CREATE EVALUATION CONTEXT TO pawork ;
GRANT DROP ANY TYPE TO pawork ;
GRANT ADVISOR TO pawork ;
GRANT CREATE PUBLIC DATABASE LINK TO pawork ;
GRANT ANALYZE ANY TO pawork ;
GRANT DROP ANY RULE TO pawork ;
GRANT INSERT ANY CUBE DIMENSION TO pawork ;
GRANT CREATE ROLLBACK SEGMENT TO pawork ;
GRANT CREATE ANY JOB TO pawork ;
GRANT ALTER USER TO pawork ;
GRANT QUERY REWRITE TO pawork ;
GRANT SELECT ANY DICTIONARY TO pawork ;
GRANT CREATE PUBLIC SYNONYM TO pawork ;
GRANT GLOBAL QUERY REWRITE TO pawork ;
GRANT ALTER ANY CUBE DIMENSION TO pawork ;
GRANT CREATE ANY CUBE DIMENSION TO pawork ;
GRANT DROP ANY CLUSTER TO pawork ;
GRANT CREATE ANY RULE TO pawork ;
GRANT UPDATE ANY CUBE DIMENSION TO pawork ;
GRANT SYSDBA TO pawork ;
GRANT ADMINISTER RESOURCE MANAGER TO pawork ;
GRANT CREATE ANY SYNONYM TO pawork ;
GRANT DROP ANY SYNONYM TO pawork ;
GRANT DROP ANY MINING MODEL TO pawork ;
GRANT EXECUTE ANY PROCEDURE TO pawork ;
GRANT CREATE SYNONYM TO pawork ;
GRANT EXECUTE ANY PROGRAM TO pawork ;
GRANT EXECUTE ANY TYPE TO pawork ;
GRANT ON COMMIT REFRESH TO pawork ;
GRANT CREATE SEQUENCE TO pawork ;
GRANT COMMENT ANY MINING MODEL TO pawork ;
GRANT ADMINISTER SQL TUNING SET TO pawork ;
GRANT SYSOPER TO pawork ;
GRANT CREATE ANY INDEXTYPE TO pawork ;
GRANT DROP ANY INDEX TO pawork ;
GRANT RESTRICTED SESSION TO pawork ;
GRANT DEQUEUE ANY QUEUE TO pawork ;
GRANT ANALYZE ANY DICTIONARY TO pawork ;
GRANT ALTER ANY INDEXTYPE TO pawork ;
GRANT ADMINISTER ANY SQL TUNING SET TO pawork ;
GRANT CREATE USER TO pawork ;
GRANT EXECUTE ANY OPERATOR TO pawork ;
GRANT CREATE CUBE BUILD PROCESS TO pawork ;
GRANT CREATE PROFILE TO pawork ;
GRANT ALTER ANY ROLE TO pawork ;
GRANT UPDATE ANY TABLE TO pawork ;
GRANT ALTER ANY LIBRARY TO pawork ;
GRANT DROP ANY VIEW TO pawork ;
GRANT CREATE ANY CLUSTER TO pawork ;
GRANT EXECUTE ANY RULE TO pawork ;
GRANT ALTER TABLESPACE TO pawork ;
GRANT UNDER ANY VIEW TO pawork ;
GRANT EXECUTE ANY ASSEMBLY TO pawork ;
GRANT GRANT ANY PRIVILEGE TO pawork ;
GRANT ALTER ANY TRIGGER TO pawork ;
GRANT CREATE ANY VIEW TO pawork ;
GRANT EXPORT FULL DATABASE TO pawork ;
GRANT ALTER ANY EVALUATION CONTEXT TO pawork ;
GRANT FLASHBACK ARCHIVE ADMINISTER TO pawork ;
GRANT IMPORT FULL DATABASE TO pawork ;
GRANT CREATE ANY OUTLINE TO pawork ;
GRANT COMMENT ANY TABLE TO pawork ;
GRANT CREATE DATABASE LINK TO pawork ;
GRANT DROP PUBLIC SYNONYM TO pawork ;
GRANT DROP USER TO pawork ;
GRANT CHANGE NOTIFICATION TO pawork ;
GRANT CREATE MINING MODEL TO pawork ;
GRANT INSERT ANY TABLE TO pawork ;
GRANT DROP PROFILE TO pawork ;
GRANT CREATE ANY MATERIALIZED VIEW TO pawork ;
GRANT CREATE RULE SET TO pawork ;
GRANT EXEMPT ACCESS POLICY TO pawork ;
GRANT MANAGE SCHEDULER TO pawork ;
GRANT READ ANY FILE GROUP TO pawork ;
GRANT FORCE TRANSACTION TO pawork ;
GRANT DROP ANY CUBE BUILD PROCESS TO pawork ;
GRANT ALTER ANY TYPE TO pawork ;
GRANT DROP ANY PROCEDURE TO pawork ;
GRANT DROP PUBLIC DATABASE LINK TO pawork ;
GRANT DROP ANY INDEXTYPE TO pawork ;
GRANT DROP ANY SQL PROFILE TO pawork ;
GRANT ALTER SYSTEM TO pawork ;
GRANT UNLIMITED TABLESPACE TO pawork ;
GRANT DROP ANY ROLE TO pawork ;
GRANT ALTER ANY DIMENSION TO pawork ;
GRANT DROP ANY CUBE DIMENSION TO pawork ;
GRANT DROP ANY CUBE TO pawork ;
GRANT CREATE ANY TRIGGER TO pawork ;
GRANT DROP ANY ASSEMBLY TO pawork ;
GRANT CREATE ANY TABLE TO pawork ;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO pawork ;
GRANT DROP ANY DIRECTORY TO pawork ;
GRANT ENQUEUE ANY QUEUE TO pawork ;
GRANT DROP ANY EVALUATION CONTEXT TO pawork ;
GRANT CREATE ANY ASSEMBLY TO pawork ;
GRANT CREATE ANY TYPE TO pawork ;
GRANT CREATE CLUSTER TO pawork ;
GRANT CREATE ANY CONTEXT TO pawork ;
GRANT EXECUTE ANY EVALUATION CONTEXT TO pawork ;
GRANT RESUMABLE TO pawork ;
GRANT CREATE ANY LIBRARY TO pawork ;
GRANT DROP ANY EDITION TO pawork ;
GRANT CREATE PROCEDURE TO pawork ;
GRANT ALTER DATABASE TO pawork ;
GRANT SELECT ANY CUBE TO pawork ;
GRANT GRANT ANY ROLE TO pawork ;
GRANT ALTER ANY RULE TO pawork ;
GRANT CREATE CUBE DIMENSION TO pawork ;
GRANT ALTER ANY OPERATOR TO pawork ;
GRANT CREATE CUBE TO pawork ;
GRANT ALTER RESOURCE COST TO pawork ;
GRANT DROP TABLESPACE TO pawork ;
GRANT ALTER ROLLBACK SEGMENT TO pawork ;

-- USER SQL
CREATE USER pa IDENTIFIED BY pa
DEFAULT TABLESPACE "BAP_DATA"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER pa QUOTA UNLIMITED ON BAP_INDX;
ALTER USER pa QUOTA UNLIMITED ON BAP_DATA;

-- ROLES
GRANT "DATAPUMP_EXP_FULL_DATABASE" TO pa ;
GRANT "DBA" TO pa ;
GRANT "HS_ADMIN_EXECUTE_ROLE" TO pa ;
GRANT "ADM_PARALLEL_EXECUTE_TASK" TO pa ;
GRANT "CTXAPP" TO pa ;
GRANT "SELECT_CATALOG_ROLE" TO pa ;
GRANT "CONNECT" TO pa ;
GRANT "DATAPUMP_IMP_FULL_DATABASE" TO pa ;
GRANT "OEM_MONITOR" TO pa ;
GRANT "APEX_ADMINISTRATOR_ROLE" TO pa ;
GRANT "AQ_USER_ROLE" TO pa ;
GRANT "SCHEDULER_ADMIN" TO pa ;
GRANT "XDB_SET_INVOKER" TO pa ;
GRANT "RECOVERY_CATALOG_OWNER" TO pa ;
GRANT "DBFS_ROLE" TO pa ;
GRANT "XDB_WEBSERVICES_OVER_HTTP" TO pa ;
GRANT "HS_ADMIN_SELECT_ROLE" TO pa ;
GRANT "PLUSTRACE" TO pa ;
GRANT "RESOURCE" TO pa ;
GRANT "AQ_ADMINISTRATOR_ROLE" TO pa ;
GRANT "DELETE_CATALOG_ROLE" TO pa ;
GRANT "XDB_WEBSERVICES_WITH_PUBLIC" TO pa ;
GRANT "XDB_WEBSERVICES" TO pa ;
GRANT "EXECUTE_CATALOG_ROLE" TO pa ;
GRANT "EXP_FULL_DATABASE" TO pa ;
GRANT "GATHER_SYSTEM_STATISTICS" TO pa ;
GRANT "LOGSTDBY_ADMINISTRATOR" TO pa ;
GRANT "AUTHENTICATEDUSER" TO pa ;
GRANT "OEM_ADVISOR" TO pa ;
GRANT "HS_ADMIN_ROLE" TO pa ;
GRANT "XDBADMIN" TO pa ;
GRANT "IMP_FULL_DATABASE" TO pa ;

-- SYSTEM PRIVILEGES
GRANT CREATE JOB TO pa ;
GRANT DROP ANY CONTEXT TO pa ;
GRANT UPDATE ANY CUBE TO pa ;
GRANT DROP ANY TRIGGER TO pa ;
GRANT MANAGE ANY FILE GROUP TO pa ;
GRANT ALTER PUBLIC DATABASE LINK TO pa ;
GRANT MANAGE FILE GROUP TO pa ;
GRANT ALTER ANY INDEX TO pa ;
GRANT DROP ANY SEQUENCE TO pa ;
GRANT ALTER PROFILE TO pa ;
GRANT UNDER ANY TABLE TO pa ;
GRANT CREATE ASSEMBLY TO pa ;
GRANT DROP ANY LIBRARY TO pa ;
GRANT ALTER ANY EDITION TO pa ;
GRANT CREATE ROLE TO pa ;
GRANT CREATE LIBRARY TO pa ;
GRANT DROP ROLLBACK SEGMENT TO pa ;
GRANT CREATE TRIGGER TO pa ;
GRANT ALTER ANY PROCEDURE TO pa ;
GRANT ADMINISTER DATABASE TRIGGER TO pa ;
GRANT DROP ANY MEASURE FOLDER TO pa ;
GRANT CREATE ANY PROCEDURE TO pa ;
GRANT ALTER ANY OUTLINE TO pa ;
GRANT EXECUTE ANY INDEXTYPE TO pa ;
GRANT CREATE ANY DIRECTORY TO pa ;
GRANT ALTER ANY RULE SET TO pa ;
GRANT ALTER ANY MINING MODEL TO pa ;
GRANT DEBUG CONNECT SESSION TO pa ;
GRANT CREATE ANY MINING MODEL TO pa ;
GRANT ALTER SESSION TO pa ;
GRANT CREATE MATERIALIZED VIEW TO pa ;
GRANT MERGE ANY VIEW TO pa ;
GRANT CREATE ANY INDEX TO pa ;
GRANT CREATE DIMENSION TO pa ;
GRANT EXECUTE ANY RULE SET TO pa ;
GRANT ALTER ANY MATERIALIZED VIEW TO pa ;
GRANT AUDIT SYSTEM TO pa ;
GRANT CREATE OPERATOR TO pa ;
GRANT MANAGE ANY QUEUE TO pa ;
GRANT ALTER ANY SQL PROFILE TO pa ;
GRANT GRANT ANY OBJECT PRIVILEGE TO pa ;
GRANT CREATE INDEXTYPE TO pa ;
GRANT AUDIT ANY TO pa ;
GRANT DEBUG ANY PROCEDURE TO pa ;
GRANT CREATE ANY MEASURE FOLDER TO pa ;
GRANT CREATE ANY SEQUENCE TO pa ;
GRANT CREATE MEASURE FOLDER TO pa ;
GRANT UPDATE ANY CUBE BUILD PROCESS TO pa ;
GRANT CREATE VIEW TO pa ;
GRANT ALTER DATABASE LINK TO pa ;
GRANT ALTER ANY ASSEMBLY TO pa ;
GRANT CREATE ANY EVALUATION CONTEXT TO pa ;
GRANT SELECT ANY MINING MODEL TO pa ;
GRANT DELETE ANY CUBE DIMENSION TO pa ;
GRANT ALTER ANY TABLE TO pa ;
GRANT CREATE SESSION TO pa ;
GRANT CREATE RULE TO pa ;
GRANT BECOME USER TO pa ;
GRANT SELECT ANY TABLE TO pa ;
GRANT INSERT ANY MEASURE FOLDER TO pa ;
GRANT CREATE ANY SQL PROFILE TO pa ;
GRANT FORCE ANY TRANSACTION TO pa ;
GRANT DELETE ANY TABLE TO pa ;
GRANT ALTER ANY SEQUENCE TO pa ;
GRANT SELECT ANY CUBE DIMENSION TO pa ;
GRANT CREATE ANY EDITION TO pa ;
GRANT CREATE EXTERNAL JOB TO pa ;
GRANT DROP ANY MATERIALIZED VIEW TO pa ;
GRANT CREATE ANY CUBE BUILD PROCESS TO pa ;
GRANT FLASHBACK ANY TABLE TO pa ;
GRANT DROP ANY RULE SET TO pa ;
GRANT BACKUP ANY TABLE TO pa ;
GRANT ALTER ANY CUBE TO pa ;
GRANT CREATE TABLE TO pa ;
GRANT EXECUTE ANY LIBRARY TO pa ;
GRANT DROP ANY OUTLINE TO pa ;
GRANT EXECUTE ASSEMBLY TO pa ;
GRANT CREATE ANY DIMENSION TO pa ;
GRANT DROP ANY TABLE TO pa ;
GRANT ALTER ANY CLUSTER TO pa ;
GRANT EXECUTE ANY CLASS TO pa ;
GRANT DROP ANY DIMENSION TO pa ;
GRANT CREATE ANY RULE SET TO pa ;
GRANT SELECT ANY SEQUENCE TO pa ;
GRANT UNDER ANY TYPE TO pa ;
GRANT MANAGE TABLESPACE TO pa ;
GRANT DROP ANY OPERATOR TO pa ;
GRANT CREATE ANY OPERATOR TO pa ;
GRANT EXEMPT IDENTITY POLICY TO pa ;
GRANT CREATE TYPE TO pa ;
GRANT CREATE TABLESPACE TO pa ;
GRANT SELECT ANY TRANSACTION TO pa ;
GRANT DELETE ANY MEASURE FOLDER TO pa ;
GRANT CREATE ANY CUBE TO pa ;
GRANT LOCK ANY TABLE TO pa ;
GRANT CREATE EVALUATION CONTEXT TO pa ;
GRANT DROP ANY TYPE TO pa ;
GRANT ADVISOR TO pa ;
GRANT CREATE PUBLIC DATABASE LINK TO pa ;
GRANT ANALYZE ANY TO pa ;
GRANT DROP ANY RULE TO pa ;
GRANT INSERT ANY CUBE DIMENSION TO pa ;
GRANT CREATE ROLLBACK SEGMENT TO pa ;
GRANT CREATE ANY JOB TO pa ;
GRANT ALTER USER TO pa ;
GRANT QUERY REWRITE TO pa ;
GRANT SELECT ANY DICTIONARY TO pa ;
GRANT CREATE PUBLIC SYNONYM TO pa ;
GRANT GLOBAL QUERY REWRITE TO pa ;
GRANT ALTER ANY CUBE DIMENSION TO pa ;
GRANT CREATE ANY CUBE DIMENSION TO pa ;
GRANT DROP ANY CLUSTER TO pa ;
GRANT CREATE ANY RULE TO pa ;
GRANT UPDATE ANY CUBE DIMENSION TO pa ;
GRANT SYSDBA TO pa ;
GRANT ADMINISTER RESOURCE MANAGER TO pa ;
GRANT CREATE ANY SYNONYM TO pa ;
GRANT DROP ANY SYNONYM TO pa ;
GRANT DROP ANY MINING MODEL TO pa ;
GRANT EXECUTE ANY PROCEDURE TO pa ;
GRANT CREATE SYNONYM TO pa ;
GRANT EXECUTE ANY PROGRAM TO pa ;
GRANT EXECUTE ANY TYPE TO pa ;
GRANT ON COMMIT REFRESH TO pa ;
GRANT CREATE SEQUENCE TO pa ;
GRANT COMMENT ANY MINING MODEL TO pa ;
GRANT ADMINISTER SQL TUNING SET TO pa ;
GRANT SYSOPER TO pa ;
GRANT CREATE ANY INDEXTYPE TO pa ;
GRANT DROP ANY INDEX TO pa ;
GRANT RESTRICTED SESSION TO pa ;
GRANT DEQUEUE ANY QUEUE TO pa ;
GRANT ANALYZE ANY DICTIONARY TO pa ;
GRANT ALTER ANY INDEXTYPE TO pa ;
GRANT ADMINISTER ANY SQL TUNING SET TO pa ;
GRANT CREATE USER TO pa ;
GRANT EXECUTE ANY OPERATOR TO pa ;
GRANT CREATE CUBE BUILD PROCESS TO pa ;
GRANT CREATE PROFILE TO pa ;
GRANT ALTER ANY ROLE TO pa ;
GRANT UPDATE ANY TABLE TO pa ;
GRANT ALTER ANY LIBRARY TO pa ;
GRANT DROP ANY VIEW TO pa ;
GRANT CREATE ANY CLUSTER TO pa ;
GRANT EXECUTE ANY RULE TO pa ;
GRANT ALTER TABLESPACE TO pa ;
GRANT UNDER ANY VIEW TO pa ;
GRANT EXECUTE ANY ASSEMBLY TO pa ;
GRANT GRANT ANY PRIVILEGE TO pa ;
GRANT ALTER ANY TRIGGER TO pa ;
GRANT CREATE ANY VIEW TO pa ;
GRANT EXPORT FULL DATABASE TO pa ;
GRANT ALTER ANY EVALUATION CONTEXT TO pa ;
GRANT FLASHBACK ARCHIVE ADMINISTER TO pa ;
GRANT IMPORT FULL DATABASE TO pa ;
GRANT CREATE ANY OUTLINE TO pa ;
GRANT COMMENT ANY TABLE TO pa ;
GRANT CREATE DATABASE LINK TO pa ;
GRANT DROP PUBLIC SYNONYM TO pa ;
GRANT DROP USER TO pa ;
GRANT CHANGE NOTIFICATION TO pa ;
GRANT CREATE MINING MODEL TO pa ;
GRANT INSERT ANY TABLE TO pa ;
GRANT DROP PROFILE TO pa ;
GRANT CREATE ANY MATERIALIZED VIEW TO pa ;
GRANT CREATE RULE SET TO pa ;
GRANT EXEMPT ACCESS POLICY TO pa ;
GRANT MANAGE SCHEDULER TO pa ;
GRANT READ ANY FILE GROUP TO pa ;
GRANT FORCE TRANSACTION TO pa ;
GRANT DROP ANY CUBE BUILD PROCESS TO pa ;
GRANT ALTER ANY TYPE TO pa ;
GRANT DROP ANY PROCEDURE TO pa ;
GRANT DROP PUBLIC DATABASE LINK TO pa ;
GRANT DROP ANY INDEXTYPE TO pa ;
GRANT DROP ANY SQL PROFILE TO pa ;
GRANT ALTER SYSTEM TO pa ;
GRANT UNLIMITED TABLESPACE TO pa ;
GRANT DROP ANY ROLE TO pa ;
GRANT ALTER ANY DIMENSION TO pa ;
GRANT DROP ANY CUBE DIMENSION TO pa ;
GRANT DROP ANY CUBE TO pa ;
GRANT CREATE ANY TRIGGER TO pa ;
GRANT DROP ANY ASSEMBLY TO pa ;
GRANT CREATE ANY TABLE TO pa ;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO pa ;
GRANT DROP ANY DIRECTORY TO pa ;
GRANT ENQUEUE ANY QUEUE TO pa ;
GRANT DROP ANY EVALUATION CONTEXT TO pa ;
GRANT CREATE ANY ASSEMBLY TO pa ;
GRANT CREATE ANY TYPE TO pa ;
GRANT CREATE CLUSTER TO pa ;
GRANT CREATE ANY CONTEXT TO pa ;
GRANT EXECUTE ANY EVALUATION CONTEXT TO pa ;
GRANT RESUMABLE TO pa ;
GRANT CREATE ANY LIBRARY TO pa ;
GRANT DROP ANY EDITION TO pa ;
GRANT CREATE PROCEDURE TO pa ;
GRANT ALTER DATABASE TO pa ;
GRANT SELECT ANY CUBE TO pa ;
GRANT GRANT ANY ROLE TO pa ;
GRANT ALTER ANY RULE TO pa ;
GRANT CREATE CUBE DIMENSION TO pa ;
GRANT ALTER ANY OPERATOR TO pa ;
GRANT CREATE CUBE TO pa ;
GRANT ALTER RESOURCE COST TO pa ;
GRANT DROP TABLESPACE TO pa ;
GRANT ALTER ROLLBACK SEGMENT TO pa ;
