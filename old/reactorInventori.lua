function saveTable(table,file)
	local file = fs.open(file,"w")
	file.flush()
	file.write(textutils.serialize(table))
	file.close()
end


reactor = peripheral.find("nuclear_reactor")

elementSort = {vent={},fuelRod = {},coolant = {},neutronReflector={},exchanger={}}
elementName = {vent="Vent",fuelRod="Fuel",coolant="Cell",neutronReflector="Neutron",exchanger="Exchanger"}
for slotNumber = 1 , reactor.getInventorySize() do
	if  reactor.getStackInSlot(slotNumber) ~= nil then
		for k,v in pairs(elementName) do
			
			if string.find(reactor.getStackInSlot(slotNumber).display_name,v) ~= nil then			
			table.insert(elementSort[k],slotNumber)
			break
			end
		
		end
	end
end

saveTable(elementSort,"composant")

os.reboot()

--[[for k,v in pairs(elementSort) do
	print(k)
	for k2,v2 in pairs(v) do
	print(v2)
	end
end]]
