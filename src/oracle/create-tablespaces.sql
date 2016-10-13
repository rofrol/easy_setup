-- https://community.oracle.com/thread/911457?start=0&tstart=0
DECLARE
     TablespaceExistsExcep     EXCEPTION;
     PRAGMA EXCEPTION_INIT(TablespaceExistsExcep,-1543);
BEGIN
     EXECUTE IMMEDIATE 'CREATE TABLESPACE BAP_DATA DATAFILE ''BAP_DATA.dbf'' SIZE 1024M ONLINE';
     EXECUTE IMMEDIATE 'CREATE TABLESPACE BAP_INDX DATAFILE ''BAP_INDX.dbf'' SIZE 300M ONLINE';
EXCEPTION
     WHEN TablespaceExistsExcep THEN
          DBMS_OUTPUT.PUT_LINE('Creating tablespaces failed....');
          NULL;
END;
/
