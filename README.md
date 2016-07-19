# MLP easy setup

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

`cp .env.example .env`

Then customize `.env` to your needs.

You need to set `MAIN` and `*_ENABLED`.

## PA

Change in `.env` MAIN to PA and `PA_ENABLED` to `true`.

### Run

```
cd src
sh pa-all.sh
```

Later you run specific scripts listed in `pa-all.sh`.

If you run JBoss from IDEA and want to have updated frontend resources, you need to remove exclude for directory `pa-web/target/fronted`.

### Browser

When you see in console `JBoss ... started in`, open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848. If you see `JBoss ... started (with errors) in`, that's not good.

## RTT

Change in `.env` MAIN to RTT `RTT_ENABLED` to `true`.

### Run

```
cd src
sh rtt-all.sh
```

Later you run specific scripts listed in `rtt-all.sh`.

Now stop this script. Then run jboss from Intellij IDEA. After that run:

```
cd xbg-rtt-web
grunt
```

For IDEA to update jboss resources, you have to switch from IDEA to another program and back.

### Browser

When you see in console `JBoss ... started in`, open http://localhost:8080/xbg-rtt-web/. If you see `JBoss ... started (with errors) in`, that's not good.

You have to login with some BER or SON, i.e. BER07848.

But first you have to add privileges for logging to RTT.

## Troubleshootinhg

### Unable to compile class for JSP

You may need jdk-1.7.* for older JBoss-6.2.*

`org.apache.jasper.JasperException: JBWEB004062: Unable to compile class for JSP`

http://stackoverflow

#### Change jdk

- Remove C:\Windows\System32\java*.exe
- Rename C:\ProgramData\Oracle\Java\javapath C:\ProgramData\Oracle\Java\javapath2
- Add to PATH %JAVA_HOME%\bin

To test run new terminal (not from right click unless you reopened file explorer window), then:

`java -version`


#### Intellij IDEA


Than if you have newer idea, it may need jdk-8. Set env IDEA_JDK or IDEA_JDK_64 var

https://intellij-support.jetbrains.com/hc/en-us/articles/206544879-Selecting-the-JDK-version-the-IDE-will-run-under

Then restart idea.
