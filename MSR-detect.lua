
--My Crime against Humanity starts
print("Iniating Startup Sequence")
os.sleep(5)
--maybe insert event for key press ?
local c = require("component")
local msr = c.nc_salt_fission_reactor
--startup see if reactor is complete, no cheating
local function init()
local workCheck = 	msr.isComplete()
end
 
 while not workCheck
	do  init()
end

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
Print("Reactor Test to see if all Vessels and Heater work")
--empty table to copy non-working vessels into
local nove = {}
msr.activate()
os.sleep(1)
--[[
{{{posX, posY, posZ}, isProcessing, currentRecipeTime, processTime, processHeat, efficiency, heatMultiplier},...}
Returns a table containing the stats of all the vessels in the multiblock.
]]
local vessel =		msr.getVesselStats()
--[[
Object[] getHeaterStats() -> {{{posX, posY, posZ}, coolantName, isProcessing, currentRecipeTime, processTime, processCooling},...}
Returns a table containing the stats of all the heaters in the multiblock.
]]
local heaters =		msr.getHeaterStats()
msr.deactivate()
Print("Test concluded, building Heaters and Vessels")


--conclusion for Vessels

for i = 1,#vessels 
	do
	if not vessel[i][2] 
			then table.move(vessel,i,i,#nove+1,nove)
		end
	end
if #nove > 0
	then 
	for i = 1,#nove
		do 
		Print("Vessel ",i," is not working at ", nove[i][1] )
		end
	end

--Conclusion for Heaters
--[[check table empty if yes place
, if not check coolent the same, yes place
if not repeat next table ]]
for i = 1,#heaters
	do 
	if #aheat == 0 then
	table.move(heaters,1,1,#aheat+1,aheat)
		elseif heaters[1][2] == aheat[1][2] 
		then table.move(heaters,1,1,#aheat+1,aheat)
			elseif #bheat == 0 
			then table.move(heaters,1,1,#bheat+1,bheat)
				elseif	heaters[1][2] == bheat[1][2]
				then table.move(heaters,1,1,#bheat+1,bheat)
					elseif #cheat == 0
					then table.move(heaters,1,1,#cheat+1,cheat)
						elseif heaters[1][2] == cheat[1][2]
						then table.move(heaters,1,1,#cheat+1,cheat)
							elseif #dheat == 0
							then table.move(heaters,1,1,#dheat+1,dheat)
								elseif heaters[1][2] == dheat[1][2]
								then table.move(heaters,1,1,#dheat+1,dheat)
									elseif #eheat == 0
									then table.move(heaters,1,1,#eheat+1,eheat)
										elseif heaters[1][2] == eheat[1][2]
										then table.move(heaters,1,1,#eheat+1,eheat)
											elseif #fheat == 0
											then table.move(heaters,1,1,#fheat+1,fheat)
												elseif heaters[1][2] == fheat[1][2]
												then table.move(heaters,1,1,#fheat+1,fheat)
													elseif #gheat == 0
													then table.move(heaters,1,1,#gheat+1,gheat)
														elseif heaters[1][2] == gheat[1][2]
														then table.move(heaters,1,1,#gheat+1,gheat)
															elseif #hheat == 0
															then table.move(heaters,1,1,#hheat+1,hheat)
																elseif heaters[1][2] == hheat[1][2]
																then table.move(heaters,1,1,#hheat+1,hheat)
																	elseif #iheat == 0
																	then table.move(heaters,1,1,#iheat+1,iheat)
																		elseif heaters[1][2] == iheat[1][2]
																		then table.move(heaters,1,1,#iheat+1,iheat)
																			elseif #jheat == 0
																			then table.move(heaters,1,1,#jheat+1,jheat)
																				elseif heaters[1][2] == jheat[1][2]
																				then table.move(heaters,1,1,#jheat+1,jheat)
																					elseif #kheat == 0
																					then table.move(heaters,1,1,#kheat+1,kheat)
																						elseif heaters[1][2] == kheat[1][2]
																						then table.move(heaters,1,1,#kheat+1,kheat)
																								elseif #lheat == 0
																								then table.move(heaters,1,1,#lheat+1,lheat)
																									elseif heaters[1][2] == lheat[1][2]
																									then table.move(heaters,1,1,#lheat+1,lheat)
	elseif #mheat == 0
	then table.move(heaters,1,1,#mheat+1,mheat)
		elseif heaters[1][2] == mheat[1][2]
		then table.move(heaters,1,1,#mheat+1,mheat)
			elseif #nheat == 0
			then table.move(heaters,1,1,#nheat+1,nheat)
				elseif heaters[1][2] == nheat[1][2]
				then table.move(heaters,1,1,#nheat+1,nheat)
					elseif #oheat == 0
					then table.move(heaters,1,1,#oheat+1,oheat)
						elseif heaters[1][2] == oheat[1][2]
						then table.move(heaters,1,1,#oheat+1,oheat)
							else print("Error, Code not working")
												
		end
	end
	print(nheaters, "total amount of heaters")
	print(#aheat+#bheat+#cheat+#dheat+#eheat+#fheat+#gheat+#hheat+#iheat+#jheat+#kheat+#lheat+#mheat+#nheat+#oheat, "listed Amount of heaters")	
	--Print the things, maybe format things if this even works
	if #aheat > 0
	then print("You have", #aheat,aheat[1][2], "Heaters")
	end
	if #bheat > 0
	then print("You have", #bheat,bheat[1][2], "Heaters")
	end
	if #cheat > 0
	then print("You have", #cheat,cheat[1][2], "Heaters")
	end
	if #dheat > 0
	then print("You have", #dheat,dheat[1][2], "Heaters")
	end
	if #eheat > 0
	then print("You have", #eheat,eheat[1][2], "Heaters")
	end
	if #fheat > 0
	then print("You have", #fheat,fheat[1][2], "Heaters")
	end
	if #gheat > 0
	then print("You have", #gheat,gheat[1][2], "Heaters")
	end
	if #hheat > 0
	then print("You have", #hheat,hheat[1][2], "Heaters")
	end
	if #iheat > 0
	then print("You have", #iheat,iheat[1][2], "Heaters")
	end
	if #jheat > 0
	then print("You have", #jheat,jheat[1][2], "Heaters")
	end
	if #kheat > 0
	then print("You have", #kheat,kheat[1][2], "Heaters")
	end
	if #lheat > 0
	then print("You have", #lheat,lheat[1][2], "Heaters")
	end
	if #mheat > 0
	then print("You have", #mheat,mheat[1][2], "Heaters")
	end
	if #heat > 0
	then print("You have", #nheat,nheat[1][2], "Heaters")
	end
	if #oheat > 0
	then print("You have", #oheat,oheat[1][2], "Heaters")
	end
	
