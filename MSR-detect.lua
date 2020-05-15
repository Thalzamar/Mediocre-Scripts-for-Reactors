local com = require("computer")
com.setArchitecture("Lua 5.3")
local c = require("component")
local msr = c.nc_salt_fission_reactor

print("Iniating Startup Sequence")
os.sleep(5) 
--maybe insert event for key press ?

--variable list MSR
-- msr.activate() msr.deactivate() on/off
local active = 		msr.isReactorOn()
local xsize = 		msr.getLengthX()
local ysize = 		msr.getLengthY()
local zsize = 		msr.getLengthZ()
local mxheat =		msr.getHeatCapacity()
local rEff =		msr.getCoolingEfficiency()
local cool =		msr.getCoolingRate()
--don't know if these are needed
local nvessel =		msr.getNumberOfVessels()
local nheaters = 	msr.getNumberOfHeaters()

----tables to copy the heater stats into 

local aheat= 		{}
local bheat= 		{}
local cheat= 		{}
local dheat=		{}
local eheat= 		{}
local fheat=		{}
local gheat= 		{}
local hheat= 		{}
local iheat=		{}
local jheat=	 	{}
local kheat=	 	{}
local lheat= 		{}
local mheat=		{}
local nheat=		{}
local oheat=	 	{}


--Vesseltest and Heatertest
print("Reactor Test to see if all Vessels and Heater work")
--empty table to copy non-working vessels into
local nove = {}
msr.activate()

os.sleep(10)
--[[
{{{posX, posY, posZ}, isProcessing, currentRecipeTime, processTime, processHeat, efficiency, heatMultiplier},...}
Returns a table containing the stats of all the vessels in the multiblock.
]]
local vessels =		msr.getVesselStats()
--[[
Object[] getHeaterStats() -> {{{posX, posY, posZ}, coolantName, isProcessing, currentRecipeTime, processTime, processCooling},...}
Returns a table containing the stats of all the heaters in the multiblock.
]]
local heaters =		msr.getHeaterStats()

msr.deactivate()
print("Test concluded, building Heaters and Vessels")


--conclusion for Vessels

for i = 1,#vessels 
	do
	if not vessels[i][2] 
			then table.move(vessels,i,i,#nove+1,nove)
		end
	end
if #nove > 0
	then 
	for i = 1,#nove
		do 
		print("Vessel ",i," is not working at ", nove[i][1] )
		end
	end

--Conclusion for Heaters
--[[check table empty if yes place
, if not check coolent the same, yes place
if not repeat next table ]]
-- made by Bob, have to read up on this witchery
local heaters = require("component").nc_salt_fission_reactor.getHeaterStats()
local heater_count = #heaters
local heaters_by_type = {}
for i = 1,heater_count do
    local heater = heaters[i]
    local heater_type = heater[2] -- coolantName
    heaters_by_type[heater_type] = (heaters_by_type[heater_type] or 0) + 1
end
local print = print
print(("Out of %d heaters :"):format(heater_count))
for name,count in pairs(heaters_by_type) do
    print(("You have %d %s heaters"):format(count,name))
end
print("Have a nice day")
os.exit()
