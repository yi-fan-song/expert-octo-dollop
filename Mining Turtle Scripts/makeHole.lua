local fuelLevel = turtle.getFuelLevel()

print("How long (direction turtle is facing)")
local length = read()

print("right or left of turtle? (enter right or left)")
local direction = read()

print("how wide (side of turtle)")
local width = read()

print("how deep (below turtle)")
local depth = read()

if not (direction == "left" or direction == "right")  then
	print("direction not correct")
	exit()
end

local fuelCost = length * math.floor(width / 2) * depth

if not (fuelLevel == "unlimited") and (fuelLevel < fuelCost) then
	local item = turtle.getItemDetail()
	if item.name == "minecraft:coal" then
		turtle.refuel(item.count - 1)
	end
	if turtle.getFuelLevel() < fuelCost then
		print("not enough fuel")
		do return end
	end
end

local upFlag = false
local reverseFlag = false

for i = 1, math.floor(width / 2), 1 do
	for k = 1, depth, 1 do
		for j = 1, length, 1 do
			if reverseFlag then
				if direction == "right" then
					turtle.turnLeft()
					turtle.dig()
					turtle.turnRight()
				elseif direction == "left" then
					turtle.turnRight()
					turtle.dig()
					turtle.turnLeft()
				end
			else
				if direction == "right" then
					turtle.turnRight()
					turtle.dig()
					turtle.turnLeft()
				elseif direction == "left" then
					turtle.turnLeft()
					turtle.dig()
					turtle.turnRight()
				end
			end
			if not (j == length) then
				turtle.dig()
				turtle.forward()
			end
		end

		if not (k == depth) then
			if upFlag then
				turtle.digUp()
				turtle.up()
			else
				turtle.digDown()
				turtle.down()
			end

			turtle.turnRight()
			turtle.turnRight()
			
		end

		reverseFlag = not reverseFlag
	end

	if not (i == math.floor(width / 2)) then
		if reverseFlag then
			if direction == "right" then
				turtle.turnLeft()
				turtle.forward()
				turtle.dig()
				turtle.forward()
				turtle.turnRight()
			elseif direction == "left" then
				turtle.turnRight()
				turtle.forward()
				turtle.dig()
				turtle.forward()
				turtle.turnLeft()
			end
		else
			if direction == "right" then
				turtle.turnRight()
				turtle.forward()
				turtle.dig()
				turtle.forward()
				turtle.turnRight()
			elseif direction == "left" then
				turtle.turnLeft()
				turtle.forward()
				turtle.dig()
				turtle.forward()
				turtle.turnLeft()
			end
		end
	end

	upFlag = not upFlag
end