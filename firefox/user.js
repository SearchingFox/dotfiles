user_pref("browser.ping-centre.telemetry", false);
// PREF: Disable Mozilla telemetry/experiments
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
// PREF: Disable collection/sending of the health report (healthreport.sqlite*)
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
// "Allow Firefox to make personalized extension recommendations"
user_pref("browser.discovery.enabled", false);
// PREF: Disable Shield/Heartbeat/Normandy (Mozilla user rating telemetry)
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
// PREF: Disable Extension recommendations (Firefox >= 65)
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
// PREF: Disable Pocket
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);
// PREF: Disable "Recommended by Pocket" in Firefox Quantum
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
// PREF: Disable Location-Aware Browsing (geolocation)
user_pref("geo.enabled", false);
// PREF: When geolocation is enabled, use Mozilla geolocation service instead of Google
user_pref("geo.wifi.uri", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
// PREF: When geolocation is enabled, don't log geolocation requests to the console
user_pref("geo.wifi.logging.enabled", false);


user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.loadDivertedInBackground", true);
user_pref("dom.push.enabled", false);
user_pref("dom.webnotifications.enabled", false);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("general.autoScroll", false);
// user_pref("media.autoplay.blocking_policy", 2);
user_pref("media.autoplay.default", 5);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
