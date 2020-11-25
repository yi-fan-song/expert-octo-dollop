local fuelLevel = turtle.getFuelLevel()

if not (fuelLevel == "unlimited") and (fuelLevel < 128) then
	local item = turtle.getItemDetail()
	if item.name == "minecraft:coal" then
		turtle.refuel(item.count - 1)
	end
	if turtle.getFuelLevel() < 128 then
		print("not enough fuel")
		do return end
	end
end

print("Enter a direction: either left or right")
local direction = read()

if direction == "left" then
	turtle.turnLeft()
elseif direction == "right" then
	turtle.turnRight()
else
	print("unknown direction")
	exit()
end

for i=1, 3, 1 do
	turtle.forward()
end

if direction == "left" then
	turtle.turnRight()
elseif direction == "right" then
	turtle.turnLeft()
end
	