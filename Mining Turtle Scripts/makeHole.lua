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
	do return end
end

local fuelCost = length * math.ceil(width / 2) * depth

if not (fuelLevel == "unlimited") and (fuelLevel < fuelCost) then
	for i = 1, 16, 1 do
		local item = turtle.getItemDetail()
		if item and (item.name == "minecraft:coal") then
			turtle.refuel(item.count)
			
			if turtle.getFuelLevel() > fuelCost then
				break
			end
		end
	end
	if turtle.getFuelLevel() < fuelCost then
		print("not enough fuel")
		do return end
	end
end

-- dig2side digs the block on the right or left of the turtle
local function dig2side (reversed, dir)
	local digLeft = false
	if dir == "left" then
		digLeft = true
	else
		digLeft = false
	end

	if reversed then
		digLeft = not digLeft
	end

	if digLeft then
		turtle.turnLeft()
		while turtle.detect() do
			turtle.dig()
		end
		turtle.turnRight()
	else
		turtle.turnRight()
		while turtle.detect() do
			turtle.dig()
		end
		turtle.turnLeft()
	end
end

-- gotoNextRow digs and moves the turtle to the next row in the column
local function gotoNextRow (goingUp)
	if goingUp then
		while not turtle.up() do
			turtle.digUp()
		end
	else
		while not turtle.down() do
			turtle.digDown()
		end
	end
end

-- gotoNextColumn digs and moves the turtle to the next column
local function gotoNextColumn(reversed, dir)
	local digLeft = false
	if dir == "left" then
		digLeft = true
	else
		digLeft = false
	end

	if reversed then
		digLeft = not digLeft
	end

	if digLeft then
		turtle.turnLeft()
		while not turtle.forward() do
			turtle.dig()
		end
		while not turtle.forward() do
			turtle.dig()
		end
		turtle.turnLeft()
	else
		turtle.turnRight()
		while not turtle.forward() do
			turtle.dig()
		end
		while not turtle.forward() do
			turtle.dig()
		end
		turtle.turnRight()
	end
end

-- upFlag tells whether the turtle started at the bottom or the top in the currect column
local upFlag = false
-- when reverseFlag == true, that means the turtle is going the opposite way of where it was facing originally
local reverseFlag = false

local newWidth = math.ceil(width / 2)
local isOddWidth = width % 2

-- main loop with all the logic
for i = 1, newWidth, 1 do
	for k = 1, depth, 1 do
		for j = 1, length, 1 do

			if (i ~= newWidth) or (isOddWidth == 0) then
				dig2side(reverseFlag, direction)
			end

			if tostring(j) ~= length then
				while not turtle.forward() do
					while turtle.detect() do
						turtle.dig()
					end
				end
			end

		end

		if tostring(k) ~= depth then
			gotoNextRow(upFlag)

			-- do a 180
			turtle.turnRight()
			turtle.turnRight()

			-- next row is going the opposite way of the row that was just done
			reverseFlag = not reverseFlag
		end

	end

	if i ~= newWidth then
		gotoNextColumn(reverseFlag, direction)
	end

	reverseFlag = not reverseFlag
	upFlag = not upFlag
end
