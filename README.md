# Compare-UserJS

No idea what user.js is? Read [this article](https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences). Side note: for enhanced privacy and security I use (and recommend) the [ghacks-user.js](https://github.com/ghacksuserjs/ghacks-user.js).

This script requires only PowerShell v2+, which comes pre-installed on Windows 7, but it *should* also run fine on Unix-like systems.

Compare-UserJS uses my own elegant <sup>[<i>Citation needed.</i>]</sup>  algorithm for parsing JavaScript half-assedly, and by default logs the results to userJS_diff.log.

Things detected (and reported) by this script:

- matching prefs, both value and state (active/inactive)
- prefs with different values but same matching state
- prefs declared in file A that are not declared in file B
- prefs declared in file B that are not declared in file A
- prefs declared within JS comments (inactive) in A but active in B
- prefs declared within JS comments (inactive) in B but active in A
- duplicated prefs in each of the two source files.

Additionally, it can catch one type of syntax error when declaring prefs, and includes that information in the report.

## Usage

Simply save this script wherever you want, launch the PowerShell CLI, [CD to that folder](https://ss64.com/ps/set-location.html), and run it, as in:

```PowerShell
CD C:\path\to\the\script
.\Compare-UserJS
```

If you're a PowerShell virgin and you still don't have a clue what I am talking about, don't freak out (been there, done that) and just keep reading. There is an alternative below. If you're the reader type, [read this](https://ss64.com/ps/syntax-run.html) (or just search teh interwebz).

The script will prompt you to enter the paths of the two user.js files to compare. Keep in mind that the actual names of the files don't matter, I only refer to them as *user.js* because that's what their names have to be when... OMG am I really explaining this?

See the embedded help info with:

```PowerShell
Get-Help .\Compare-UserJS -full
```

Or just read it from the file, but that's less thrilling.

If you don't want to type that much (and you're on Windows), you can alternatively run the batch script Compare-UserJS.bat from the same folder as the PS script. It works as a launcher that bypasses the PS execution policy. Saves you opening the CLI, CD'ing and typing in the command, but Compare-UserJS will still have you type in the paths of the two user.js files unless you drag and drop them to the BAT directly. Compare-UserJS will still NOT make you coffee, though.

## Parameters

**Index** | **Name** | **Required?** | **Default** | **Description**
:---: | :---: | :---: | :---: | ---
0 | `filePath_A` | Yes |  | Path to the first file to compare. Can be absolute or relative.
1 | `filePath_B` | Yes |  | Path to the second file to compare. Can also be relative.
2 | `ouputFile` | No | *userJS_diff.log* | Path to the file where the report will be dumped. Can be relative.
3 | `append` | No | false | Append the report to the end of the file, instead of rewriting if a file by that name exists.
4 | `noCommentsA` | No | false | Parse JS comments in file A as code (not as comments). Makes parsing faster when you know beforehand that file A doesn't have inactive prefs.
5 | `noCommentsB` | No | false | Parse JS comments in file B as code.
6 | `hideMask` | No | 0 | Bitmask value for hiding parts of the report selectively. See the embedded help info for details.
7 | `inJS` | No | false | Get the report written in JavaScript. It will be written to *userJS_diff.js* unless the `-outputFile` parameter is specified.

<br>
<details><summary> Click to see what the output looks like (v1.4.1). :point_left: </summary><p>

```
:::::::::::: { Compare-UserJS Report } ::::::::::::

(date removed)

  Summary:
  592 unique prefs in ghacks.js
  305 unique prefs in pk.js

  136 matching prefs, both value and state (active/inactive)
   13 prefs with different values but matching state
   78 prefs not declared in ghacks.js
  365 prefs not declared in pk.js
   57 prefs with matching values but inactive in ghacks.js
    4 prefs with matching values but inactive in pk.js
   17 prefs with both mismatching values and states
 ----
  670 combined unique prefs

 Reference: [i] = inactive pref (commented-out)

------------------------------------------------------------------------------
 The following 136 prefs match in both value and state:

    app.shield.optoutstudies.enabled                                  false
    beacon.enabled                                                    false
    breakpad.reportURL                                                ""
    browser.cache.disk.enable                                         false
    browser.cache.disk_cache_ssl                                      false
[i] browser.cache.memory.enable                                       false
    browser.crashReports.unsubmittedCheck.enabled                     false
    browser.display.use_document_fonts                                0
    browser.download.folderList                                       2
    browser.download.useDownloadDir                                   false
    browser.fixup.alternate.enabled                                   false
    browser.fixup.hide_user_pass                                      true
    browser.formfill.enable                                           false
    browser.helperApps.deleteTempFileOnExit                           true
    browser.newtab.preload                                            false
    browser.newtabpage.enabled                                        false
    browser.pagethumbnails.capturing_disabled                         true
    browser.safebrowsing.downloads.remote.enabled                     false
    browser.search.countryCode                                        "US"
    browser.search.geoip.url                                          ""
    browser.search.geoSpecificDefaults                                false
    browser.search.region                                             "US"
    browser.search.suggest.enabled                                    false
    browser.search.update                                             false
    browser.send_pings                                                false
    browser.send_pings.require_same_host                              true
    browser.sessionstore.privacy_level                                2
    browser.shell.checkDefaultBrowser                                 false
    browser.shell.shortcutFavicons                                    false
    browser.ssl_override_behavior                                     1
    browser.tabs.crashReporting.sendReport                            false
    browser.uitour.enabled                                            false
    browser.urlbar.autocomplete.enabled                               false
    browser.urlbar.autoFill                                           false
    browser.urlbar.autoFill.typed                                     false
    browser.urlbar.filter.javascript                                  true
    browser.urlbar.suggest.history                                    false
    browser.urlbar.suggest.searches                                   false
    browser.urlbar.trimURLs                                           false
    datareporting.healthreport.uploadEnabled                          false
    datareporting.policy.dataSubmissionEnabled                        false
    devtools.chrome.enabled                                           false
    devtools.debugger.remote-enabled                                  false

... <snip>

------------------------------------------------------------------------------
 The following 13 prefs have different values, but matching state:

    browser.aboutHomeSnippets.updateUrl                                
        ghacks.js     "data:,"
        pk.js         ""
    extensions.blocklist.url                                           
        ghacks.js     "https://blocklists.settings.services.mozilla.com/v1/blocklist/3/%APP_ID%/%APP_VERSION%/"
        pk.js         "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/"
[i] general.useragent.override                                         
        ghacks.js     "Mozilla/5.0 (Windows NT 6.1; rv:52.0) Gecko/20100101 Firefox/52.0"
        pk.js         "Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/20100101 Firefox/45.0"
    media.gmp-manager.url                                              
        ghacks.js     "data:text/plain,"
        pk.js         ""
    network.cookie.cookieBehavior                                      
        ghacks.js     2
        pk.js         1
    network.http.referer.spoofSource                                   
        ghacks.js     false
        pk.js         true
    pdfjs.disabled                                                     
        ghacks.js     false
        pk.js         true
    privacy.clearOnShutdown.cookies                                    
        ghacks.js     false
        pk.js         true
    privacy.cpd.cookies                                                
        ghacks.js     false
        pk.js         true
    security.dialog_enable_delay                                       
        ghacks.js     700
        pk.js         1000
    security.password_lifetime                                         
        ghacks.js     5
        pk.js         1
    security.tls.version.min                                           
        ghacks.js     3
        pk.js         1
[i] xpinstall.signatures.required                                      
        ghacks.js     false
        pk.js         true


------------------------------------------------------------------------------
 The following 78 prefs are not declared in ghacks.js:

    browser.download.manager.retention                                0
    browser.formfill.expire_days                                      0
    browser.newtab.url                                                "about:blank"
    browser.newtabpage.activity-stream.feeds.section.topstories       false
    browser.offline-apps.notify                                       true
    browser.startup.homepage_override.buildID                         20100101
    devtools.debugger.force-local                                     true
    dom.mozTCPSocket.enabled                                          false
    media.webspeech.recognition.enable                                false
    network.dns.blockDotOnion                                         true
[i] network.http.keep-alive.timeout                                   15
    network.negotiate-auth.allow-insecure-ntlm-v1                     false
[i] network.negotiate-auth.allow-insecure-ntlm-v1-https               false
    network.protocol-handler.expose.about                             true
    network.protocol-handler.expose.blob                              true
    network.protocol-handler.expose.chrome                            true
    network.protocol-handler.expose.data                              true
    network.protocol-handler.expose.file                              true
    network.protocol-handler.expose.ftp                               true
    network.protocol-handler.expose.http                              true
    network.protocol-handler.expose.https                             true
    network.protocol-handler.expose.javascript                        true
    network.protocol-handler.expose.moz-extension                     true
	
... <snip>

------------------------------------------------------------------------------
 The following 365 prefs are not declared in pk.js:

    _user.js.parrot                                                   "SUCCESS: No no he's not dead, he's, he's restin'!"
    accessibility.force_disabled                                      1
[i] accessibility.typeaheadfind                                       true
    alerts.showFavicons                                               false
    app.normandy.api_url                                              ""
    app.normandy.enabled                                              false
    app.update.service.enabled                                        false
    app.update.silent                                                 false
    app.update.staging.enabled                                        false
[i] browser.backspace_action                                          2
[i] browser.bookmarks.showRecentlyBookmarked                          false
    browser.cache.disk.capacity                                       0
    browser.cache.disk.smart_size.enabled                             false
    browser.cache.disk.smart_size.first_run                           false
    browser.cache.frecency_experiment                                 -1
[i] browser.cache.memory.capacity                                     0
    browser.cache.offline.insecure.enable                             false
    browser.chrome.errorReporter.enabled                              false
    browser.chrome.errorReporter.submitUrl                            ""
[i] browser.chrome.favicons                                           false
[i] browser.chrome.site_icons                                         false
    browser.crashReports.unsubmittedCheck.autoSubmit                  false
    browser.crashReports.unsubmittedCheck.autoSubmit2                 false
[i] browser.ctrlTab.previews                                          true
[i] browser.download.autohideButton                                   false
    browser.download.forbid_open_with                                 true
    browser.download.hide_plugins_without_extensions                  false
    browser.download.manager.addToRecentDocs                          false
    browser.eme.ui.enabled                                            false
[i] browser.formautofill.enabled                                      false
[i] browser.formfill.saveHttpsForms                                   false
[i] browser.fullscreen.animate                                        false
[i] browser.history.allowPopState                                     false
[i] browser.history.allowPushState                                    false
[i] browser.history.allowReplaceState                                 false
    browser.library.activity-stream.enabled                           false
    browser.link.open_newwindow                                       3
    browser.link.open_newwindow.restriction                           0
[i] browser.newtabpage.introShown                                     true
    browser.onboarding.enabled                                        false
    browser.ping-centre.telemetry                                     false
[i] browser.pocket.api                                                ""
[i] browser.pocket.oAuthConsumerKey                                   ""
[i] browser.pocket.site                                               ""
[i] browser.polaris.enabled                                           false
[i] browser.safebrowsing.allowOverride                                false
[i] browser.safebrowsing.appRepURL                                    ""
[i] browser.safebrowsing.downloads.enabled                            false
[i] browser.safebrowsing.downloads.remote.block_dangerous             false
[i] browser.safebrowsing.downloads.remote.block_dangerous_host        false
[i] browser.safebrowsing.downloads.remote.block_potentially_unwanted  false
[i] browser.safebrowsing.downloads.remote.block_uncommon              false
    browser.safebrowsing.downloads.remote.url                         ""
[i] browser.safebrowsing.gethashURL                                   ""
[i] browser.safebrowsing.malware.reportURL                            ""
[i] browser.safebrowsing.provider.google.appRepURL                    ""
[i] browser.safebrowsing.provider.google.gethashURL                   ""
    browser.safebrowsing.provider.google.reportMalwareMistakeURL      ""
	
...<snip>

------------------------------------------------------------------------------
 The following 57 prefs match but are inactive in ghacks.js:

    browser.cache.offline.enable                                      false
    browser.casting.enabled                                           false
    browser.newtabpage.activity-stream.enabled                        false
    browser.newtabpage.enhanced                                       false
    browser.pocket.enabled                                            false
    browser.privatebrowsing.autostart                                 true
    browser.selfsupport.url                                           ""
    camera.control.face_detection.enabled                             false
    clipboard.autocopy                                                false
    datareporting.healthreport.service.enabled                        false
    device.sensors.enabled                                            false
    devtools.webide.autoinstallFxdtAdapters                           false
    dom.archivereader.enabled                                         false
    dom.battery.enabled                                               false
    dom.enable_performance                                            false
    dom.enable_resource_timing                                        false
    dom.enable_user_timing                                            false
    dom.flyweb.enabled                                                false
    dom.gamepad.enabled                                               false
    dom.maxHardwareConcurrency                                        2
    dom.netinfo.enabled                                               false
    dom.network.enabled                                               false
    dom.telephony.enabled                                             false
    dom.vr.enabled                                                    false
    dom.workers.enabled                                               false
    experiments.enabled                                               false
    experiments.manifest.uri                                          ""
    experiments.supported                                             false
    extensions.shield-recipe-client.enabled                           false
    general.buildID.override                                          20100101
    geo.enabled                                                       false
    intl.locale.matchOS                                               false
    loop.logDomains                                                   false
    media.video_stats.enabled                                         false
    media.webspeech.synth.enabled                                     false
    network.jar.open-unsafe-types                                     false
    network.manage-offline-status                                     false
    places.history.enabled                                            false
    privacy.clearOnShutdown.openWindows                               true
    privacy.cpd.downloads                                             true
    privacy.trackingprotection.enabled                                true
    privacy.trackingprotection.pbmode.enabled                         true
    privacy.userContext.enabled                                       true
    security.ssl3.dhe_rsa_aes_128_sha                                 false
    security.ssl3.dhe_rsa_aes_256_sha                                 false
    security.ssl3.ecdhe_ecdsa_aes_128_sha                             false
    security.ssl3.ecdhe_ecdsa_rc4_128_sha                             false
    security.ssl3.ecdhe_rsa_aes_128_sha                               false
    security.ssl3.ecdhe_rsa_rc4_128_sha                               false
    security.ssl3.rsa_des_ede3_sha                                    false
    security.ssl3.rsa_rc4_128_md5                                     false
    security.ssl3.rsa_rc4_128_sha                                     false
    security.tls.unrestricted_rc4_fallback                            false
    security.xpconnect.plugin.unrestricted                            false
    signon.rememberSignons                                            false
    svg.disabled                                                      true
    webgl.enable-debug-renderer-info                                  false


------------------------------------------------------------------------------
 The following 4 prefs match but are inactive in pk.js:

    dom.disable_beforeunload                                          true
    media.gmp-provider.enabled                                        false
    pdfjs.enableWebGL                                                 false
    privacy.donottrackheader.enabled                                  true


------------------------------------------------------------------------------
 The following 17 prefs have both mismatching values and states:

    app.update.auto                                                    
        ghacks.js     false
[i]     pk.js         true
    app.update.enabled                                                 
[i]     ghacks.js     false
        pk.js         true
    browser.bookmarks.max_backups                                      
[i]     ghacks.js     2
        pk.js         0
    browser.newtabpage.directory.ping                                  
[i]     ghacks.js     "data:text/plain,"
        pk.js         ""
    browser.newtabpage.directory.source                                
[i]     ghacks.js     "data:text/plain,"
        pk.js         "data:text/plain,{}"
    browser.safebrowsing.blockedURIs.enabled                           
[i]     ghacks.js     false
        pk.js         true
    browser.safebrowsing.enabled                                       
[i]     ghacks.js     false
        pk.js         true
    browser.safebrowsing.malware.enabled                               
[i]     ghacks.js     false
        pk.js         true
    browser.safebrowsing.phishing.enabled                              
[i]     ghacks.js     false
        pk.js         true
    extensions.update.enabled                                          
[i]     ghacks.js     false
        pk.js         true
    geo.wifi.logging.enabled                                           
[i]     ghacks.js     true
        pk.js         false
    network.cookie.lifetimePolicy                                      
[i]     ghacks.js     0
        pk.js         2
    network.http.referer.XOriginPolicy                                 
        ghacks.js     1
[i]     pk.js         2
    plugins.update.notifyUser                                          
[i]     ghacks.js     false
        pk.js         true
    security.ssl3.rsa_aes_128_sha                                      
[i]     ghacks.js     false
        pk.js         true
    security.ssl3.rsa_aes_256_sha                                      
[i]     ghacks.js     false
        pk.js         true
    signon.storeWhenAutocompleteOff                                    
        ghacks.js     true
[i]     pk.js         false


```

</p></details>
<br><br>

## F.A.Q. <sup>(assuming it counts when I'm the one asking)</sup>

#### Q: Why the heck did you make this?
A: Firstly, to prove myself that I can produce nearly-awe-inducing garbage in under 200 lines of code (I wish). Secondly, I have some shit to compare. Thirdly, I'm hooked on regular expressions.
