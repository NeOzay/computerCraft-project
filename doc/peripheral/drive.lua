---@class drive
local drive = {}

---Returns whether a disk is currently inserted in the drive.
---@return boolean
function drive.isDiskPresent() end

---Returns the label of the disk in the drive if available.
---@return string?
function drive.getDiskLabel() end

---Sets or clears the label for a disk.
---
---If no label or nil is passed, the label will be cleared.
---
---If the inserted disk's label can't be changed (for example, a record), an error will be thrown.
---@param label string?
function drive.setDiskLabel(label) end

---Returns whether a disk with data is inserted.
---@return boolean
function drive.hasData() end

---Returns the mount path for the inserted disk.
---@return string? string|nil @The mount path for the disk, or nil if no data disk is inserted.
function drive.getMountPath() end

---Returns whether a disk with audio is inserted.
---@return boolean
function drive.hasAudio() end

---Returns the title of the inserted audio disk.
---@return string? string|nil @The title of the audio, false if no disk is inserted, or nil if the disk has no audio.
function drive.getAudioTitle() end

---Plays the audio in the inserted disk, if available.
function drive.playAudio() end

---Stops any audio that may be playing.
function drive.stopAudio() end

---Ejects any disk that may be in the drive.
function drive.ejectDisk() end

---Returns the ID of the disk inserted in the drive.
---@return number?
function drive.getDiskID() end
