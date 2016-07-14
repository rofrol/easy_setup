-- drop user paab cascade;
-- drop user paabwork cascade;

-- USER SQL
CREATE USER paabwork IDENTIFIED BY paabwork 
DEFAULT TABLESPACE "BAP_DATA"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER paabwork QUOTA UNLIMITED ON BAP_INDX;
ALTER USER paabwork QUOTA UNLIMITED ON BAP_DATA;

-- ROLES
GRANT "DATAPUMP_EXP_FULL_DATABASE" TO paabwork ;
GRANT "DBA" TO paabwork ;
GRANT "HS_ADMIN_EXECUTE_ROLE" TO paabwork ;
GRANT "ADM_PARALLEL_EXECUTE_TASK" TO paabwork ;
GRANT "CTXAPP" TO paabwork ;
GRANT "SELECT_CATALOG_ROLE" TO paabwork ;
GRANT "CONNECT" TO paabwork ;
GRANT "DATAPUMP_IMP_FULL_DATABASE" TO paabwork ;
GRANT "OEM_MONITOR" TO paabwork ;
GRANT "APEX_ADMINISTRATOR_ROLE" TO paabwork ;
GRANT "AQ_USER_ROLE" TO paabwork ;
GRANT "SCHEDULER_ADMIN" TO paabwork ;
GRANT "XDB_SET_INVOKER" TO paabwork ;
GRANT "RECOVERY_CATALOG_OWNER" TO paabwork ;
GRANT "DBFS_ROLE" TO paabwork ;
GRANT "XDB_WEBSERVICES_OVER_HTTP" TO paabwork ;
GRANT "HS_ADMIN_SELECT_ROLE" TO paabwork ;
GRANT "PLUSTRACE" TO paabwork ;
GRANT "RESOURCE" TO paabwork ;
GRANT "AQ_ADMINISTRATOR_ROLE" TO paabwork ;
GRANT "DELETE_CATALOG_ROLE" TO paabwork ;
GRANT "XDB_WEBSERVICES_WITH_PUBLIC" TO paabwork ;
GRANT "XDB_WEBSERVICES" TO paabwork ;
GRANT "EXECUTE_CATALOG_ROLE" TO paabwork ;
GRANT "EXP_FULL_DATABASE" TO paabwork ;
GRANT "GATHER_SYSTEM_STATISTICS" TO paabwork ;
GRANT "LOGSTDBY_ADMINISTRATOR" TO paabwork ;
GRANT "AUTHENTICATEDUSER" TO paabwork ;
GRANT "OEM_ADVISOR" TO paabwork ;
GRANT "HS_ADMIN_ROLE" TO paabwork ;
GRANT "XDBADMIN" TO paabwork ;
GRANT "IMP_FULL_DATABASE" TO paabwork ;

-- SYSTEM PRIVILEGES
GRANT CREATE JOB TO paabwork ;
GRANT DROP ANY CONTEXT TO paabwork ;
GRANT UPDATE ANY CUBE TO paabwork ;
GRANT DROP ANY TRIGGER TO paabwork ;
GRANT MANAGE ANY FILE GROUP TO paabwork ;
GRANT ALTER PUBLIC DATABASE LINK TO paabwork ;
GRANT MANAGE FILE GROUP TO paabwork ;
GRANT ALTER ANY INDEX TO paabwork ;
GRANT DROP ANY SEQUENCE TO paabwork ;
GRANT ALTER PROFILE TO paabwork ;
GRANT UNDER ANY TABLE TO paabwork ;
GRANT CREATE ASSEMBLY TO paabwork ;
GRANT DROP ANY LIBRARY TO paabwork ;
GRANT ALTER ANY EDITION TO paabwork ;
GRANT CREATE ROLE TO paabwork ;
GRANT CREATE LIBRARY TO paabwork ;
GRANT DROP ROLLBACK SEGMENT TO paabwork ;
GRANT CREATE TRIGGER TO paabwork ;
GRANT ALTER ANY PROCEDURE TO paabwork ;
GRANT ADMINISTER DATABASE TRIGGER TO paabwork ;
GRANT DROP ANY MEASURE FOLDER TO paabwork ;
GRANT CREATE ANY PROCEDURE TO paabwork ;
GRANT ALTER ANY OUTLINE TO paabwork ;
GRANT EXECUTE ANY INDEXTYPE TO paabwork ;
GRANT CREATE ANY DIRECTORY TO paabwork ;
GRANT ALTER ANY RULE SET TO paabwork ;
GRANT ALTER ANY MINING MODEL TO paabwork ;
GRANT DEBUG CONNECT SESSION TO paabwork ;
GRANT CREATE ANY MINING MODEL TO paabwork ;
GRANT ALTER SESSION TO paabwork ;
GRANT CREATE MATERIALIZED VIEW TO paabwork ;
GRANT MERGE ANY VIEW TO paabwork ;
GRANT CREATE ANY INDEX TO paabwork ;
GRANT CREATE DIMENSION TO paabwork ;
GRANT EXECUTE ANY RULE SET TO paabwork ;
GRANT ALTER ANY MATERIALIZED VIEW TO paabwork ;
GRANT AUDIT SYSTEM TO paabwork ;
GRANT CREATE OPERATOR TO paabwork ;
GRANT MANAGE ANY QUEUE TO paabwork ;
GRANT ALTER ANY SQL PROFILE TO paabwork ;
GRANT GRANT ANY OBJECT PRIVILEGE TO paabwork ;
GRANT CREATE INDEXTYPE TO paabwork ;
GRANT AUDIT ANY TO paabwork ;
GRANT DEBUG ANY PROCEDURE TO paabwork ;
GRANT CREATE ANY MEASURE FOLDER TO paabwork ;
GRANT CREATE ANY SEQUENCE TO paabwork ;
GRANT CREATE MEASURE FOLDER TO paabwork ;
GRANT UPDATE ANY CUBE BUILD PROCESS TO paabwork ;
GRANT CREATE VIEW TO paabwork ;
GRANT ALTER DATABASE LINK TO paabwork ;
GRANT ALTER ANY ASSEMBLY TO paabwork ;
GRANT CREATE ANY EVALUATION CONTEXT TO paabwork ;
GRANT SELECT ANY MINING MODEL TO paabwork ;
GRANT DELETE ANY CUBE DIMENSION TO paabwork ;
GRANT ALTER ANY TABLE TO paabwork ;
GRANT CREATE SESSION TO paabwork ;
GRANT CREATE RULE TO paabwork ;
GRANT BECOME USER TO paabwork ;
GRANT SELECT ANY TABLE TO paabwork ;
GRANT INSERT ANY MEASURE FOLDER TO paabwork ;
GRANT CREATE ANY SQL PROFILE TO paabwork ;
GRANT FORCE ANY TRANSACTION TO paabwork ;
GRANT DELETE ANY TABLE TO paabwork ;
GRANT ALTER ANY SEQUENCE TO paabwork ;
GRANT SELECT ANY CUBE DIMENSION TO paabwork ;
GRANT CREATE ANY EDITION TO paabwork ;
GRANT CREATE EXTERNAL JOB TO paabwork ;
GRANT DROP ANY MATERIALIZED VIEW TO paabwork ;
GRANT CREATE ANY CUBE BUILD PROCESS TO paabwork ;
GRANT FLASHBACK ANY TABLE TO paabwork ;
GRANT DROP ANY RULE SET TO paabwork ;
GRANT BACKUP ANY TABLE TO paabwork ;
GRANT ALTER ANY CUBE TO paabwork ;
GRANT CREATE TABLE TO paabwork ;
GRANT EXECUTE ANY LIBRARY TO paabwork ;
GRANT DROP ANY OUTLINE TO paabwork ;
GRANT EXECUTE ASSEMBLY TO paabwork ;
GRANT CREATE ANY DIMENSION TO paabwork ;
GRANT DROP ANY TABLE TO paabwork ;
GRANT ALTER ANY CLUSTER TO paabwork ;
GRANT EXECUTE ANY CLASS TO paabwork ;
GRANT DROP ANY DIMENSION TO paabwork ;
GRANT CREATE ANY RULE SET TO paabwork ;
GRANT SELECT ANY SEQUENCE TO paabwork ;
GRANT UNDER ANY TYPE TO paabwork ;
GRANT MANAGE TABLESPACE TO paabwork ;
GRANT DROP ANY OPERATOR TO paabwork ;
GRANT CREATE ANY OPERATOR TO paabwork ;
GRANT EXEMPT IDENTITY POLICY TO paabwork ;
GRANT CREATE TYPE TO paabwork ;
GRANT CREATE TABLESPACE TO paabwork ;
GRANT SELECT ANY TRANSACTION TO paabwork ;
GRANT DELETE ANY MEASURE FOLDER TO paabwork ;
GRANT CREATE ANY CUBE TO paabwork ;
GRANT LOCK ANY TABLE TO paabwork ;
GRANT CREATE EVALUATION CONTEXT TO paabwork ;
GRANT DROP ANY TYPE TO paabwork ;
GRANT ADVISOR TO paabwork ;
GRANT CREATE PUBLIC DATABASE LINK TO paabwork ;
GRANT ANALYZE ANY TO paabwork ;
GRANT DROP ANY RULE TO paabwork ;
GRANT INSERT ANY CUBE DIMENSION TO paabwork ;
GRANT CREATE ROLLBACK SEGMENT TO paabwork ;
GRANT CREATE ANY JOB TO paabwork ;
GRANT ALTER USER TO paabwork ;
GRANT QUERY REWRITE TO paabwork ;
GRANT SELECT ANY DICTIONARY TO paabwork ;
GRANT CREATE PUBLIC SYNONYM TO paabwork ;
GRANT GLOBAL QUERY REWRITE TO paabwork ;
GRANT ALTER ANY CUBE DIMENSION TO paabwork ;
GRANT CREATE ANY CUBE DIMENSION TO paabwork ;
GRANT DROP ANY CLUSTER TO paabwork ;
GRANT CREATE ANY RULE TO paabwork ;
GRANT UPDATE ANY CUBE DIMENSION TO paabwork ;
GRANT ADMINISTER RESOURCE MANAGER TO paabwork ;
GRANT CREATE ANY SYNONYM TO paabwork ;
GRANT DROP ANY SYNONYM TO paabwork ;
GRANT DROP ANY MINING MODEL TO paabwork ;
GRANT EXECUTE ANY PROCEDURE TO paabwork ;
GRANT CREATE SYNONYM TO paabwork ;
GRANT EXECUTE ANY PROGRAM TO paabwork ;
GRANT EXECUTE ANY TYPE TO paabwork ;
GRANT ON COMMIT REFRESH TO paabwork ;
GRANT CREATE SEQUENCE TO paabwork ;
GRANT COMMENT ANY MINING MODEL TO paabwork ;
GRANT ADMINISTER SQL TUNING SET TO paabwork ;
GRANT CREATE ANY INDEXTYPE TO paabwork ;
GRANT DROP ANY INDEX TO paabwork ;
GRANT RESTRICTED SESSION TO paabwork ;
GRANT DEQUEUE ANY QUEUE TO paabwork ;
GRANT ANALYZE ANY DICTIONARY TO paabwork ;
GRANT ALTER ANY INDEXTYPE TO paabwork ;
GRANT ADMINISTER ANY SQL TUNING SET TO paabwork ;
GRANT CREATE USER TO paabwork ;
GRANT EXECUTE ANY OPERATOR TO paabwork ;
GRANT CREATE CUBE BUILD PROCESS TO paabwork ;
GRANT CREATE PROFILE TO paabwork ;
GRANT ALTER ANY ROLE TO paabwork ;
GRANT UPDATE ANY TABLE TO paabwork ;
GRANT ALTER ANY LIBRARY TO paabwork ;
GRANT DROP ANY VIEW TO paabwork ;
GRANT CREATE ANY CLUSTER TO paabwork ;
GRANT EXECUTE ANY RULE TO paabwork ;
GRANT ALTER TABLESPACE TO paabwork ;
GRANT UNDER ANY VIEW TO paabwork ;
GRANT EXECUTE ANY ASSEMBLY TO paabwork ;
GRANT GRANT ANY PRIVILEGE TO paabwork ;
GRANT ALTER ANY TRIGGER TO paabwork ;
GRANT CREATE ANY VIEW TO paabwork ;
GRANT EXPORT FULL DATABASE TO paabwork ;
GRANT ALTER ANY EVALUATION CONTEXT TO paabwork ;
GRANT FLASHBACK ARCHIVE ADMINISTER TO paabwork ;
GRANT IMPORT FULL DATABASE TO paabwork ;
GRANT CREATE ANY OUTLINE TO paabwork ;
GRANT COMMENT ANY TABLE TO paabwork ;
GRANT CREATE DATABASE LINK TO paabwork ;
GRANT DROP PUBLIC SYNONYM TO paabwork ;
GRANT DROP USER TO paabwork ;
GRANT CHANGE NOTIFICATION TO paabwork ;
GRANT CREATE MINING MODEL TO paabwork ;
GRANT INSERT ANY TABLE TO paabwork ;
GRANT DROP PROFILE TO paabwork ;
GRANT CREATE ANY MATERIALIZED VIEW TO paabwork ;
GRANT CREATE RULE SET TO paabwork ;
GRANT EXEMPT ACCESS POLICY TO paabwork ;
GRANT MANAGE SCHEDULER TO paabwork ;
GRANT READ ANY FILE GROUP TO paabwork ;
GRANT FORCE TRANSACTION TO paabwork ;
GRANT DROP ANY CUBE BUILD PROCESS TO paabwork ;
GRANT ALTER ANY TYPE TO paabwork ;
GRANT DROP ANY PROCEDURE TO paabwork ;
GRANT DROP PUBLIC DATABASE LINK TO paabwork ;
GRANT DROP ANY INDEXTYPE TO paabwork ;
GRANT DROP ANY SQL PROFILE TO paabwork ;
GRANT ALTER SYSTEM TO paabwork ;
GRANT UNLIMITED TABLESPACE TO paabwork ;
GRANT DROP ANY ROLE TO paabwork ;
GRANT ALTER ANY DIMENSION TO paabwork ;
GRANT DROP ANY CUBE DIMENSION TO paabwork ;
GRANT DROP ANY CUBE TO paabwork ;
GRANT CREATE ANY TRIGGER TO paabwork ;
GRANT DROP ANY ASSEMBLY TO paabwork ;
GRANT CREATE ANY TABLE TO paabwork ;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO paabwork ;
GRANT DROP ANY DIRECTORY TO paabwork ;
GRANT ENQUEUE ANY QUEUE TO paabwork ;
GRANT DROP ANY EVALUATION CONTEXT TO paabwork ;
GRANT CREATE ANY ASSEMBLY TO paabwork ;
GRANT CREATE ANY TYPE TO paabwork ;
GRANT CREATE CLUSTER TO paabwork ;
GRANT CREATE ANY CONTEXT TO paabwork ;
GRANT EXECUTE ANY EVALUATION CONTEXT TO paabwork ;
GRANT RESUMABLE TO paabwork ;
GRANT CREATE ANY LIBRARY TO paabwork ;
GRANT DROP ANY EDITION TO paabwork ;
GRANT CREATE PROCEDURE TO paabwork ;
GRANT ALTER DATABASE TO paabwork ;
GRANT SELECT ANY CUBE TO paabwork ;
GRANT GRANT ANY ROLE TO paabwork ;
GRANT ALTER ANY RULE TO paabwork ;
GRANT CREATE CUBE DIMENSION TO paabwork ;
GRANT ALTER ANY OPERATOR TO paabwork ;
GRANT CREATE CUBE TO paabwork ;
GRANT ALTER RESOURCE COST TO paabwork ;
GRANT DROP TABLESPACE TO paabwork ;
GRANT ALTER ROLLBACK SEGMENT TO paabwork ;

-- USER SQL
CREATE USER paab IDENTIFIED BY paab 
DEFAULT TABLESPACE "BAP_DATA"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER paab QUOTA UNLIMITED ON BAP_INDX;
ALTER USER paab QUOTA UNLIMITED ON BAP_DATA;

-- ROLES
GRANT "DATAPUMP_EXP_FULL_DATABASE" TO paab ;
GRANT "DBA" TO paab ;
GRANT "HS_ADMIN_EXECUTE_ROLE" TO paab ;
GRANT "ADM_PARALLEL_EXECUTE_TASK" TO paab ;
GRANT "CTXAPP" TO paab ;
GRANT "SELECT_CATALOG_ROLE" TO paab ;
GRANT "CONNECT" TO paab ;
GRANT "DATAPUMP_IMP_FULL_DATABASE" TO paab ;
GRANT "OEM_MONITOR" TO paab ;
GRANT "APEX_ADMINISTRATOR_ROLE" TO paab ;
GRANT "AQ_USER_ROLE" TO paab ;
GRANT "SCHEDULER_ADMIN" TO paab ;
GRANT "XDB_SET_INVOKER" TO paab ;
GRANT "RECOVERY_CATALOG_OWNER" TO paab ;
GRANT "DBFS_ROLE" TO paab ;
GRANT "XDB_WEBSERVICES_OVER_HTTP" TO paab ;
GRANT "HS_ADMIN_SELECT_ROLE" TO paab ;
GRANT "PLUSTRACE" TO paab ;
GRANT "RESOURCE" TO paab ;
GRANT "AQ_ADMINISTRATOR_ROLE" TO paab ;
GRANT "DELETE_CATALOG_ROLE" TO paab ;
GRANT "XDB_WEBSERVICES_WITH_PUBLIC" TO paab ;
GRANT "XDB_WEBSERVICES" TO paab ;
GRANT "EXECUTE_CATALOG_ROLE" TO paab ;
GRANT "EXP_FULL_DATABASE" TO paab ;
GRANT "GATHER_SYSTEM_STATISTICS" TO paab ;
GRANT "LOGSTDBY_ADMINISTRATOR" TO paab ;
GRANT "AUTHENTICATEDUSER" TO paab ;
GRANT "OEM_ADVISOR" TO paab ;
GRANT "HS_ADMIN_ROLE" TO paab ;
GRANT "XDBADMIN" TO paab ;
GRANT "IMP_FULL_DATABASE" TO paab ;

-- SYSTEM PRIVILEGES
GRANT CREATE JOB TO paab ;
GRANT DROP ANY CONTEXT TO paab ;
GRANT UPDATE ANY CUBE TO paab ;
GRANT DROP ANY TRIGGER TO paab ;
GRANT MANAGE ANY FILE GROUP TO paab ;
GRANT ALTER PUBLIC DATABASE LINK TO paab ;
GRANT MANAGE FILE GROUP TO paab ;
GRANT ALTER ANY INDEX TO paab ;
GRANT DROP ANY SEQUENCE TO paab ;
GRANT ALTER PROFILE TO paab ;
GRANT UNDER ANY TABLE TO paab ;
GRANT CREATE ASSEMBLY TO paab ;
GRANT DROP ANY LIBRARY TO paab ;
GRANT ALTER ANY EDITION TO paab ;
GRANT CREATE ROLE TO paab ;
GRANT CREATE LIBRARY TO paab ;
GRANT DROP ROLLBACK SEGMENT TO paab ;
GRANT CREATE TRIGGER TO paab ;
GRANT ALTER ANY PROCEDURE TO paab ;
GRANT ADMINISTER DATABASE TRIGGER TO paab ;
GRANT DROP ANY MEASURE FOLDER TO paab ;
GRANT CREATE ANY PROCEDURE TO paab ;
GRANT ALTER ANY OUTLINE TO paab ;
GRANT EXECUTE ANY INDEXTYPE TO paab ;
GRANT CREATE ANY DIRECTORY TO paab ;
GRANT ALTER ANY RULE SET TO paab ;
GRANT ALTER ANY MINING MODEL TO paab ;
GRANT DEBUG CONNECT SESSION TO paab ;
GRANT CREATE ANY MINING MODEL TO paab ;
GRANT ALTER SESSION TO paab ;
GRANT CREATE MATERIALIZED VIEW TO paab ;
GRANT MERGE ANY VIEW TO paab ;
GRANT CREATE ANY INDEX TO paab ;
GRANT CREATE DIMENSION TO paab ;
GRANT EXECUTE ANY RULE SET TO paab ;
GRANT ALTER ANY MATERIALIZED VIEW TO paab ;
GRANT AUDIT SYSTEM TO paab ;
GRANT CREATE OPERATOR TO paab ;
GRANT MANAGE ANY QUEUE TO paab ;
GRANT ALTER ANY SQL PROFILE TO paab ;
GRANT GRANT ANY OBJECT PRIVILEGE TO paab ;
GRANT CREATE INDEXTYPE TO paab ;
GRANT AUDIT ANY TO paab ;
GRANT DEBUG ANY PROCEDURE TO paab ;
GRANT CREATE ANY MEASURE FOLDER TO paab ;
GRANT CREATE ANY SEQUENCE TO paab ;
GRANT CREATE MEASURE FOLDER TO paab ;
GRANT UPDATE ANY CUBE BUILD PROCESS TO paab ;
GRANT CREATE VIEW TO paab ;
GRANT ALTER DATABASE LINK TO paab ;
GRANT ALTER ANY ASSEMBLY TO paab ;
GRANT CREATE ANY EVALUATION CONTEXT TO paab ;
GRANT SELECT ANY MINING MODEL TO paab ;
GRANT DELETE ANY CUBE DIMENSION TO paab ;
GRANT ALTER ANY TABLE TO paab ;
GRANT CREATE SESSION TO paab ;
GRANT CREATE RULE TO paab ;
GRANT BECOME USER TO paab ;
GRANT SELECT ANY TABLE TO paab ;
GRANT INSERT ANY MEASURE FOLDER TO paab ;
GRANT CREATE ANY SQL PROFILE TO paab ;
GRANT FORCE ANY TRANSACTION TO paab ;
GRANT DELETE ANY TABLE TO paab ;
GRANT ALTER ANY SEQUENCE TO paab ;
GRANT SELECT ANY CUBE DIMENSION TO paab ;
GRANT CREATE ANY EDITION TO paab ;
GRANT CREATE EXTERNAL JOB TO paab ;
GRANT DROP ANY MATERIALIZED VIEW TO paab ;
GRANT CREATE ANY CUBE BUILD PROCESS TO paab ;
GRANT FLASHBACK ANY TABLE TO paab ;
GRANT DROP ANY RULE SET TO paab ;
GRANT BACKUP ANY TABLE TO paab ;
GRANT ALTER ANY CUBE TO paab ;
GRANT CREATE TABLE TO paab ;
GRANT EXECUTE ANY LIBRARY TO paab ;
GRANT DROP ANY OUTLINE TO paab ;
GRANT EXECUTE ASSEMBLY TO paab ;
GRANT CREATE ANY DIMENSION TO paab ;
GRANT DROP ANY TABLE TO paab ;
GRANT ALTER ANY CLUSTER TO paab ;
GRANT EXECUTE ANY CLASS TO paab ;
GRANT DROP ANY DIMENSION TO paab ;
GRANT CREATE ANY RULE SET TO paab ;
GRANT SELECT ANY SEQUENCE TO paab ;
GRANT UNDER ANY TYPE TO paab ;
GRANT MANAGE TABLESPACE TO paab ;
GRANT DROP ANY OPERATOR TO paab ;
GRANT CREATE ANY OPERATOR TO paab ;
GRANT EXEMPT IDENTITY POLICY TO paab ;
GRANT CREATE TYPE TO paab ;
GRANT CREATE TABLESPACE TO paab ;
GRANT SELECT ANY TRANSACTION TO paab ;
GRANT DELETE ANY MEASURE FOLDER TO paab ;
GRANT CREATE ANY CUBE TO paab ;
GRANT LOCK ANY TABLE TO paab ;
GRANT CREATE EVALUATION CONTEXT TO paab ;
GRANT DROP ANY TYPE TO paab ;
GRANT ADVISOR TO paab ;
GRANT CREATE PUBLIC DATABASE LINK TO paab ;
GRANT ANALYZE ANY TO paab ;
GRANT DROP ANY RULE TO paab ;
GRANT INSERT ANY CUBE DIMENSION TO paab ;
GRANT CREATE ROLLBACK SEGMENT TO paab ;
GRANT CREATE ANY JOB TO paab ;
GRANT ALTER USER TO paab ;
GRANT QUERY REWRITE TO paab ;
GRANT SELECT ANY DICTIONARY TO paab ;
GRANT CREATE PUBLIC SYNONYM TO paab ;
GRANT GLOBAL QUERY REWRITE TO paab ;
GRANT ALTER ANY CUBE DIMENSION TO paab ;
GRANT CREATE ANY CUBE DIMENSION TO paab ;
GRANT DROP ANY CLUSTER TO paab ;
GRANT CREATE ANY RULE TO paab ;
GRANT UPDATE ANY CUBE DIMENSION TO paab ;
GRANT ADMINISTER RESOURCE MANAGER TO paab ;
GRANT CREATE ANY SYNONYM TO paab ;
GRANT DROP ANY SYNONYM TO paab ;
GRANT DROP ANY MINING MODEL TO paab ;
GRANT EXECUTE ANY PROCEDURE TO paab ;
GRANT CREATE SYNONYM TO paab ;
GRANT EXECUTE ANY PROGRAM TO paab ;
GRANT EXECUTE ANY TYPE TO paab ;
GRANT ON COMMIT REFRESH TO paab ;
GRANT CREATE SEQUENCE TO paab ;
GRANT COMMENT ANY MINING MODEL TO paab ;
GRANT ADMINISTER SQL TUNING SET TO paab ;
GRANT CREATE ANY INDEXTYPE TO paab ;
GRANT DROP ANY INDEX TO paab ;
GRANT RESTRICTED SESSION TO paab ;
GRANT DEQUEUE ANY QUEUE TO paab ;
GRANT ANALYZE ANY DICTIONARY TO paab ;
GRANT ALTER ANY INDEXTYPE TO paab ;
GRANT ADMINISTER ANY SQL TUNING SET TO paab ;
GRANT CREATE USER TO paab ;
GRANT EXECUTE ANY OPERATOR TO paab ;
GRANT CREATE CUBE BUILD PROCESS TO paab ;
GRANT CREATE PROFILE TO paab ;
GRANT ALTER ANY ROLE TO paab ;
GRANT UPDATE ANY TABLE TO paab ;
GRANT ALTER ANY LIBRARY TO paab ;
GRANT DROP ANY VIEW TO paab ;
GRANT CREATE ANY CLUSTER TO paab ;
GRANT EXECUTE ANY RULE TO paab ;
GRANT ALTER TABLESPACE TO paab ;
GRANT UNDER ANY VIEW TO paab ;
GRANT EXECUTE ANY ASSEMBLY TO paab ;
GRANT GRANT ANY PRIVILEGE TO paab ;
GRANT ALTER ANY TRIGGER TO paab ;
GRANT CREATE ANY VIEW TO paab ;
GRANT EXPORT FULL DATABASE TO paab ;
GRANT ALTER ANY EVALUATION CONTEXT TO paab ;
GRANT FLASHBACK ARCHIVE ADMINISTER TO paab ;
GRANT IMPORT FULL DATABASE TO paab ;
GRANT CREATE ANY OUTLINE TO paab ;
GRANT COMMENT ANY TABLE TO paab ;
GRANT CREATE DATABASE LINK TO paab ;
GRANT DROP PUBLIC SYNONYM TO paab ;
GRANT DROP USER TO paab ;
GRANT CHANGE NOTIFICATION TO paab ;
GRANT CREATE MINING MODEL TO paab ;
GRANT INSERT ANY TABLE TO paab ;
GRANT DROP PROFILE TO paab ;
GRANT CREATE ANY MATERIALIZED VIEW TO paab ;
GRANT CREATE RULE SET TO paab ;
GRANT EXEMPT ACCESS POLICY TO paab ;
GRANT MANAGE SCHEDULER TO paab ;
GRANT READ ANY FILE GROUP TO paab ;
GRANT FORCE TRANSACTION TO paab ;
GRANT DROP ANY CUBE BUILD PROCESS TO paab ;
GRANT ALTER ANY TYPE TO paab ;
GRANT DROP ANY PROCEDURE TO paab ;
GRANT DROP PUBLIC DATABASE LINK TO paab ;
GRANT DROP ANY INDEXTYPE TO paab ;
GRANT DROP ANY SQL PROFILE TO paab ;
GRANT ALTER SYSTEM TO paab ;
GRANT UNLIMITED TABLESPACE TO paab ;
GRANT DROP ANY ROLE TO paab ;
GRANT ALTER ANY DIMENSION TO paab ;
GRANT DROP ANY CUBE DIMENSION TO paab ;
GRANT DROP ANY CUBE TO paab ;
GRANT CREATE ANY TRIGGER TO paab ;
GRANT DROP ANY ASSEMBLY TO paab ;
GRANT CREATE ANY TABLE TO paab ;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO paab ;
GRANT DROP ANY DIRECTORY TO paab ;
GRANT ENQUEUE ANY QUEUE TO paab ;
GRANT DROP ANY EVALUATION CONTEXT TO paab ;
GRANT CREATE ANY ASSEMBLY TO paab ;
GRANT CREATE ANY TYPE TO paab ;
GRANT CREATE CLUSTER TO paab ;
GRANT CREATE ANY CONTEXT TO paab ;
GRANT EXECUTE ANY EVALUATION CONTEXT TO paab ;
GRANT RESUMABLE TO paab ;
GRANT CREATE ANY LIBRARY TO paab ;
GRANT DROP ANY EDITION TO paab ;
GRANT CREATE PROCEDURE TO paab ;
GRANT ALTER DATABASE TO paab ;
GRANT SELECT ANY CUBE TO paab ;
GRANT GRANT ANY ROLE TO paab ;
GRANT ALTER ANY RULE TO paab ;
GRANT CREATE CUBE DIMENSION TO paab ;
GRANT ALTER ANY OPERATOR TO paab ;
GRANT CREATE CUBE TO paab ;
GRANT ALTER RESOURCE COST TO paab ;
GRANT DROP TABLESPACE TO paab ;
GRANT ALTER ROLLBACK SEGMENT TO paab ;

