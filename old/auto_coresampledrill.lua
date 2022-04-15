--position turtle
local xpos,zpos = -569, -913
local cote = 5


local avence = 15

function getTableSize(t)
	local count = 0
	for _, __ in pairs(t) do
		count = count + 1
	end
	return count
end

function saveTable(table,file)
	local file = fs.open(file,"w")
	file.flush()
	file.write(textutils.serialize(table))
	file.close()
end

function loadSaveTable(file)
	local dossier=fs.open(file,"r")
	local donn=dossier.readAll()
	dossier.close()
	return textutils.unserialize(donn)	
end

function move(pas)
	for i=1,pas do
		turtle.forward()
	end
	return avence
end

function rechercheInventaire(element,metaId)
	for slot=1,16 do
		turtle.select(slot)
		if turtle.getItemDetail() ~= nil then
			local names = turtle.getItemDetail()
			if names["name"] == element and names["damage"] == metaId then
				break
			end
		else
		end
	end
end


function place(element,metaId)
	rechercheInventaire(element,metaId)
	turtle.place()
end

for i=1,cote do


	for i=1,cote do

		turtle.down()
		move(1)
		place("minecraft:dirt",0)
		turtle.back()
		turtle.up()
		place("OpenBlocks:blockPlacer",0)
		rechercheInventaire("ImmersiveEngineering:metalDevice",14)
		turtle.drop()

		redstone.setOutput("front",true)
		os.sleep(1)
		redstone.setOutput("front",false)
		turtle.dig()
		place("EnderIO:blockCapBank",1)
		turtle.up()
		place("SolarExpansion:solarPanelRedstone",0)
		os.sleep(30)
		turtle.dig()
		turtle.down()
		turtle.dig()
		turtle.forward()



		drill = peripheral.find("IE:sampleDrill")

		if drill.isSamplingFinished() == true then
			if drill.getVeinLocalizedName() ~= nil then
				if not fs.exists("dossier") then filon = {} 
				else
					filon=loadSaveTable("dossier")
				end

				filon["x"..xpos.." ".."z"..zpos]= drill.getVeinLocalizedName()

				saveTable(filon,"dossier")

				--for k, v in pairs(filon) do  print (k.." "..v)  end

			end

		end
		turtle.dig()
		turtle.forward()
		turtle.digDown()

		if i ~= cote then	
			xpos=xpos+move(avence)


		end

		if avence>0 and i~=cote then
			turtle.turnRight()
			move(16)
			turtle.turnRight()
			avence = avence*-1
			zpos = zpos+ 16
		elseif i~=cote then
			turtle.turnLeft()
			move(16)
			turtle.turnLeft()
			avence = avence*-1
			zpos = zpos+ 16
		end
	end
end
