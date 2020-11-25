local fuelLevel = turtle.getFuelLevel()

if not (fuelLevel == "unlimited") and (fuelLevel > 64) then
	local item = turtle.getItemDetail()
	if item.name == "minecraft:coal" then
		turtle.refuel(item.count - 1)
	end
	if turtle.getFuelLevel() < 64 then
		print("not enough fuel")
		do return end
	end
end

totalMoved = 0

for i=1, 32, 1 do
	turtle.dig()
	local moved = turtle.forward()
	if (moved) then totalMoved = totalMoved + 1 end
	turtle.digDown()
end

for i=1, totalMoved, 1 do
	turtle.back()
end
