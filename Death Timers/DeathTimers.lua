SLASH_DEATHTIMERS1 = '/deathtimers'
SLASH_DEATHTIMERS2 = '/dts'

local total = 0

--Create slash commands to open options menu
SlashCmdList["DEATHTIMERS"] = function(self, txt)
  print("Death Timers Options Open Here")
end

--Create DTFrame if doesnt exist
if not DTFrame then
  CreateFrame("Frame", "DTFrame", UIParent)
end
--Combat Events to watch for main addon frame
DTFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
DTFrame:RegisterEvent("PLAYER_REGEN_DISABLED")

--When entering combat, show frame
function DTFrame_OnEvent(self, event, ...)
  if event == "PLAYER_REGEN_DISABLED" then
    print("Death Timers - Entering Combat")
  else if event == "PLAYER_REGEN_ENABLED" then
    print("Death Timers - Leaving Combat")
  end
end
end

DTFrame:SetScript("OnEvent", DTFrame_OnEvent)


--Create Options frame if doesnt exist
if not OptionsFrame then
  CreateFrame("Frame", "OptionsFrame", UIParent)
end
