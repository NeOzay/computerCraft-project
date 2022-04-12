function loadSaveTable(file)
	local dossier = fs.open(file, "r")
	local donn = dossier.readAll()
	dossier.close()
	return textutils.unserialize(donn)
end

function saveTable(table, file)
	local file = fs.open(file, "w")
	file.flush()
	file.write(textutils.serialize(table))
	file.close()
end

function fusionTable(table1, table2)
	nouvelleTable = {}
	for k, v in pairs(table2) do
		table.insert(table1, v)
	end
	return table1
end

function rechercheInventaire(item, inventaire)
	inv = inventaire

	for i = 1, inv.getInventorySize() do
		if inv.getStackInSlot(i) ~= nil then
			if string.find(inv.getStackInSlot(i).display_name, item) ~= nil then
				return i
			end
		end
	end

end

function stringColorisation(string, colors)
	x = colors
	for i = 2, #string do
		x = x .. colors
	end
	return x
end

function statut()
	if reactor.isActive() then
		colorsStatut = "5555555"
		return "working"
	else
		colorsStatut = "eeeeeee"
		return "stopped"
	end
end

function reactorInventoryCheck()

	while reactorStatus == "safe" do
		ecran.setCursorPos(1, 4)
		ecran.blit("reactorInventoryCheck: ON", stringColorisation("reactorInventoryCheck: ", "0") .. "55",
		           stringColorisation("reactorInventoryCheck: ON", "8"))
		for cycle = 1, #neutronReflector do
			if string.find(reactor.getStackInSlot(neutronReflector[cycle]).display_name, "Depleted") == nil then
				chest.pushItemIntoSlot(chestSize, rechercheInventaire("Neutron", chest), 1, neutronReflector[cycle])

			end
		end

		for cycle = 1, #fuelRod do
			if string.find(reactor.getStackInSlot(fuelRod[cycle]).display_name, "Depleted") ~= nil then

				chest.pullItemIntoSlot(chestSize, fuelRod[cycle], 1)
				os.sleep(1)
				chest.pushItemIntoSlot(chestSize, rechercheInventaire("Fuel", chest), 1, fuelRod[cycle])
			end
		end

		os.sleep(20)
	end
	ecran.setCursorPos(1, 4)
	ecran.blit("reactorInventoryCheck: OFF", stringColorisation("reactorInventoryCheck: ", "0") .. "eee",
	           stringColorisation("reactorInventoryCheck: OFF", "7"))
end

function reactorSwichOff(raison)
	state = raison
	redstone.setOutput("back", false)
	reactorStatus = "warning"
end

function reactorWorkTime()

	if not fs.exists("clock") then

		clock = {workTime = {day = 0, heure = 0, min = 0}, offlineTime = {day = 0, heure = 0, min = 0}}
		ecran.clear()

	else
		clock = loadSaveTable("clock")

	end

	ecran.clear()

	workTime = clock.workTime

	while reactor.isActive() do

		if workTime.min == 60 then
			workTime.min = 0
			workTime.heure = workTime.heure + 1

			if workTime.heure == 24 then
				workTime.heure = 0
				workTime.day = workTime.day + 1
			end
		end
		if workTime.min < 10 then
			min = "0" .. workTime.min
		else
			min = workTime.min
		end
		if workTime.heure < 10 then
			heure = "0" .. workTime.heure
		else
			heure = workTime.heure
		end
		if workTime.day < 10 then
			day = "00" .. workTime.day
		elseif workTime.day < 100 then
			day = "0" .. workTime.day
		else
			day = workTime.day

		end
		clock.workTime = workTime
		saveTable(clock, "clock")
		ecran.setCursorPos(15, 1)
		ecran.write("operating time: " .. day .. "d" .. heure .. "h" .. min)
		os.sleep(60)
		workTime.min = workTime.min + 1
	end

	offlineTime = clock.offlineTime

	while not reactor.isActive() do

		if offlineTime.min == 60 then
			offlineTime.min = 0
			offlineTime.heure = offlineTime.heure + 1

			if offlineTime.heure == 24 then
				offlineTime.heure = 0
				offlineTime.day = offlineTime.day + 1
			end
		end
		if offlineTime.min < 10 then
			min = "0" .. offlineTime.min
		else
			min = offlineTime.min
		end
		if offlineTime.heure < 10 then
			heure = "0" .. offlineTime.heure
		else
			heure = offlineTime.heure
		end
		if offlineTime.day < 10 then
			day = "00" .. offlineTime.day
		elseif offlineTime.day < 100 then
			day = "0" .. offlineTime.day
		else
			day = offlineTime.day
		end

		clock.offlineTime = offlineTime
		saveTable(clock, "clock")
		ecran.setCursorPos(17, 2)
		ecran.write("offline time: " .. day .. "d" .. heure .. "h" .. min)
		os.sleep(60)
		offlineTime.min = offlineTime.min + 1

	end
end

function display()

	while true do
		ecran.setCursorPos(1, 1)
		ecran.blit("REACTOR 1", "111111111", "999999999")
		ecran.setCursorPos(1, 2)

		ecran.blit("Statut: " .. statut(), "00000000" .. colorsStatut, stringColorisation("Statut: " .. colorsStatut, "7"))

		ecran.setCursorPos(1, 3)
		if reactor.isActive() then
			ecran.blit("EU output:" .. reactor.getEUOutput() * 5,
			           "0000000000" .. stringColorisation(tostring(reactor.getEUOutput() * 5), "b"),
			           "3333333333" .. stringColorisation(tostring(reactor.getEUOutput() * 5), "3"))
		else

			if reactorStatus == "safe" then
				ecran.blit("reactor integrity: " .. state, "0000000000000000000" .. stringColorisation(state, "5"),
				           "7777777777777777777" .. stringColorisation(state, "7"))
			else
				ecran.blit("reactor integrity: " .. state, "0000000000000000000" .. stringColorisation(state, "f"),
				           "eeeeeeeeeeeeeeeeeee" .. stringColorisation(state, "e"))
			end
		end
		os.sleep(5)
	end
end

reactor = peripheral.find("nuclear_reactor")
ecran = peripheral.wrap("top")
chest = peripheral.wrap("chest_0")

if not fs.exists("composant") then
	shell.run("reactorInventori.lua")
	error()
else
	elementSort = loadSaveTable("composant")

end

chestSize = "west"

exchanger = elementSort.exchanger
neutronReflector = elementSort.neutronReflector
vent = elementSort.vent
fuelRod = elementSort.fuelRod
coolant = elementSort.coolant
coolant = fusionTable(coolant, vent)
coolant = fusionTable(coolant, exchanger)

--[[nameDisplay.clear()
nameDisplay.setCursorPos(1,1)
nameDisplay.setTextScale(3.5)
nameDisplay.blit("REACTOR1","eeeeeeee","77777777")
]]

ecran.clear()

reactorStatus = "safe"
redstone.setOutput("back", true)

parallel.waitForAll(reactorWorkTime, reactorInventoryCheck, display, reactorHeatCore)
