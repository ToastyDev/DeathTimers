local L = DTLocalization

local combatTime = 0
local endTime = 0
local totalElapsedTime = 0
local timeLeft = 0
local totalDPS = 0

function DeathTimers_OnLoad(frame)
  frame:RegisterEvent("ADDON_LOADED")
  frame:RegisterForDrag("LeftButton")
end

function DeathTimers_OnEvent(self, event, ...)
  if event == "ADDON_LOADED" then
    print(L.ADDON_LOADED)
    DTFrameTitle:SetText(L.Title_Text)
    self:UnregisterEvent("ADDON_LOADED")
    --Register Combat Events
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")

  elseif event == "PLAYER_REGEN_DISABLED" then
    print("Death Timers - Combat")
    combatTime = GetTime()
    TimerText_Update(combatTime)

  elseif event == "PLAYER_REGEN_ENABLED" then
    print("Death Timers - No Combat")
    endTime = GetTime()
  end
end

function DeathTimers_OnUpdate(self, elapsedTime)
  totalElapsedTime = totalElapsedTime + elapsedTime
end

function CombatTimeText_Update()
  DTFrameTimeLeft:SetText("Kill in: ")
end

function DPSText_Update()
  DTFrameGrpDPS:SetText("Group DPS: ")
end

function TimerText_Update(time)
  DTFrameCombatTime:SetText("Combat Time: " .. time)
end

SLASH_DEATHTIMERS1 = '/deathtimers'
SLASH_DEATHTIMERS2 = '/dts'
--Create slash commands to open options menu
SlashCmdList["DEATHTIMERS"] = function(self, txt)
  DTOptionsFrame:Show()
end
