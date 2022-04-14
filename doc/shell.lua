--- Interacts with the CraftOS shell - not available to APIs.
---@class shell
_G.shell = { }
--- Exits the current shell.
function shell.exit() end

--- Returns the current working directory.
---@return string
function shell.dir() end

--- Sets the current working directory.
---@param path string @ The directory to set
function shell.setDir(path) end

--- Returns the current PATH.
---@return string
function shell.path() end

--- Sets the current PATH.
---@param path string @ The PATH to set
function shell.setPath(path) end

--- Resolves a local path to an absolute path.
---@param localPath string @ The local path to resolve
---@return string
function shell.resolve(localPath) end

--- Returns the path to a program name.
---@param name string @ The name of the program
---@return string
function shell.resolveProgram(name) end

--- Returns a dictionary of aliases for programs.
---@return table
function shell.aliases() end

--- Sets an alias for a program.
---@param alias string @ The name of the alias
---@param program string @ The name of the program
function shell.setAlias(alias, program) end

--- Removes an alias.
---@param alias string @ The name of the alias
function shell.clearAlias(alias) end

--- Returns a list of all programs in the working directory and PATH.
---@param showHidden boolean @ Whether to show hidden programs
---@return table
function shell.programs(showHidden) end

--- Returns the absolute path to the current program.
---@return string
function shell.getRunningProgram() end

--- Runs a program/command.
---@param command string @ The command to run
---@vararg string @ Any arguments to pass to the program
---@return boolean
function shell.run(command, ...) end

--- Opens a program in a new tab. (1.6+, advanced)
---@param command string @ The command to run
---@vararg string @ Any arguments to pass to the program
---@return number
function shell.openTab(command, ...) end

--- Changes the current tab. (1.6+, advanced)
---@param tabID number @ The ID of the tab to switch to
function shell.switchTab(tabID) end

--- Returns a list of suffixes that could complete a prefix. (1.74+)
---@param prefix string @ The prefix to complete
---@return table
function shell.complete(prefix) end

--- Returns a list of suffixes that could complete a program prefix. (1.74+)
---@param prefix string @ The prefix to complete
---@return table
function shell.completeProgram(prefix) end

--- Registers a completion function that is called by shell.complete().
---@param path string @ The path that this will be called on
---@param completionFunction function @ The function to call
function shell.setCompletionFunction(path, completionFunction) end

--- Returns the table containing functions registered for shell.complete().
---@return table
function shell.getCompletionInfo() end

