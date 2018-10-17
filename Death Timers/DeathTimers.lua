local total = 0

function DeathTimers_OnLoad(self)
  self:RegisterEvent("ADDON_LOADED")
end

function DeathTimers_OnEvent(self, event, ...)
  if event == "ADDON_LOADED" then

    self:UnregisterEvent("ADDON_LOADED")
    --Combat Events to watch for main addon frame
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
  end
  --When entering combat, show frame
  if event == "PLAYER_REGEN_DISABLED" then
    print("Death Timers - Entering Combat")
  else if event == "PLAYER_REGEN_ENABLED" then
    print("Death Timers - Leaving Combat")
  end
end

DTFrame:SetScript("OnEvent", DeathTimers_OnEvent)

--Create Options frame if doesnt exist
if not DTOptionsFrame then
  CreateFrame("Frame", "DTOptionsFrame", UIParent)
  tinsert(UISpecialFrames, DTOptionsFrame)
  DTOptionsFrame.Size(500, 500)

end

SLASH_DEATHTIMERS1 = '/deathtimers'
SLASH_DEATHTIMERS2 = '/dts'
--Create slash commands to open options menu
SlashCmdList["DEATHTIMERS"] = function(self, txt)
  DTOptionsFrame:Show()
  print("DT Options")
end
