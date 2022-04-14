--- Allows performing operations on files and directories.
---@class fs
_G.fs = { }
--- Returns a list of files and folders in a directory.
---@param path string @ The path to query
---@return table
function fs.list(path) end

--- Checks whether the path exists.
---@param path string @ The path to query
---@return boolean
function fs.exists(path) end

--- Checks whether the path is a directory.
---@param path string @ The path to query
---@return boolean
function fs.isDir(path) end

--- Checks whether the path is read only.
---@param path string @ The path to query
---@return boolean
function fs.isReadOnly(path) end

--- Returns the basename of the path.
---@param path string @ The path to query
---@return string
function fs.getName(path) end

--- Returns the storage medium holding a path.
---@param path string @ The path to query
---@return string/nil
function fs.getDrive(path) end

--- Returns the size of a file in bytes.
---@param path string @ The path to query
---@return number
function fs.getSize(path) end

--- Returns the space available in the directory.
---@param path string @ The path to query
---@return number
function fs.getFreeSpace(path) end

--- Creates a directory at the path, creating parents as needed.
---@param path string @ The path to create
function fs.makeDir(path) end

--- Moves a file or directory to a new location.
---@param fromPath string @ The source path
---@param toPath string @ The destination path
function fs.move(fromPath, toPath) end

--- Copies a file or directory to a new location.
---@param fromPath string @ The source path
---@param toPath string @ The destination path
function fs.copy(fromPath, toPath) end

--- Deletes a file or directory.
---@param path string @ The path to delete
function fs.delete(path) end

--- Combines two path components, so that the second path is nested inside the first.
---@param basePath string @ The base path
---@param localPath string @ The local path
---@return string
function fs.combine(basePath, localPath) end

--- Opens a file for reading or writing.
---@param path string @ The file to open
---@param mode string @ The mode to open the file in (r/w/a[b])
---@return table
function fs.open(path, mode) end

--- Searches the filesystem for files matching a pattern, and returns a list of results. (1.6+)
---@param wildcard string @ The pattern to match against
---@return table
function fs.find(wildcard) end

--- Returns the parent directory of a path. (1.63+)
---@param path string @ The path to query
---@return string
function fs.getDir(path) end

--- Returns a list of possible completions for a directory and a partial name. (1.74+)
---@param partial_name string @ The first part of a filename
---@param path string @ The path to complete from
---@param include_files boolean @ Whether to include files (optional)
---@param include_slashes boolean @ Whether to include slashes (optional)
---@return table
function fs.complete(partial_name, path, include_files, include_slashes) end

--- Returns true if a path is mounted to the parent filesystem. (CC:T 1.88+)
---@param path string @ The path to check
---@return boolean
function fs.isDriveRoot(path) end

--- Returns the amount of free space (in bytes) available on the drive the path is located on. (CC:T 1.87+)
---@param path string @ The path to get the capacity of
---@return number
function fs.getCapacity(path) end

--- Gets attributes about a specific file or folder. (CC:T 1.87+)
---@param path string @ The path to get attributes for
---@return table
function fs.attributes(path) end

