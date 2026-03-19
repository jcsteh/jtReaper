-- Set selected take pitch shift mode to Elastique 3.3.3 Soloist and show pitch
-- envelope
-- Version: 2026.1
-- Author: James Teh

function Main()
	local count = reaper.CountSelectedMediaItems(0)
	if count == 0 then return end
	reaper.Undo_BeginBlock()
	for i = 0, count - 1 do
		local item = reaper.GetSelectedMediaItem(0, i)
		local take = reaper.GetActiveTake(item)
		if take and not reaper.TakeIsMIDI(take) then
			-- Elastique 3.3.3 Soloist
			reaper.SetMediaItemTakeInfo_Value(take, "I_PITCHMODE", 720896)
		end
	end
	reaper.Main_OnCommand(41612, 0) -- Take: Toggle take pitch envelope
	reaper.Undo_EndBlock("Set take pitch mode and show pitch envelope", 0)
	if reaper.osara_outputMessage then
		reaper.osara_outputMessage("set take pitch mode, showed pitch envelope")
	end
end

Main()
