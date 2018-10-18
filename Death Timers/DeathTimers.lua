local L = DTLocalization

local total = 0

function DeathTimers_OnLoad(frame)
  frame:RegisterEvent("ADDON_LOADED")
  frame:RegisterForDrag("LeftButton")
end

function DeathTimers_OnEvent(self, event, ...)
  if event == "ADDON_LOADED" then
    print(L.ADDON_LOADED)
    self:UnregisterEvent("ADDON_LOADED")
    --Register Combat Events
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
  end

  if event == "PLAYER_REGEN_DISABLED" then
    print("Death Timers - Combat")
  else if event == "PLAYER_REGEN_ENABLED" then
    print("Death Timers - No Combat")
  end
end
end


SLASH_DEATHTIMERS1 = '/deathtimers'
SLASH_DEATHTIMERS2 = '/dts'
--Create slash commands to open options menu
SlashCmdList["DEATHTIMERS"] = function(self, txt)
  DTOptionsFrame:Show()
  print("DT Options")
end
