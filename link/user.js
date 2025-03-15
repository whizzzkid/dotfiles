user_pref("browser.tabs.closeWindowWithLastTab", false);
user_pref("browser.tabs.groups.enabled", true);
user_pref("full-screen-api.ignore-widgets", true);
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.transition.timeout", 0);
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.tabs.closeTabByDblclick", true);

// zoom
user_pref("zoom.maxPercent", 400);
user_pref("zoom.minPercent", 10);

// image render
user_pref("image.mem.decode_bytes_at_a_time", 131072); // The speed of processing images (default=16384=16KB) (131072=128KB)

// block autoplay
user_pref("media.block-autoplay-until-in-foreground", true);
user_pref("media.block-play-until-document-interaction", true);
user_pref("media.block-play-until-visible", true);

// disable page thumbnail saves
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("pageThumbs.enabled", false);
user_pref("browser.shell.shortcutFavicons", false); // URL shortcut files use a cached .ico file (randomly named) which is stored in your profile/shortcutCache directory. The .ico remains after the shortcut is deleted. If set to false then the shortcuts use a generic Firefox icon

// memory access
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.memory.enable", true);
user_pref("browser.sessionstore.interval", 1000000); // (in milliseconds) default=15000=15sec, 300000=5min, 1200000=20min. This is only relevant to restoring the session in case of a crash. The session also gets saved independently at browser shutdown. (https://support.mozilla.org/en-US/questions/1257866)

// performance
user_pref("accessibility.force_disabled", 1); // Prevent accessibility services from accessing your browser and using RAM (1=always off)
user_pref("dom.ipc.processPriorityManager.backgroundUsesEcoQoS", false); // disable Efficiency Mode (throttling) for background Firefox processes in Windows 11

