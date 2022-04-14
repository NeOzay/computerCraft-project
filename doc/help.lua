--- Provides functions for viewing help documents.
---@class help
_G.help = { }
--- Returns a string listing the directories to search for help topics in, separated by colons.
---@return string
function help.path() end

--- Sets the paths to search for help topics.
---@param path string @ The paths to search for help topics, separated by colons
function help.setPath(path) end

--- Returns the path to the file containing a help topic.
---@param topic string @ The topic to search for
---@return string/nil
function help.lookup(topic) end

--- Returns a list of help topics available.
---@return table
function help.topics() end

--- Returns a list of suffixes that can be appended to the prefix to create a topic name. (1.74+)
---@param topic_prefix string @ The beginning of a topic name
---@return table
function help.completeTopic(topic_prefix) end

