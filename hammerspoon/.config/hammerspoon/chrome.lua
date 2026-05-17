local module = {}

module.jump = function(url)
	local _success, object, _output = hs.osascript.javascript([[
  (function() {
    var chrome = Application('Google Chrome');
    chrome.activate();

    for (win of chrome.windows()) {
      var tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/]] .. url .. [[/));

      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;
        return true;
      }
      else {
        return false;
      }
    }
  })();
  ]])
	return object
end

module.killTabsByDomain = function(domain)
	hs.osascript.javascript([[
  (function() {
    var chrome = Application('Google Chrome');

    for (win of chrome.windows()) {
      for (tab of win.tabs()) {
        if (tab.url().match(/]] .. string.gsub(domain, "/", "\\/") .. [[/)) {
          tab.close()
        }
      }
    }
  })();
  ]])
end

return module
