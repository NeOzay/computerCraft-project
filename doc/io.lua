--- Default Lua IO API
---@class io
_G.io = { }
--- Closes a file handle.
---@param file table @ The file to operate on (nil for default output file)
function io.close(file) end

--- Flushes the current output file.
function io.flush() end

--- Either opens a filename and sets the default input file handle, sets the defualt input handle to the handle passed in, or returns the current input handle.
---@param file string/table @ The file name or file handle to operate on, or nil to return the input file
---@return table/nil
function io.input(file) end

--- Returns an iterator function that returns each line in a file.
---@param filename string @ The filename to open, or nil for the default input file
---@return function
function io.lines(filename) end

--- Opens a file for reading or writing.
---@param filename string @ The file to open
---@param mode string @ The mode to open the file in (r/w/a) (optional)
---@return table/(nil, string)
function io.open(filename, mode) end

--- Either opens a filename and sets the default output file handle, sets the defualt output handle to the handle passed in, or returns the current output handle.
---@param file string/table @ The file name or file handle to operate on, or nil to return the output file
---@return table/nil
function io.output(file) end

--- Reads the next line from the input file.
---@vararg string @ *l for each line that will be read
---@return ...string/nil
function io.read(...) end

--- Returns "file" if obj is an open file, "closed file" if obj is a closed file, or nil.
---@param obj any @ The object to check
---@return string/nil
function io.type(obj) end

--- Writes a string or number to the default output.
---@param str string/number @ The string or number to write
function io.write(str) end

