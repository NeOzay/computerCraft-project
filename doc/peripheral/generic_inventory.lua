---@class list_Item
---@field name string
---@field damage number
---@field count number


---@class generic_inventory
local inventory = {}

---List all items in this inventory
---@return table<number, list_Item>
function inventory.list() end

---The item in the specified slot.
---@param slot number
---@return table
function inventory.getItem(slot) end

---The metadata of the item in the specified slot.
---@param slot number
---@return table
function inventory.getItemMeta(slot) end

---Pull items to this inventory from another inventory.
---@param fromName string
---@param fromSlot number
---@param limit? number
---@param toSlot? number
function inventory.pullItems(fromName, fromSlot, limit, toSlot) end
