--- The Turtle API is used to work with your Turtles.
---@class turtle
_G.turtle = { }
--- Try to move the turtle forward.
---@return boolean, string | nil
function turtle.forward() end

--- Try to move the turtle backward.
---@return boolean, string | nil
function turtle.back() end

--- Try to move the turtle up.
---@return boolean, string | nil
function turtle.up() end

--- Try to move the turtle down.
---@return boolean, string | nil
function turtle.down() end

--- Turn the turtle left.
---@return boolean
function turtle.turnLeft() end

--- Turn the turtle right.
---@return boolean
function turtle.turnRight() end

--- Make the turtle select slot slotNum.
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right
---@return boolean
function turtle.select(slotNum) end

--- Indicates the currently selected inventory slot. (1.6+)
---@return number
function turtle.getSelectedSlot() end

--- Counts how many items are in the currently selected slot or, if specified, slotNum slot.
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right (optional)
---@return number
function turtle.getItemCount(slotNum) end

--- Counts how many remaining items you need to fill the stack in the currently selected slot or, if specified, slotNum slot.
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right (optional)
---@return number
function turtle.getItemSpace(slotNum) end

--- Returns the ID string, count and damage values of currently selected slot or, if specified, slotNum slot. (1.64+)
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right (optional)
---@return table/nil
function turtle.getItemDetail(slotNum) end

--- Attempts to equip an item in the current slot to the turtle's left side, switching the previously equipped item back into the inventory. (1.6+)
---@return boolean
function turtle.equipLeft() end

--- Attempts to equip an item in the current slot to the turtle's right side, switching the previously equipped item back into the inventory. (1.6+)
---@return boolean
function turtle.equipRight() end

--- Breaks and sucks the block in front. With hoe: tills the dirt in front of it.
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.dig(toolSide) end

--- Breaks and sucks the block above.
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.digUp(toolSide) end

--- Breaks and sucks the block below. With hoe: tills the dirt beneath the space below it.
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.digDown(toolSide) end

--- Places a block of the selected slot in front. Engrave signText on signs if provided. Collects water or lava if the currently selected slot is an empty bucket. (1.4+)
---@param signText string @ If you're placing a sign and signText is given, then the turtle places the sign putting the text of signText into it. Each line of the sign can be separated using newline (\n) character (optional)
---@return boolean, string | nil
function turtle.place(signText) end

--- Places a block of the selected slot above. Collects water or lava if the currently selected slot is an empty bucket.
---@return boolean, string | nil
function turtle.placeUp() end

--- Places a block of the selected slot below. Collects water or lava if the currently selected slot is an empty bucket.
---@return boolean, string | nil
function turtle.placeDown() end

--- Attacks in front of the turtle. (1.4+)
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.attack(toolSide) end

--- Attacks above the turtle. (1.4+)
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.attackUp(toolSide) end

--- Attacks under the turtle. (1.4+)
---@param toolSide string @ left/right (optional)
---@return boolean, string | nil
function turtle.attackDown(toolSide) end

--- Detects if there is a block in front. Does not detect mobs.
---@return boolean
function turtle.detect() end

--- Detects if there is a block above.
---@return boolean
function turtle.detectUp() end

--- Detects if there is a block below.
---@return boolean
function turtle.detectDown() end

--- Detects if the block in front is the same as the one in the currently selected slot. (1.31+)
---@return boolean
function turtle.compare() end

--- Detects if the block above is the same as the one in the currently selected slot.
---@return boolean
function turtle.compareUp() end

--- Detects if the block below is the same as the one in the currently selected slot
---@return boolean
function turtle.compareDown() end

--- Returns the ID string and metadata of the block in front of the Turtle. (1.64+)
---@return boolean, table/string
function turtle.inspect() end

--- Returns the ID string and metadata of the block above the Turtle. (1.64+)
---@return boolean, table/string
function turtle.inspectUp() end

--- Returns the ID string and metadata of the block below the Turtle. (1.64+)
---@return boolean, table/string
function turtle.inspectDown() end

--- Compare the current selected slot and the given slot to see if the items are the same. Returns true if they are the same, false if not. (1.4+)
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right (optional)
---@return boolean
function turtle.compareTo(slotNum) end

--- Transfers quantity items from the selected slot to slot. If quantity isn't specified, will attempt to transfer everything in the selected slot to slot. (1.45+)
---@param slotNum number @ 1 is top left, 16 (9 in 1.33 and earlier) is bottom right
---@param quantity number @ Transfers [quantity] items from the selected slot to the specified slot (optional)
---@return boolean, string | nil
function turtle.transferTo(slotNum, quantity) end

--- Drops all items in the selected slot, or specified, drops [count] items.  /  [>= 1.4 only:] If there is a inventory on the side (i.e in front of the turtle) it will try to place into the inventory, returning false if the inventory is full.
---@param count number @ Drops [count] items (optional)
---@return boolean, string | nil
function turtle.drop(count) end

--- Drops all items in the selected slot, or specified, drops [count] items.  /  [>= 1.4 only:] If there is a inventory on the side (i.e above the turtle) it will try to place into the inventory, returning false if the inventory is full. (1.4+)
---@param count number @ Drops [count] items (optional)
---@return boolean, string | nil
function turtle.dropUp(count) end

--- Drops all items in the selected slot, or specified, drops [count] items.  /  [>= 1.4 only:] If there is a inventory on the side (i.e below the turtle) it will try to place into the inventory, returning false if the inventory is full. If above a furnace, will place item in the top slot. (1.4+)
---@param count number @ Drops [count] items (optional)
---@return boolean, string | nil
function turtle.dropDown(count) end

--- Picks up an item stack of any number, from the ground or an inventory in front of the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false (1.4+). The [amount] parameter requires ComputerCraft 1.6 or later
---@param amount number @ The turtle will attempt to pick up at most the specified number of items (optional)
---@return boolean, string | nil
function turtle.suck(amount) end

--- Picks up an item stack of any number, from the ground or an inventory above the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false (1.4+). The [amount] parameter requires ComputerCraft 1.6 or later
---@param amount number @ The turtle will attempt to pick up at most the specified number of items (optional)
---@return boolean
function turtle.suckUp(amount) end

--- Picks up an item stack of any number, from the ground or an inventory below the turtle, then places it in the selected slot. If the turtle can't pick up the item, the function returns false (1.4+). The [amount] parameter requires ComputerCraft 1.6 or later
---@param amount number @ The turtle will attempt to pick up at most the specified number of items (optional)
---@return boolean
function turtle.suckDown(amount) end

--- Returns the current fuel level of the turtle, this is the number of blocks the turtle can move. If turtleNeedFuel = 0 then it returns unlimited.(1.4+)
---@return number/string
function turtle.getFuelLevel() end

--- Returns the maximum amount of fuel a turtle can store - by default, 20,000 for regular turtles, 100,000 for advanced. If turtleNeedFuel = 0 then it returns unlimited. (1.6+)
---@return number/string
function turtle.getFuelLimit() end

--- If the current selected slot contains a fuel item, it will consume it to give the turtle the ability to move. Added in 1.4 and is only needed in needfuel mode. If the current slot doesn't contain a fuel item, it returns false. If a [quantity] is specified, it will refuel only up to that many items, otherwise, it will consume all the items in the slot. (1.4+)
---@param quantity number @ If a [quantity] is specified, it will refuel only up to that many items, otherwise, it will consume all the items in the slot (optional)
---@return boolean
function turtle.refuel(quantity) end

--- (Only Crafty Turtle) Craft items using ingredients anywhere in the turtle's inventory and place results in the active slot. If a quantity is specified, it will craft only up to that many items, otherwise, it will craft as many of the items as possible. (1.4+)
---@param quantity number @ A parameter can also be supplied to specify the quantity of items to craft. If the quantity specified is 0, will return true if a valid recipe has been found in the turtle's inventory, and false otherwise (optional)
---@return boolean
function turtle.craft(quantity) end

