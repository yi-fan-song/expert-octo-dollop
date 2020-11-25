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

for i=0, 32, 1 do
	turtle.dig()
	turtle.forward()
	turtle.digDown()
end

for i=0, 32, 1 do
	turtle.back()
end
