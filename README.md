# Compare-UserJS

No idea what user.js is? Read [this article](https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences). For enhanced privacy and security I use (and recommend) the [ghacks-user.js](https://github.com/ghacksuserjs/ghacks-user.js).

Requires only PS v2+, which comes pre-installed on Windows 7, but it *should* also run fine on Unix-like systems.

Compare-UserJS uses my own elegant <sup>[<i>Citation needed.</i>]</sup>  algorithm for parsing JavaScript half-assedly, and by default logs the results to userJS_diff.log.

Things detected (and reported) by this script:

- matching prefs, both value and state (active/inactive)
- prefs with different values but same matching state
- prefs declared in file A that are not declared in file B
- prefs declared in file B that are not declared in file A
- prefs declared within JS comments (inactive) in A but active in B
- prefs declared within JS comments (inactive) in B but active in A

Additionally, it can catch one type of syntax error when declaring prefs, and includes that information in the report.

## Usage

Simply save this script wherever you want, launch the PowerShell CLI, [CD to that folder](https://ss64.com/ps/set-location.html), and run it with:

```PowerShell
.\Compare-UserJS
```

If you're a PowerShell virgin and you still don't have a clue what I am talking about, don't freak out (been there, done that) and just keep reading. There is an alternative below. If you're the reader type, [read this](https://ss64.com/ps/syntax-run.html).

The script will prompt you to enter the paths of the two user.js files to compare. Keep in mind that the actual names of the files don't matter, I only refer to them as *user.js* because that's what their names have to be when... OMG am I really explaining this?

See the embedded help info with:

```PowerShell
Get-Help .\Compare-UserJS -full
```

Or just read it from the file, but that's less thrilling.

If you don't want to type that much (and you're on Windows), you can alternatively run the batch script Compare-UserJS.bat from the same folder as the PS script. It works as a launcher that bypasses the PS execution policy. Saves you opening the CLI, CD'ing and typing in the command, but Compare-UserJS will still have you type in the paths of the user.js files (sorry). Compare-UserJS will also NOT make your coffee.

If you intend to use this script regularly (I don't see why you wouldn't), you can also pass the paths of the two files to Compare-UserJS as parameters.

## Parameters

**Index** | **Name** | **Default** | **Description**
--- | --- | --- | ---
0 | filePath_A |  | Path to the first file to compare. Can be absolute or relative.
1 | filePath_B |  | Path to the second file to compare. Can also be relative.
2 | ouputFile | userJS_diff.log | Path to the file where the report will be dumped. Can be relative.
3 | append |  | Append the report to the end of the file, instead of rewriting if a file by that name exists.
4 | noCommentsA |  | Parse JS comments in file A as code (not as comments). Makes parsing faster when you know beforehand that file A doesn't have inactive prefs.
5 | noCommentsB |  | Parse JS comments in file B as code.
6 | hideMask | 0 | Bitmask value for hiding parts of the report selectively. See the embedded help info for details.

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
    devtools.webide.autoinstallADBHelper                              false
    devtools.webide.enabled                                           false
    dom.allow_cut_copy                                                false
    dom.event.clipboardevents.enabled                                 false
[i] dom.event.contextmenu.enabled                                     false
[i] dom.indexedDB.enabled                                             false
    dom.ipc.plugins.flash.subprocess.crashreporter.enabled            false
    dom.ipc.plugins.reportCrashURL                                    false
    dom.serviceWorkers.enabled                                        false
[i] dom.storage.enabled                                               false
    dom.vibrator.enabled                                              false
    dom.webaudio.enabled                                              false
    dom.webnotifications.enabled                                      false
    extensions.blocklist.enabled                                      true
    extensions.getAddons.cache.enabled                                false
    extensions.pocket.enabled                                         false
[i] general.appname.override                                          "Netscape"
[i] general.appversion.override                                       "5.0 (Windows)"
[i] general.oscpu.override                                            "Windows NT 6.1"
[i] general.platform.override                                         "Win32"
    geo.wifi.uri                                                      "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"
    gfx.font_rendering.opentype_svg.enabled                           false
    intl.accept_languages                                             "en-US, en"
    javascript.options.asmjs                                          false
    javascript.use_us_english_locale                                  true
    keyword.enabled                                                   false
    layout.css.visited_links_enabled                                  false
    lightweightThemes.update.enabled                                  false
[i] loop.enabled                                                      false
    media.getusermedia.audiocapture.enabled                           false
    media.getusermedia.screensharing.enabled                          false
    media.gmp-gmpopenh264.enabled                                     false
    media.navigator.enabled                                           false
    media.navigator.video.enabled                                     false
    media.peerconnection.enabled                                      false
    media.peerconnection.ice.default_address_only                     true
    media.peerconnection.ice.no_host                                  true
    network.allow-experiments                                         false
    network.captive-portal-service.enabled                            false
    network.cookie.thirdparty.sessionOnly                             true
    network.dns.disablePrefetch                                       true
    network.dns.disablePrefetchFromHTTPS                              true
    network.http.speculative-parallel-limit                           0
    network.IDN_show_punycode                                         true
    network.predictor.enabled                                         false
    network.prefetch-next                                             false
    network.proxy.socks_remote_dns                                    true
    plugin.state.flash                                                0
    plugin.state.java                                                 0
    plugins.click_to_play                                             true
    privacy.clearOnShutdown.cache                                     true
    privacy.clearOnShutdown.downloads                                 true
    privacy.clearOnShutdown.formdata                                  true
    privacy.clearOnShutdown.history                                   true
    privacy.clearOnShutdown.offlineApps                               true
    privacy.clearOnShutdown.sessions                                  true
    privacy.cpd.cache                                                 true
    privacy.cpd.formdata                                              true
    privacy.cpd.history                                               true
    privacy.cpd.offlineApps                                           true
    privacy.cpd.sessions                                              true
    privacy.firstparty.isolate                                        true
    privacy.resistFingerprinting                                      true
    privacy.sanitize.sanitizeOnShutdown                               true
    privacy.sanitize.timeSpan                                         0
    security.ask_for_password                                         2
    security.cert_pinning.enforcement_level                           2
    security.csp.enable                                               true
    security.csp.experimentalEnabled                                  true
    security.insecure_field_warning.contextual.enabled                true
    security.insecure_password.ui.enabled                             true
    security.mixed_content.block_active_content                       true
    security.mixed_content.block_display_content                      true
    security.OCSP.enabled                                             1
    security.OCSP.require                                             true
    security.pki.sha1_enforcement_level                               1
    security.ssl.disable_session_identifiers                          true
    security.ssl.enable_ocsp_stapling                                 true
    security.ssl.errorReporting.automatic                             false
[i] security.ssl.require_safe_negotiation                             true
    security.ssl.treat_unsafe_negotiation_as_broken                   true
    security.tls.version.fallback-limit                               3
    security.tls.version.max                                          4
    services.blocklist.update_enabled                                 true
    signon.autofillForms                                              false
    signon.autofillForms.http                                         false
    signon.formlessCapture.enabled                                    false
    toolkit.telemetry.enabled                                         false
    toolkit.telemetry.unified                                         false
    webgl.disabled                                                    true
    webgl.disable-extensions                                          true
    webgl.disable-fail-if-major-performance-caveat                    true
    webgl.min_capability_mode                                         true


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
    network.protocol-handler.expose-all                               false
    network.protocol-handler.external.about                           false
    network.protocol-handler.external.blob                            false
    network.protocol-handler.external.chrome                          false
    network.protocol-handler.external.data                            false
    network.protocol-handler.external.file                            false
    network.protocol-handler.external.ftp                             false
    network.protocol-handler.external.http                            false
    network.protocol-handler.external.https                           false
    network.protocol-handler.external.javascript                      false
    network.protocol-handler.external.moz-extension                   false
    network.protocol-handler.warn-external-default                    true
    network.stricttransportsecurity.preloadlist                       true
    plugin.state.libgnome-shell-browser-plugin                        0
    security.fileuri.strict_origin_policy                             true
    security.sri.enable                                               true
    security.ssl.enable_ocsp_must_staple                              true
    security.ssl3.dhe_dss_aes_128_sha                                 false
    security.ssl3.dhe_dss_aes_256_sha                                 false
    security.ssl3.dhe_dss_camellia_128_sha                            false
    security.ssl3.dhe_dss_camellia_256_sha                            false
    security.ssl3.dhe_dss_des_ede3_sha                                false
    security.ssl3.dhe_rsa_camellia_128_sha                            false
    security.ssl3.dhe_rsa_camellia_256_sha                            false
    security.ssl3.dhe_rsa_des_ede3_sha                                false
    security.ssl3.ecdh_ecdsa_aes_128_sha                              false
    security.ssl3.ecdh_ecdsa_aes_256_sha                              false
    security.ssl3.ecdh_ecdsa_des_ede3_sha                             false
    security.ssl3.ecdh_ecdsa_null_sha                                 false
    security.ssl3.ecdh_ecdsa_rc4_128_sha                              false
    security.ssl3.ecdh_rsa_aes_128_sha                                false
    security.ssl3.ecdh_rsa_aes_256_sha                                false
    security.ssl3.ecdh_rsa_des_ede3_sha                               false
    security.ssl3.ecdh_rsa_null_sha                                   false
    security.ssl3.ecdh_rsa_rc4_128_sha                                false
    security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256                      true
    security.ssl3.ecdhe_ecdsa_aes_256_sha                             true
    security.ssl3.ecdhe_ecdsa_chacha20_poly1305_sha256                true
    security.ssl3.ecdhe_ecdsa_des_ede3_sha                            false
    security.ssl3.ecdhe_ecdsa_null_sha                                false
    security.ssl3.ecdhe_rsa_aes_128_gcm_sha256                        true
    security.ssl3.ecdhe_rsa_aes_256_sha                               true
    security.ssl3.ecdhe_rsa_chacha20_poly1305_sha256                  true
    security.ssl3.ecdhe_rsa_des_ede3_sha                              false
    security.ssl3.ecdhe_rsa_null_sha                                  false
    security.ssl3.rsa_1024_rc4_56_sha                                 false
    security.ssl3.rsa_camellia_128_sha                                false
    security.ssl3.rsa_camellia_256_sha                                false
    security.ssl3.rsa_fips_des_ede3_sha                               false
    security.ssl3.rsa_null_md5                                        false
    security.ssl3.rsa_null_sha                                        false
    security.ssl3.rsa_rc2_40_md5                                      false
    security.ssl3.rsa_rc4_40_md5                                      false
    security.ssl3.rsa_seed_sha                                        false
    shumway.disabled                                                  true


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
    browser.safebrowsing.provider.google.reportPhishMistakeURL        ""
    browser.safebrowsing.provider.google.reportURL                    ""
[i] browser.safebrowsing.provider.google.updateURL                    ""
    browser.safebrowsing.provider.google4.dataSharing.enabled         false
    browser.safebrowsing.provider.google4.dataSharingURL              ""
[i] browser.safebrowsing.provider.google4.gethashURL                  ""
    browser.safebrowsing.provider.google4.reportMalwareMistakeURL     ""
    browser.safebrowsing.provider.google4.reportPhishMistakeURL       ""
    browser.safebrowsing.provider.google4.reportURL                   ""
[i] browser.safebrowsing.provider.google4.updateURL                   ""
[i] browser.safebrowsing.provider.mozilla.gethashURL                  ""
[i] browser.safebrowsing.provider.mozilla.updateURL                   ""
[i] browser.safebrowsing.reportErrorURL                               ""
[i] browser.safebrowsing.reportGenericURL                             ""
[i] browser.safebrowsing.reportMalwareErrorURL                        ""
[i] browser.safebrowsing.reportMalwareMistakeURL                      ""
[i] browser.safebrowsing.reportMalwareURL                             ""
[i] browser.safebrowsing.reportPhishMistakeURL                        ""
    browser.safebrowsing.reportPhishURL                               ""
[i] browser.safebrowsing.reportURL                                    ""
[i] browser.safebrowsing.updateURL                                    ""
    browser.search.geoSpecificDefaults.url                            ""
[i] browser.search.showOneOffButtons                                  false
[i] browser.selfsupport.enabled                                       false
    browser.sessionhistory.max_entries                                10
[i] browser.sessionhistory.max_total_viewers                          0
    browser.sessionstore.interval                                     30000
    browser.sessionstore.max_tabs_undo                                0
    browser.sessionstore.max_windows_undo                             0
[i] browser.sessionstore.privacy_level_deferred                       2
    browser.sessionstore.resume_from_crash                            false
[i] browser.startup.homepage                                          "https://www.example.com/"
[i] browser.startup.homepage_override.mstone                          "ignore"
[i] browser.startup.page                                              0
[i] browser.tabs.animate                                              false
[i] browser.tabs.closeWindowWithLastTab                               false
[i] browser.tabs.loadBookmarksInTabs                                  true
    browser.tabs.remote.allowLinkedWebInFileUriProcess                false
[i] browser.tabs.warnOnClose                                          false
[i] browser.tabs.warnOnCloseOtherTabs                                 false
[i] browser.tabs.warnOnOpen                                           false
    browser.taskbar.lists.enabled                                     false
    browser.taskbar.lists.frequent.enabled                            false
    browser.taskbar.lists.recent.enabled                              false
    browser.taskbar.lists.tasks.enabled                               false
    browser.taskbar.previews.enable                                   false
[i] browser.trackingprotection.gethashURL                             ""
[i] browser.trackingprotection.updateURL                              ""
    browser.uitour.url                                                ""
[i] browser.urlbar.decodeURLsOnCopy                                   true
    browser.urlbar.maxHistoricalSearchSuggestions                     0
[i] browser.urlbar.maxRichResults                                     0
    browser.urlbar.oneOffSearches                                     false
    browser.urlbar.speculativeConnect.enabled                         false
    browser.urlbar.suggest.bookmark                                   false
    browser.urlbar.suggest.openpage                                   false
[i] browser.urlbar.unifiedcomplete                                    false
    browser.urlbar.usepreloadedtopurls.enabled                        false
    browser.urlbar.userMadeSearchSuggestionsChoice                    true
[i] browser.usedOnWindows10.introURL                                  ""
    browser.xul.error_pages.expert_bad_cert                           true
[i] browser.zoom.siteSpecific                                         false
[i] camera.control.autofocus_moving_callback.enabled                  false
    canvas.capturestream.enabled                                      false
    captivedetect.canonicalURL                                        ""
[i] datareporting.healthreport.about.reportUrl                        "data:text/plain,"
[i] datareporting.healthreport.about.reportUrlUnified                 "data:text/plain,"
[i] datareporting.healthreport.documentServerURI                      ""
[i] datareporting.policy.dataSubmissionEnabled.v2                     false
[i] dom.beforeAfterKeyboardEvent.enabled                              false
    dom.caches.enabled                                                false
[i] dom.disable_image_src_set                                         true
    dom.disable_open_during_load                                      true
    dom.disable_window_move_resize                                    true
    dom.disable_window_open_feature.close                             true
    dom.disable_window_open_feature.location                          true
    dom.disable_window_open_feature.menubar                           true
    dom.disable_window_open_feature.minimizable                       true
    dom.disable_window_open_feature.personalbar                       true
    dom.disable_window_open_feature.resizable                         true
[i] dom.disable_window_open_feature.scrollbars                        true
    dom.disable_window_open_feature.status                            true
    dom.disable_window_open_feature.titlebar                          true
    dom.disable_window_open_feature.toolbar                           true
[i] dom.disable_window_status_change                                  true
[i] dom.idle-observers-api.enabled                                    false
    dom.imagecapture.enabled                                          false
    dom.IntersectionObserver.enabled                                  false
[i] dom.keyboardevent.code.enabled                                    false
    dom.popup_allowed_events                                          "click dblclick"
    dom.popup_maximum                                                 3
    dom.push.connection.enabled                                       false
    dom.push.enabled                                                  false
    dom.push.serverURL                                                ""
[i] dom.push.udp.wakeupEnabled                                        false
    dom.push.userAgentID                                              ""
[i] dom.storageManager.enabled                                        false
[i] dom.vr.oculus050.enabled                                          false
    dom.w3c_pointer_events.enabled                                    false
[i] dom.w3c_touch_events.enabled                                      0
    dom.webnotifications.serviceworker.enabled                        false
[i] dom.workers.sharedWorkers.enabled                                 false
[i] experiments.activeExperiment                                      false
    extensions.autoDisableScopes                                      15
    extensions.enabledScopes                                          1
    extensions.formautofill.addresses.enabled                         false
    extensions.formautofill.available                                 "off"
    extensions.formautofill.creditCards.enabled                       false
[i] extensions.formautofill.experimental                              false
    extensions.formautofill.heuristics.enabled                        false
    extensions.getAddons.showPane                                     false
[i] extensions.screenshots.disabled                                   true
[i] extensions.screenshots.system-disabled                            true
[i] extensions.screenshots.upload-disabled                            true
[i] extensions.shield-recipe-client.api_url                           ""
[i] extensions.systemAddon.update.enabled                             false
[i] extensions.systemAddon.update.url                                 ""
    extensions.update.autoUpdateDefault                               false
    extensions.webcompat-reporter.enabled                             false
    extensions.webextensions.keepStorageOnUninstall                   false
    extensions.webextensions.keepUuidOnUninstall                      false
[i] extensions.webextensions.restrictedDomains                        ""
    extensions.webservice.discoverURL                                 ""
    font.blacklist.underline_offset                                   ""
[i] font.name.monospace.x-unicode                                     "Lucida Console"
[i] font.name.monospace.x-western                                     "Lucida Console"
[i] font.name.sans-serif.x-unicode                                    "Arial"
[i] font.name.sans-serif.x-western                                    "Arial"
[i] font.name.serif.x-unicode                                         "Georgia"
[i] font.name.serif.x-western                                         "Georgia"
[i] font.system.whitelist                                             ""
[i] full-screen-api.approval-required                                 false
    full-screen-api.enabled                                           false
[i] full-screen-api.warning.delay                                     0
[i] full-screen-api.warning.timeout                                   0
[i] general.autoScroll                                                false
[i] general.useragent.locale                                          "en-US"
    general.warnOnAboutConfig                                         false
[i] geo.security.allowinsecure                                        false
[i] gfx.direct2d.disabled                                             true
    gfx.downloadable_fonts.enabled                                    true
    gfx.downloadable_fonts.woff2.enabled                              false
    gfx.font_rendering.graphite.enabled                               false
    gfx.offscreencanvas.enabled                                       false
[i] identity.fxaccounts.enabled                                       false
    intl.locale.requested                                             "en-US"
    intl.regional_prefs.use_os_locales                                false
[i] javascript.options.baselinejit                                    false
[i] javascript.options.ion                                            false
    javascript.options.shared_memory                                  false
    javascript.options.wasm                                           false
    layers.acceleration.disabled                                      true
    layout.css.font-loading-api.enabled                               false
[i] layout.spellcheckDefault                                          2
[i] loop.facebook.appId                                               ""
[i] loop.facebook.enabled                                             false
[i] loop.facebook.fallbackUrl                                         ""
[i] loop.facebook.shareUrl                                            ""
[i] loop.feedback.formURL                                             ""
[i] loop.feedback.manualFormURL                                       ""
[i] loop.server                                                       ""
    mathml.disabled                                                   true
    media.autoplay.enabled                                            false
    media.block-autoplay-until-in-foreground                          true
[i] media.block-play-until-visible                                    true
[i] media.eme.apiVisible                                              false
[i] media.eme.chromium-api.enabled                                    false
    media.eme.enabled                                                 false
    media.getusermedia.browser.enabled                                false
[i] media.getusermedia.screensharing.allow_on_old_platforms           false
[i] media.getusermedia.screensharing.allowed_domains                  ""
    media.gmp.trial-create.enabled                                    false
[i] media.gmp-eme-adobe.autoupdate                                    false
[i] media.gmp-eme-adobe.enabled                                       false
[i] media.gmp-eme-adobe.visible                                       false
    media.gmp-gmpopenh264.autoupdate                                  false
    media.gmp-manager.updateEnabled                                   false
    media.gmp-manager.url.override                                    "data:text/plain,"
    media.gmp-widevinecdm.autoupdate                                  false
    media.gmp-widevinecdm.enabled                                     false
    media.gmp-widevinecdm.visible                                     false
[i] media.ondevicechange.enabled                                      false
    media.peerconnection.ice.tcp                                      false
    media.peerconnection.identity.enabled                             false
    media.peerconnection.identity.timeout                             1
    media.peerconnection.turn.disable                                 true
    media.peerconnection.use_document_iceservers                      false
    media.peerconnection.video.enabled                                false
    middlemouse.contentLoadURL                                        false
    network.auth.subresource-img-cross-origin-http-auth-allow         false
    network.cookie.leave-secure-alone                                 true
[i] network.cookie.lifetime.days                                      90
[i] network.cookie.same-site.enabled                                  true
    network.cookie.thirdparty.nonsecureSessionOnly                    true
[i] network.dns.disableIPv6                                           true
[i] network.dnsCacheEntries                                           400
[i] network.dnsCacheExpiration                                        60
    network.file.disable_unc_paths                                    true
[i] network.ftp.enabled                                               false
    network.http.altsvc.enabled                                       false
    network.http.altsvc.oe                                            false
    network.http.redirection-limit                                    10
    network.http.referer.defaultPolicy                                3
    network.http.referer.defaultPolicy.pbmode                         2
    network.http.referer.hideOnionSource                              true
    network.http.referer.trimmingPolicy                               0
[i] network.http.referer.userControlPolicy                            3
    network.http.referer.XOriginTrimmingPolicy                        0
    network.http.sendRefererHeader                                    2
[i] network.http.sendSecureXSiteReferrer                              false
    network.http.spdy.enabled                                         false
    network.http.spdy.enabled.deps                                    false
    network.http.spdy.enabled.http2                                   false
[i] network.http.spdy.enabled.http2draft                              false
[i] network.http.spdy.enabled.v3-1                                    false
[i] network.jar.block-remote-files                                    true
    network.predictor.enable-prefetch                                 false
    network.protocol-handler.external.ms-windows-store                false
    network.proxy.autoconfig_url.include_path                         false
[i] network.trr.bootstrapAddress                                      ""
[i] network.trr.mode                                                  0
[i] network.trr.uri                                                   ""
[i] network.websocket.enabled                                         false
    offline-apps.allow_by_default                                     false
[i] pageThumbs.enabled                                                false
[i] permissions.default.camera                                        2
[i] permissions.default.desktop-notification                          2
    permissions.default.geo                                           2
[i] permissions.default.microphone                                    2
[i] permissions.default.shortcuts                                     2
    permissions.manager.defaultsUrl                                   ""
[i] permissions.memory_only                                           true
[i] pfs.datasource.url                                                ""
    plugin.default.state                                              0
    plugin.defaultXpi.state                                           0
[i] plugin.scan.Acrobat                                               99999
    plugin.scan.plid.all                                              false
[i] plugin.scan.Quicktime                                             99999
[i] plugin.scan.WindowsMediaPlayer                                    99999
    plugin.sessionPermissionNow.intervalInMinutes                     0
[i] plugins.enumerable_names                                          ""
[i] plugins.update.url                                                ""
[i] privacy.clearOnShutdown.passwords                                 false
    privacy.clearOnShutdown.siteSettings                              false
[i] privacy.cpd.openWindows                                           true
    privacy.cpd.passwords                                             false
    privacy.cpd.siteSettings                                          false
[i] privacy.donottrackheader.value                                    1
    privacy.firstparty.isolate.restrict_opener_access                 true
    privacy.resistFingerprinting.block_mozAddonManager                true
[i] privacy.trackingprotection.annotate_channels                      false
[i] privacy.trackingprotection.lower_network_priority                 false
    privacy.trackingprotection.ui.enabled                             true
[i] privacy.usercontext.about_newtab_segregation.enabled              true
[i] privacy.userContext.longPressBehavior                             2
[i] privacy.userContext.ui.enabled                                    true
[i] privacy.window.maxInnerHeight                                     900
[i] privacy.window.maxInnerWidth                                      1600
[i] reader.parse-on-load.enabled                                      false
    security.csp.enable_violation_events                              false
    security.data_uri.block_toplevel_data_uri_navigations             true
    security.family_safety.mode                                       0
    security.insecure_connection_icon.enabled                         true
[i] security.insecure_connection_icon.pbmode.enabled                  true
    security.insecure_connection_text.enabled                         true
[i] security.insecure_connection_text.pbmode.enabled                  true
[i] security.mixed_content.send_hsts_priming                          false
[i] security.mixed_content.use_hsts                                   true
[i] security.nocertdb                                                 true
    security.ssl.errorReporting.enabled                               false
    security.ssl.errorReporting.url                                   ""
    security.tls.enable_0rtt_data                                     false
[i] security.tls.insecure_fallback_hosts.use_static_list              false
[i] services.blocklist.addons.collection                              ""
[i] services.blocklist.gfx.collection                                 ""
[i] services.blocklist.onecrl.collection                              ""
[i] services.blocklist.plugins.collection                             ""
    shield.savant.enabled                                             false
[i] social.directories                                                ""
[i] social.enabled                                                    false
[i] social.remote-install.enabled                                     false
[i] social.share.activationPanelEnabled                               false
[i] social.shareDirectory                                             ""
[i] social.toast-notifications.enabled                                false
[i] social.whitelist                                                  ""
[i] startup.homepage_override_url                                     ""
[i] startup.homepage_welcome_url                                      ""
[i] startup.homepage_welcome_url.additional                           ""
[i] toolkit.cosmeticAnimations.enabled                                false
    toolkit.telemetry.archive.enabled                                 false
    toolkit.telemetry.bhrPing.enabled                                 false
    toolkit.telemetry.cachedClientID                                  ""
    toolkit.telemetry.firstShutdownPing.enabled                       false
    toolkit.telemetry.hybridContent.enabled                           false
    toolkit.telemetry.newProfilePing.enabled                          false
    toolkit.telemetry.server                                          "data:,"
    toolkit.telemetry.shutdownPingSender.enabled                      false
[i] toolkit.telemetry.unifiedIsOptIn                                  true
    toolkit.telemetry.updatePing.enabled                              false
[i] ui.key.menuAccessKey                                              0
    ui.use_standins_for_native_colors                                 true
[i] urlclassifier.trackingTable                                       "test-track-simple,base-track-digest256"
[i] view_source.tab                                                   false
    webchannel.allowObject.urlWhitelist                               ""
    webgl.dxgl.enabled                                                false
    webgl.enable-webgl2                                               false
    xpinstall.whitelist.required                                      true


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

## F.A.Q. (assuming it counts when I'm the one questioning myself)

#### Q: Why the heck did you make this?
A: Firstly, to prove myself that I can produce nearly-awe-inducing garbage in under 200 lines of code (I wish). Secondly, I have some shit to compare. Thirdly, I'm hooked on regular expressions.
