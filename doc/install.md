# Install

## Requirements

- node.js-4.x
- bash
- `mvn` is in `$PATH`
- env `MVN_HOME` and `JAVA_HOME` are set

## Oracle on Windows

Copy `src/oracle/*.ora` to `/oraclexe/app/oracle/product/11.2.0/server/network/ADMIN` and restart listener.

To do that you have to run `cmd.exe` as Administrator and run commands:

```
lsnrctl stop
lsnrctl start
```

## Prepare config

```
cd src
cp .env.example .env
```

Then customize `.env` to your needs.


## PA

Change in `.env` file `PA_ENABLED` to `true`.

### Run

```
cd src
./pa-all.sh
```

Later you run specific scripts listed in `pa-all.sh`.

If you run JBoss from IDEA and want to have updated frontend resources, you need to remove `exclude` for directory `pa-web/target/fronted`.

### Browser

When you see in console `JBoss ... started in`, open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848. If you see `JBoss ... started (with errors) in`, that's not good.


## ADMINBOX

Change in `.env` file `ADMINBOX_ENABLED` to `true`.

### Run

```
cd src
./adminbox-all.sh
```

Later you run specific scripts listed in `adminbox-all.sh`.

For IDEA to update jboss resources, you have to switch from IDEA to another program and back.

### Browser

When you see in console `Deploy took ...`, open http://localhost:8080/xbg-ab-pa-web.

You have to login with SON04860, as this user can change privileges.


## RTT

Change in `.env` file `RTT_ENABLED` to `true`.

### Run

```
cd src
./rtt-all.sh
```

Later you run specific scripts listed in `rtt-all.sh`.

### Browser

When you see in console `JBoss ... started in`, open http://localhost:8080/xbg-rtt-web/. If you see `JBoss ... started (with errors) in`, that's not good.

You have to login with some BER or SON, i.e. BER07848.

### Live reload

In .env set `DISABLE_AUTH_FILTER=true`.

In src directory run:

`MAIN=RTT gulp`

Open http://localhost:8126/
