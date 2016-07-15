# Easy setup

## Requirements

- bash
- oracle connection url is `jdbc:oracle:thin:@localhost:1521:XE`
- `mvn` is in `$PATH`
- `$MVN_HOME` and `$JAVA_HOME` are set

## Oracle on Windows

Exapmple configs are in `src\oracle`. You have to put them in `C:\oraclexe\app\oracle\product\11.2.0\server\network\ADMIN` and restart listener.

To do that you have to run `cmd.exe` as Administrator and run commands:

```
lsnrctl stop
lsnrctl start
```

## Run PA

```
cp .env.example .env
# customize .env
sh pa-all.sh
```

Later you run specific scripts listed in `pa-all.sh`.


## Browser

### PA

When you see in console 'JBoss ... started in', open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848.
