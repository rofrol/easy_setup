
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

##  node jboss-setup.js - Error: EBUSY: resource busy or locked, unlink

Stop jboss and rerun this command