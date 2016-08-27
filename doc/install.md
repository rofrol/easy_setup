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

Then customize `.env` to your needs. For example

```
RTT_HOME=/path/to/xbg-rtt
```

So RTT on Windows is in `C:\path\to\xbg-rtt`.

For paths use forward slashes, no trailing slash, no leading `/c`.

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

You need .env file: `cp .env.example .env`

In .env set

```
DISABLE_AUTH_FILTER=true
RTT_HOME=/path/to/xbg-rtt
```

Read more about .env in chapter `## Prepare config`.

In src directory run:

`gulp RTT`

Open in IE http://localhost:8126/ or in Chrome but start like this: `chrome.exe --disable-web-security`.

#### Troubleshootinhg

- If there is error in terminal `Address already in use`, close terminal and kill node processes.
- If livereload stops working, rerun it.
