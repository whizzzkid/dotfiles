module.exports = {
  defaultBrowser: "Firefox",      
  handlers: [
    {
      match: /^https?:\/\/.*gusto.*$/,
      browser: "Google Chrome"
    },
    {
      match: /^https?:\/\/.*ipfs.*$/,
      browser: "Google Chrome"
    }
  ]
}
