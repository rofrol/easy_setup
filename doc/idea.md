## Default Settings

- `IDEA > File > Other Settings > Default Settings > Build, Execution, Deployment > Build Tools > Maven > Importing > Import Maven projects automatically`
- `IDEA > File > Other Settings > Default Settings > Build, Execution, Deployment > Build Tools > Maven > Importing > Use Maven ouput directories > Uncheck`
- `IDEA > File > Other Settings > Default Settings > Editor > File Encodings > set UTF-8 everywhere`
- `IDEA > File > Other Settings > Default Project Structure > SDK > Java 1.8`
- `IDEA > File > Other Settings > Default Project Structure > Language level > Java 1.7`

## Run configurations for PA

`IDEA > Run > Edit Configurations > + > Jboss Server > Local`

### `Server` tab

- `Application server > Choose your jboss installation`
- Uncheck `Open browser: After launch`

### `Deployment` tab

- `+ > Artifact > pa-web:war exploded`

Click `Edit artifact` icon

  - `Artifact > Ouput directory` remove everything after `pa-web` from path, so it looks like `C:\projects\xbg-pa\pa-web\target\pa-web`
  - `Modules > pa-web > Sources`: unexclude `target/frontend` and mark it as `Resources`

After choosing war, you can set addtional options in `Server` tab

- `On 'Update' action > Update resources`
- `On frame deactivation > Update resources`

### Gulp

`Alt + F11 > + > Choose Gulpfile > C:\projects\xbg-pa\pa-web\gulpfile.js`

After restarting IDEA, you will see tab Gulp at the left. You can also open gulp panel with `Ctrl + Shift + A > gulp`.

When you open gulp panel, run `watch` task.

## Hot reload

You need gulp running. If you change some frontend file, you have to `Alt + Tab` from IDEA and back, so that IDEA will send changed resources to jboss.

For Java files, you probably need to run configuration in debug mode.

## Run configuration

Run/debug configuration, it's done when you see green icon for particulars wars in run/debug panel.
