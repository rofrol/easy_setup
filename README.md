# MLP easy setup

## Requirements

- node.js
- bash
- `mvn` is in `$PATH`
- env `MVN_HOME` and `JAVA_HOME` are set

## Oracle on Windows

Example configs are in `src/oracle`. You have to put them i.e. in `/oraclexe/app/oracle/product/11.2.0/server/network/ADMIN` and restart listener.

To do that you have to run `cmd.exe` as Administrator and run commands:

```
lsnrctl stop
lsnrctl start
```

## Prepare config

`cp .env.example .env`

Then customize `.env` to your needs.

## Run PA

```
cd src
sh pa-all.sh
```

Later you run specific scripts listed in `pa-all.sh`.

## Browser

### PA

When you see in console 'JBoss ... started in', open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848.
