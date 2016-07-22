
# PA and RTT integration

## Config

Basically what should be done for local development:

- RTT is enabled in PA config
- adminbox upload directory is the same in PA and ADMINBOX directory
- JBoss is started with PA and RTT wars.

1. Start jboss with PA, ADMINBOX and RTT wars.
2. Log in to PA as BER in web browser. You should see what is your static role in console i.e. `Role: ZSC_AWT_BERATER_DE`.
3. Run `IE > File > New session` or delete cookies for localhost domain.
4. Open ADMINBOX page in browser.
5. Log in as SON.
6. Click on `Rollen und Berechtigungen`.
7. Click `NEUE ROLLE ANLEGEN`.
8. Rollename: Berater static
9. Rollenname Umsysteme: ZSC_AWT_BERATER_DE
10. Kundenart: -
11. Kundenbeziehung: -
12. Testfalltemplate aufzeichnen: checked
13. Click `Speichern`
14. Open in file explorer directory which is set in .env in `ADMINBOXUPLOADDIRECTORY`.
15. Go back to browser and click `Übergabe an PA`.
16. You should see in file explorer `rollen.json`. After 30s this file should disappear and permissions should be updated in PA database.

## Testing

1. Relogin to PA in web browser for privileges to take effect.
2. Startseite > BAUSTEIN ERSTELLEN > Sicherung der Gesundheit > Beihilfe > ZUR PRODUKTAUSWAHL.
3. You should correct all errors in the form:
  - `Grunddaten > Tätigkeitsstatus > Beamter (auf Probe / Lebenszeit)`
  - `Beihilfeassistent > Dienstherr > Bund`
  - `Beihilfeassistent > Anzahl der berücksichtigungsfähigen Kinder lt. Beihilfebescheid > 1`.
4. Click outside form so it will update and then click button with two arrows at the bottom right.
5. There should some rows appear. Click on any of them, but not on checkbox.
6. Click `Spiechern` at the top right corner.
7. Fill the form:
  - Beschreibung: 1
  - zusätzlich als Testfalltemplate speichern: check <- If you don't see this checkbox, integration didn't worked. Make config correct and relogin.
  - Template Name: 1
8. Click `Spiechern`.
9. Open RTT in the same browser window.
10. Go to `RTT > Suche`.
11. Click `TESTFALEN SUCHEN`.
12. You should see result list with your template.
