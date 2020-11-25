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

turtle.select(2)

while(turtle.back()) do
	turtle.place()
end

turtle.select(1)