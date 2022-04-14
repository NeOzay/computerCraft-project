--- Allows running multiple terminal sessions at once. (1.6+) (Advanced only)
---@class multishell
_G.multishell = { }
--- Returns the current tab ID.
---@return number
function multishell.getCurrent() end

--- Returns the number of tabs open.
---@return number
function multishell.getCount() end

--- Starts a program in a new tab.
---@param environment table @ The environment of the new task
---@param program_path string @ The path to the program to run
---@param arguments string @ Any arguments to pass to the program
---@return number
function multishell.launch(environment, program_path, arguments) end

--- Sets the tab as the current tab.
---@param tabID number @ The ID of the tab
---@return boolean
function multishell.setFocus(tabID) end

--- Sets the title of the tab.
---@param tabID number @ The ID of the tab
---@param title string @ The new name of the tab
function multishell.setTitle(tabID, title) end

--- Returns the title of a tab.
---@param tabID number @ The ID of the tab
---@return string
function multishell.getTitle(tabID) end

--- Returns the ID of the current tab.
---@return number
function multishell.getFocus() end

