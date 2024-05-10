--// This is a module
local runService = game:GetService("RunService")
local dynamicElement = require(script.dElement)
local providedElements = require(script.pElements)
local plum = {
    dLoopEvent = runService.RenderStepped,
    dLoopEventObserver = Instance.new("BindableEvent")
    dLoopStarted = false
}

-- TODO
-- loopEventObserver should probably be made into a seperate portion of code.
-- loopEventObserver should have private data and a Middleman to manipulate data.

function plum.Child(parent, child)
    child.Parent = parent
end

function plum.dynamic(eObject) -- Add reference variable and it will be set.
    return dynamicElement.new(eObject, plum.dLoopEventObserver)
end

function plum.element(eName, eAttributes, eParent)
    local _, response = pcall(Instance.new, eName)
    if response then
        for index, value in next, eAttributes do
            if type(index) == "function" then
                index(response, value)
            end
            response[index] = value
        end
    else
        error(response)
    end
    return response
end

if plum.dLoopStarted == false then
    plum.dLoopStarted = true
    dLoopEvent:Connect(function()
        dLoopEventObserver:Fire()
    end)
end

return setmetatable(plum, {__index = providedElements}) -- You can index for certain elements and create them via that.