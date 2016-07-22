
# Troubleshootinhg

## Unable to compile class for JSP

You may need jdk-1.7.* for older JBoss-6.2.*

`org.apache.jasper.JasperException: JBWEB004062: Unable to compile class for JSP`

http://stackoverflow

### Change jdk

- Remove C:\Windows\System32\java*.exe
- Rename C:\ProgramData\Oracle\Java\javapath C:\ProgramData\Oracle\Java\javapath2
- Add to PATH %JAVA_HOME%\bin

To test run new terminal (not from right click unless you reopened file explorer window), then:

`java -version`

### Intellij IDEA

Than if you have newer idea, it may need jdk-8. Set env IDEA_JDK or IDEA_JDK_64 var

https://intellij-support.jetbrains.com/hc/en-us/articles/206544879-Selecting-the-JDK-version-the-IDE-will-run-under

Then restart idea.

## Error: EBUSY: resource busy or locked, unlink when running ./generate-configs.js

Stop jboss and rerun this command

## org.jboss.msc.service.DuplicateServiceException: Service jboss.web.deployment.default-host./xbg-ab-pa-web.realm is already registered

Run `$JBOSS_HOME/standalone\deployments/*.war*` or `./generate-configs.js`.

## Server responds with 404

You have to run gulp or grunt. Then for IDEA to update jboss resources, you have to switch from IDEA to another program and back.

## org.apache.jasper.JasperException: JBWEB004062: Unable to compile class for JSP

Probably you run jboss-6.2 with jdk-8. Run it with jdk-7.
