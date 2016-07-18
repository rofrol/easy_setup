-- http://stackoverflow.com/questions/30710990/creating-an-oracle-user-if-it-doesnt-already-exist
-- http://blog.lakmali.com/2011/10/oracle-plsql-script-to-drop-user-if-not.html

-- Try to lose the ";" from inside the string that you Execute Immediate
-- http://stackoverflow.com/questions/885304/why-does-running-this-query-with-execute-immediate-cause-it-to-fail

declare
userexist integer;
begin
  select count(*) into userexist from dba_users where username='partt';
  if (userexist = 0) then
    execute immediate 'DROP USER partt CASCADE';
  end if;
end;
/

declare
userexist integer;
begin
  select count(*) into userexist from dba_users where username='parttwork';
  if (userexist = 0) then
    execute immediate 'DROP USER parttwork CASCADE';
  end if;
end;
/
