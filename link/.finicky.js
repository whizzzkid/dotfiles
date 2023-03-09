module.exports = {
  defaultBrowser: "Firefox",      
  handlers: [
    {
      match: /^https?:\/\/.*gusto.*$/,
      browser: {
        name: "Google Chrome",
        profile: "Profile 3"
      }
    }
  ]
}
