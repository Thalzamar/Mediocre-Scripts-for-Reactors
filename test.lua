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
-- check for not working Vessels

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

local heater_count = #heaters
local heaters_by_type = {}
local heater_type = {}
for i = 1,heater_count do
    local heater = heaters[i]
    local heater_name = heater[2] -- coolantName
	local heater_cooling = heater[6] -- CoolentCooling
	local heater_type = {heater_name,heater_cooling,count}
	local heater_type[count] = heater_type[count] + 1
    heaters_by_type[heater_type] = heater_type
end
local table_count = #heaters_by_type
local print = print
print(("Out of %d heaters :"):format(heater_count))
for i = 1,#heaters_by_type do 
    print(("You have %d %s heaters each cooling %s"):format( heaters_by_type[i][count],heaters_by_type[i][heater_name],heaters_by_type[i][heater_cooling]))
end
--[[
currently no idea how to insert name + total cooling
local coolent_count = #heaters_by_type
for i = 1,coolent_count do
	local percentcool = {}
	local total_cooling = heaters_by_type[i][cooling] * heaters_by_type[count]
	
	percentcool
end ]]




--[[
make a table with 3 parts [1]Coolent type [2] amount [3] Cooling
 using test enviroment to print the table bob made so i get an idea how it looks to know how to modify it
 from what i can glimpse it should [1] name [2] count , so i would need to add processCooling ?
 probably should write a programm to see what processCooling gives 

 XH calculation needs Watercontacts (2(x*y)-(x+y)) * z
 13.840 different entries if every calc would be in 1 Table
 how the fuck would i search this ?



--look at bobs and toms programms to see input events
 i need CoolentHeatMultiplier ? maybe read configs ask bob if possible
need CoolentperRecipe (Config ?)
need Conductivity: 	-CoolentTube
					-WaterTube
					-exhaustSteam
					-lqSteam
					-Condensate
for Condenser just say use Helium

--"Hot Coolant Exhaust and Preheating Loop Rates";
coolantTotalIntermediateLoopRate = (240000*condensateWaterTubeConductivity*coolantPerRecipe*msrCoolingEfficiency*noHeaters*waterTubeConductivity)/(condensateWaterTubeConductivity*coolantTubeConductivity*exhaustSteamTubeConductivity*waterBaseCoolingProvided*waterBaseHeatingRequired + 4800000*condensateWaterTubeConductivity*waterTubeConductivity + 320000*exhaustSteamTubeConductivity*waterTubeConductivity);
coolantTotalPreheatingLoopRate = (16000*coolantPerRecipe*exhaustSteamTubeConductivity*msrCoolingEfficiency*noHeaters*waterTubeConductivity)/(condensateWaterTubeConductivity*coolantTubeConductivity*exhaustSteamTubeConductivity*waterBaseCoolingProvided*waterBaseHeatingRequired + 4800000 condensateWaterTubeConductivity*waterTubeConductivity + 320000*exhaustSteamTubeConductivity*waterTubeConductivity);

"Hot Coolant <-> Water";
coolantTotalPrimaryRate = coolantPerRecipe/20*msrCoolingEfficiency*noHeaters - coolantTotalIntermediateLoopRate - coolantTotalPreheatingLoopRate;
coolantBaseCoolingReq = coolantHeatMult*msrBaseCoolingRate*coolantTubeConductivity;
coolantTotalCoolingReq = coolantTotalPrimaryRate*coolantBaseCoolingReq/coolantPerRecipe;
noCoolantWaterContacts = coolantTotalCoolingReq/waterBaseCoolingProvided;
waterTotalRate = 200*noCoolantWaterContacts*waterTubeConductivity*400/waterBaseHeatingRequired;
hpSteamTotalRate = waterTotalRate*1000/200;

"HP Steam -> LP Steam";
exhaustSteamTotalRate = hpSteamTotalRate*4;
exhaustSteamTotalHeatingReq = exhaustSteamTotalRate*4000/(1000*exhaustSteamTubeConductivity);
noExhaustSteamCoolantContacts = exhaustSteamTotalHeatingReq/400;
coolantTotalIntermediateLoopRate = coolantPerRecipe*noExhaustSteamCoolantContacts*300/(coolantBaseCoolingReq*coolantTubeConductivity);
lpSteamTotalRate = exhaustSteamTotalRate;

"LP Steam -> Condensate Water";
lqSteamTotalRate = lpSteamTotalRate*2;
noLqSteamCondenserContacts = lqSteamTotalRate*20/(1000*lqSteamCondenserConductivity*(1 + Log[350/lqSteamCondenserSurroundingTemp]));
condensateWaterTotalRate = exhaustSteamTotalRate*25/1000;

"Condensate Water <-> Hot Coolant";
condensateWaterTotalHeatingReq = condensateWaterTotalRate*32000/(1000*condensateWaterTubeConductivity);
noCondensateWaterCoolantContacts = condensateWaterTotalHeatingReq/400;
coolantTotalPreheatingLoopRate = coolantPerRecipe*noCondensateWaterCoolantContacts*100/(coolantBaseCoolingReq*coolantTubeConductivity);

"Power Produced";
power = hpSteamTotalRate*16 + lpSteamTotalRate*4;

Output 
 Table: Each Coolent Watercontacts {{{1HX},{2HX},{Condenser},{3HX}}
 Table : HPS and LPS for normal+Pre-heat

]]


print("Have a nice day")
os.exit()
