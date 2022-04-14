--- Interfaces with CraftOS and the computer.
---@class os
_G.os = { }
--- Returns the version of CraftOS running on the computer.
---@return string
function os.version() end

--- Returns the ID of the current computer.
---@return number
function os.getComputerID() end

--- Returns the label of the computer.
---@return string/nil
function os.getComputerLabel() end

--- Sets the label of the computer.
---@param label string/nil @ The new label or nil
function os.setComputerLabel(label) end

--- Runs a Lua script with the specified environment.
---@param environment table @ The environment to pass to the program
---@param programPath string @ The path to the program to run
---@param arguments string @ Any arguments to pass to the program
---@return boolean
function os.run(environment, programPath, arguments) end

--- Loads an API into the global table. (Deprecated)
---@param path string @ The path to the API to load
---@return boolean
function os.loadAPI(path) end

--- Unloads a previously loaded API. (Deprecated)
---@param name string @ The name of the API
function os.unloadAPI(name) end

--- Waits for an event to occur.
---@param target_event string @ A filter specifying which event to wait for (optional)
---@return ...string, any
function os.pullEvent(target_event) end

--- Waits for an event to occur (doesn't terminate when Ctrl-T is pressed).
---@param target_event string @ A filter specifying which event to wait for (optional)
---@return ...string, any
function os.pullEventRaw(target_event) end

--- Adds an event to the event queue.
---@param event string @ The event to queue
---@vararg any @ Any parameters to pass in the event
function os.queueEvent(event, ...) end

--- Returns the amount of time since the computer was started.
---@return number
function os.clock() end

--- Queues an event after an amount of seconds has passed, and returns the ID.
---@param timeout number @ The number of seconds to wait
---@return number
function os.startTimer(timeout) end

--- Cancels a previously started timer.
---@param timerID number @ The ID of the timer
function os.cancelTimer(timerID) end

--- Returns the current time in the selected locale.
---@param locale string @ One of 'ingame', 'utc', or 'local'. Defaults to 'ingame'. (1.8+)
---@return number
function os.time(locale) end

--- Returns a string or table with the current or provided time representation. (CC:T)
---@param format string @ The format for the date string. If set to '*t', returns a table instead.
---@param time number @ The time to convert. Defaults to the current local time, or current UTC time if the format is prefixed with '!'.
---@return string/table
function os.date(format, time) end

--- Sleeps for a number of seconds.
---@param time number @ The number of seconds to sleep
function os.sleep(time) end

--- Returns the current day for the selected locale.
---@param locale string @ One of 'ingame', 'utc', or 'local'. Defaults to 'ingame'. (1.8+)
---@return number
function os.day(locale) end

--- Returns the time in seconds since an epoch depending on the locale.
---@param locale string @ One of 'ingame', 'utc', or 'local'. Defaults to 'ingame'. (1.8+)
---@return number
function os.epoch(locale) end

--- Sets an alarm to activate at an in-game time, and returns the ID.
---@param time number @ The time to activate at
---@return number
function os.setAlarm(time) end

--- Cancels a previously started alarm.
---@param alarmID number @ The ID of the alarm
function os.cancelAlarm(alarmID) end

--- Powers off the computer.
function os.shutdown() end

--- Reboots the computer.
function os.reboot() end

