--
-- Mod: RealisticSteering_Register
--
-- Author: Stephan
-- email: Stephan910@web.de
-- @Date: 11.01.2019
-- @Version: 1.0.0 

-- #############################################################################

source(Utils.getFilename("gui/rsGui.lua", g_currentModDirectory))
source(Utils.getFilename("RealisticSteering.lua", g_currentModDirectory))


RealisticSteering_Register = {};
RealisticSteering_Register.modDirectory = g_currentModDirectory;

local modDesc = loadXMLFile("modDesc", g_currentModDirectory .. "modDesc.xml");
RealisticSteering_Register.version = getXMLString(modDesc, "modDesc.version");

if g_specializationManager:getSpecializationByName("RealisticSteering") == nil then
  if RealisticSteering == nil then 
    print("ERROR: unable to add specialization 'RealisticSteering'")
  else 
    for i, typeDef in pairs(g_vehicleTypeManager.vehicleTypes) do
      if typeDef ~= nil and i ~= "locomotive" then 
        local isDrivable  = false
        local isEnterable = false
        local hasMotor    = false 
        for name, spec in pairs(typeDef.specializationsByName) do
          if name == "drivable"  then 
            isDrivable = true 
          elseif name == "motorized" then 
            hasMotor = true 
          elseif name == "enterable" then 
            isEnterable = true 
          end 
        end 
        if isDrivable and isEnterable and hasMotor then 
          --print("INFO: attached specialization 'RealisticSteering' to vehicleType '" .. tostring(i) .. "'")
          typeDef.specializationsByName["RealisticSteering"] = RealisticSteering
          table.insert(typeDef.specializationNames, "RealisticSteering")
          table.insert(typeDef.specializations, RealisticSteering)  
        end 
      end 
    end   
  end 
end 

function RealisticSteering_Register:loadMap(name)
	print("--> loaded RealisticSteering version " .. self.version .. " (by Stephan) <--");
end;

function RealisticSteering_Register:deleteMap()
  
end;

function RealisticSteering_Register:keyEvent(unicode, sym, modifier, isDown)

end;

function RealisticSteering_Register:mouseEvent(posX, posY, isDown, isUp, button)

end;

function RealisticSteering_Register:update(dt)
	
end;

function RealisticSteering_Register:draw()
  
end;

addModEventListener(RealisticSteering_Register);