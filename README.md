# MLP easy setup

## Requirements

- node.js-4.x
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

## PA

### Run

```
cd src
sh pa-all.sh
```

Later you run specific scripts listed in `pa-all.sh`.

### Browser

When you see in console 'JBoss ... started', open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848.

## RTT

### Run

```
cd src
sh rtt-all.sh
```

Later you run specific scripts listed in `rtt-all.sh`.

Now stop this script. Then:

```
cd xbg-rtt-web
grunt
```

Run jboss from Intellij IDEA.

### Browser

When you see in console 'JBoss ... started ', open http://localhost:8080/xb-web/frontend/index.jsp?partnerno=6720556 and login as BER07848.
