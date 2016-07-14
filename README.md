# Easy setup

## Requirements

- bash
- adminbox is in `/projects/xbg-adminbox/` (`c:\projects\xbg-adminbox\` on Windows)
- xbg-pa is in `/projects/xbg-pa/` (`c:\projects\xbg-pa\` on Windows)
- oracle connection url is `jdbc:oracle:thin:@localhost:1521:XE`
- `mvn` is in `$PATH`
- `$MVN_HOME` and `$JAVA_HOME` are set

## Run

```
cp easy_setup/.env.example .env
# customize .env
sh easy_setup/all.sh
```

Later you run specific scripts listed in `all.sh`.

## Git alias


Create git alias:

```
./easy_setup/es.sh
```

and use it every time you need easy_setup files in your branch:

```
git es
```

## Browser

Open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848.
