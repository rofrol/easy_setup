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

## PA

Change in `.env` file `PA_ENABLED` to `true`.

### Run

```
cd src
sh pa-all.sh
node pa-npm-setup.js
```

Later you run specific scripts listed in `pa-all.sh`.

If you run JBoss from IDEA and want to have updated frontend resources, you need to remove `exclude` for directory `pa-web/target/fronted`.

Role: ZSC_AWT_BERATER_DE
Permissions: [PA]

### Browser

When you see in console `JBoss ... started in`, open http://localhost:8080/pa-web/frontend/index.jsp?partnerno=6720556 and login as BER07848. If you see `JBoss ... started (with errors) in`, that's not good.


## ADMINBOX

Change in `.env` file `ADMINBOX_ENABLED` to `true`.

### Run

```
cd src
sh adminbox-all.sh
node adminbox-npm-setup.js
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
sh rtt-all.sh
node rtt-npm-setup.js
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

## PA and RTT integration

### Config

Basically in PA config RTT should be enabled, and adminbox upload directory should be the same in PA and ADMINBOX directory.

1. Start jboss with PA, ADMINBOX and RTT wars.
2. Log in to PA in web browser. You should see what is your static role in console i.e. `Role: ZSC_AWT_BERATER_DE`.
3. Run `IE > File > New session` or delete cookies for localhost domain.
4. Open ADMINBOX page in browser.
5. Log in as SON04860.
6. Click on `Rollen und Berechtigungen`.
7. Click `NEUE ROLLE ANLEGEN`.
8. Rollename: Berater static
9. Rollenname Umsysteme: ZSC_AWT_BERATER_DE
10. Kundenart: -
11. Kundenbeziehung: -
12. Testfalltemplate aufzeichnen: checked
13. Click `Speichern`
14. Open in file explorer directory which is set in env `ADMINBOXUPLOADDIRECTORY`.
15. Go back to browser and click `Übergabe an PA`.
16. You should see in file explorer `rollen.json`. After 30s this file should dissapear.

### Testing

1. Go to PA in browser in new session.
2. Startseite > BAUSTEIN ERSTELLEN > Sicherung der Gesundheit > Beihilfe > ZUR PRODUKTAUSWAHL.
3. You should correct all errors in the form:
  - `Grunddaten > Tätigkeitsstatus > Beamter (auf Probe / Lebenszeit)`
  - `Beihilfeassistent > Dienstherr > Bund`
  - `Beihilfeassistent > Anzahl der berücksichtigungsfähigen Kinder lt. Beihilfebescheid > 1`.
4. Click outside form so it will update and then click refresh button at the bottom right.
5. There should some rows appear. Click on any of them, but not on checkbox.
6. Click `Spiechern` at the top right corner.
7. Fill the form:
  - Beschreibung: 1
  - zusätzlich als Testfalltemplate speichern: check <- If you don't see this checkbox, integration didn't worked. Correct config and relogin.
  - Template Name: 1
8. Click `Spiechern`.
9. Open RTT in the same browser window.
10. Go to `RTT > Suche`.
11. Click `TESTFALEN SUCHEN`.
12. You should see result list with your template.
