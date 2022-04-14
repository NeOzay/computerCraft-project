--- Allows accessing the internet through HTTP requests.
---@class http
_G.http = { }
--- Asynchronously sends an HTTP request.
---@param url string @ The URL to send the request to
---@param postData string @ Any data to send in a POST request, set to nil to send a GET request (optional)
---@param headers table @ The headers to set in the request (optional)
---@param binary boolean @ Whether to send a binary request (optional) (CC 1.8+)
---@param redirect boolean @ Whether to automatically redirect on HTTP 300 responses (optional) (CC 1.8+)
function http.request(url, postData, headers, binary, redirect) end

--- Synchronously sends an HTTP GET request, and returns a file handle.
---@param url string @ The URL to send the request to
---@param headers table @ The headers to set in the request (optional)
---@param binary boolean @ Whether to send a binary request (optional) (CC 1.8+)
---@param redirect boolean @ Whether to automatically redirect on HTTP 300 responses (optional) (CC 1.8+)
---@return table | nil, string, table | nil
function http.get(url, headers, binary, redirect) end

--- Synchronously sends an HTTP POST request, and returns a file handle.
---@param url string @ The URL to send the request to
---@param postData string @ The data to send
---@param headers table @ The headers to set in the request (optional)
---@param binary boolean @ Whether to send a binary request (optional) (CC 1.8+)
---@param redirect boolean @ Whether to automatically redirect on HTTP 300 responses (optional) (CC 1.8+)
---@return table | nil, string, table | nil
function http.post(url, postData, headers, binary, redirect) end

--- Checks if a URL is valid and in the whitelist.
---@param url string @ The URL to check
---@return boolean, string | nil
function http.checkURL(url) end

--- Asynchronously hecks if a URL is valid and in the whitelist.
---@param url string @ The URL to check
function http.checkURLAsync(url) end

--- Opens a websocket. (CC:T)
---@param url string @ The URL to connect to
---@param headers table @ Any headers to send in the HTTP request
---@return table | nil, string
function http.websocket(url, headers) end

--- Asynchronously opens a websocket. (CC:T)
---@param url string @ The URL to connect to
---@param headers table @ Any headers to send in the HTTP request
function http.websocketAsync(url, headers) end

