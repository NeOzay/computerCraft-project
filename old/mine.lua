xpos, zpos, ypos= -13, 70, 162
sensducofre     = "south"
cote            = 15





xi, zi, yi = gps.locate()

if cote % 2 == 0 then

else
	cote = cote + 1
end




function reloadfuel()

	if (turtle.getFuelLevel() / turtle.getFuelLimit()) * 100 < 85 or turtle.getItemCount(14) ~= 0 then

		while (turtle.getFuelLevel() / turtle.getFuelLimit()) * 100 < 85 do
			turtle.select(16)
			turtle.refuel(1)
			if turtle.getItemCount(16) == 0 then
				break
			end
		end
		if turtle.getItemCount(16) == 0 or turtle.getItemCount(12) ~= 0 then
			x, z, y = gps.locate()
			for valeur3 = 0, math.abs(zpos - z) - 1 do --fait monter la turtle--
				turtle.up()
			end
			turtle.select(16)
			turtle.suckUp(turtle.getItemSpace(16))

			nrslot = 1
			for valeur5 = 0, 14 do --vide la turtle--
				turtle.select(nrslot)
				turtle.drop()
				nrslot = nrslot + 1
			end

			for valeur4 = 0, math.abs(zpos - z) - 1 do --fait dessendre la turtle--
				turtle.down()
			end

		end

	end


end

function positioncardinaux()
	x, z, y = gps.locate()
	if turtle.forward() == true then
		x2, z2, y2 = gps.locate()

		if x2 - x == -1 then
			cardinaux = "west"
			turtle.back()
		elseif x2 - x == 1 then
			cardinaux = "east"
			turtle.back()
		elseif y2 - y == -1 then
			cardinaux = "north"
			turtle.back()
		elseif y2 - y == 1 then
			cardinaux = "south"
			turtle.back()
		end

	else
		turtle.back()
		x2, z2, y2 = gps.locate()
		if x2 - x == 1 then
			cardinaux = "west"
			turtle.forward()
		elseif x2 - x == -1 then
			cardinaux = "east"
			turtle.forward()
		elseif y2 - y == 1 then
			cardinaux = "north"
			turtle.forward()
		elseif y2 - y == -1 then
			cardinaux = "south"
			turtle.forward()
		end
	end
end

function positionnementX()
	if xpos - x > 0 then
		if cardinaux == "south" then
			turtle.turnLeft()
		elseif cardinaux == "north" then
			turtle.turnRight()
		elseif cardinaux == "west" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		if cardinaux == "south" then
			turtle.turnRight()
		elseif cardinaux == "north" then
			turtle.turnLeft()
		elseif cardinaux == "east" then
			turtle.turnLeft()
			turtle.turnLeft()
		end

	end
end

function positionnementY()
	if ypos - y < 0 then
		if cardinaux == "west" then
			turtle.turnRight()
		elseif cardinaux == "east" then
			turtle.turnLeft()
		elseif cardinaux == "south" then
			turtle.turnLeft()
			turtle.turnLeft()
		end
	else
		if cardinaux == "west" then
			turtle.turnLeft()
		elseif cardinaux == "east" then
			turtle.turnRight()
		elseif cardinaux == "north" then
			turtle.turnLeft()
			turtle.turnLeft()
		end

	end
end

function positionnementZ()
	if zpos - z > 0 then

		for b = 0, math.abs(zpos - z) - 1 do
			turtle.up()
		end
	else
		for b = 0, math.abs(zpos - z) - 1 do
			turtle.down()
		end
	end
end

turtle.refuel()





while xpos ~= x or ypos ~= y or zpos ~= z do

	positioncardinaux()
	positionnementX()
	for v = 0, math.abs(xpos - x) - 1 do
		if turtle.forward() == false then
			turtle.down()
			break
		end
	end

	positioncardinaux()
	positionnementZ()

	positioncardinaux()
	positionnementY()
	for v = 0, math.abs(ypos - y) - 1 do
		if turtle.forward() == false then
			turtle.down()
			break
		end
	end
	print(math.abs(xpos - x) .. " " .. math.abs(ypos - y))

	x, z, y = gps.locate()
	print(xpos .. " " .. x)
	print(ypos .. " " .. y)
end



while cardinaux ~= sensducofre do
	positioncardinaux()
	if cardinaux ~= sensducofre then
		turtle.turnLeft()
	end
end

profondeur = 1
doug = 1
dis = 0
turtle.refuel()

turtle.select(16)
turtle.suckUp(turtle.getItemSpace(16))
while (turtle.getFuelLevel() / turtle.getFuelLimit()) * 100 < 85 do
	turtle.select(16)
	turtle.refuel(1)
	if turtle.getItemCount(16) == 0 then
		break
	end
end

--turtle.digDown()
--turtle.down()


for v = 0, math.abs(zpos - zi) - 1 do
	turtle.down()
end







while true do
	for valeur2 = 1, cote do

		for valeur = 2, cote do
			turtle.digDown()
			turtle.digUp()
			turtle.dig()
			turtle.forward()

		end
		if doug == 1 and dis ~= cote - 1 then
			turtle.digDown()
			turtle.digUp()
			turtle.turnRight()
			turtle.dig()
			turtle.forward()
			turtle.turnRight()
			doug = 2
			dis = dis + 1
		elseif doug == 2 and dis ~= cote - 1 then
			turtle.digDown()
			turtle.digUp()
			turtle.turnLeft()
			turtle.dig()
			turtle.forward()
			turtle.turnLeft()
			doug = 1
			dis = dis + 1
		end
	end

	dis = 0
	doug = 1
	turtle.digDown()
	turtle.turnRight()
	for valeur2 = 2, cote do --revient au point de depart--
		turtle.forward()
	end

	turtle.turnRight()
	turtle.down()
	turtle.digDown()
	turtle.down()
	turtle.digDown()
	turtle.down()

	reloadfuel()
	print(turtle.getFuelLevel() / turtle.getFuelLimit() * 100)
	turtle.select(1)
end
