-- Variables to track the current actions
local isPointing = false
local isHandsUp = false

-- Function to start pointing
function StartPointing()
    if not isPointing then
        isPointing = true
        TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_POINTING', 0, true)
    end
end

-- Function to stop pointing
function StopPointing()
    if isPointing then
        isPointing = false
        ClearPedTasks(PlayerPedId())
    end
end

-- Function to start hands up
function StartHandsUp()
    if not isHandsUp then
        isHandsUp = true
        TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_COP_IDLES', 0, true)
    end
end

-- Function to stop hands up
function StopHandsUp()
    if isHandsUp then
        isHandsUp = false
        ClearPedTasks(PlayerPedId())
    end
end

-- Key bindings
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Check if 'L' is pressed
        if IsControlJustPressed(1, 182) then -- 'L' key
            if isPointing then
                StopPointing()
            else
                StartPointing()
            end
        end

        -- Check if 'X' is pressed
        if IsControlJustPressed(1, 73) then -- 'X' key
            if isHandsUp then
                StopHandsUp()
            else
                StartHandsUp()
            end
        end
    end
end)