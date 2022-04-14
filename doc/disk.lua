--- Allows accessing data about disk drives.
---@class disk
_G.disk = { }
--- Returns whether an item is in the drive.
---@param side string @ The side to check
---@return boolean
function disk.isPresent(side) end

--- Returns whether a floppy disk is in the drive.
---@param side string @ The side to check
---@return boolean
function disk.hasData(side) end

--- Returns the mount point of the disk.
---@param side string @ The side to check
---@return string/nil
function disk.getMountPath(side) end

--- Sets the label of a disk.
---@param side string @ The side to check
---@param label string @ The name of the disk
function disk.setLabel(side, label) end

--- Returns the label of a floppy disk.
---@param side string @ The side to check
---@return string/nil
function disk.getLabel(side) end

--- Returns the ID of a disk.
---@param side string @ The side to check
---@return number/nil
function disk.getID(side) end

--- Returns whether a music disc is in the drive.
---@param side string @ The side to check
---@return boolean
function disk.hasAudio(side) end

--- Returns the name of the music disc inserted.
---@param side string @ The side to check
---@return string/nil
function disk.getAudioTitle(side) end

--- Plays the music disc in the drive.
---@param side string @ The side to check
function disk.playAudio(side) end

--- Stops the music disc in the drive.
---@param side string @ The side to check
function disk.stopAudio(side) end

--- Ejects the object from the drive.
---@param side string @ The side to check
function disk.eject(side) end

