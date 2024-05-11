--// This is a module
local runService = game:GetService("RunService")
local aDynamicElement = require(script.dynamicElement)
local aProvidedElement = require(script.providedElements)
local plum = {
    dLoopEvent = runService.RenderStepped,
    dLoopEventObserver = Instance.new("BindableEvent")
    dLoopStarted = false
}
---- Plum (Events)
plum.Lifecycle = plum.dLoopEventObserver

---- Internal
local function _setProperties(object, properties)
    for index, value in next, eAttributes do
        if type(index) == "function" then
            index(object, value)
        end
        object[index] = value
    end
end
---- Property Extensions (Functions)
function plum.Event(rsName) -- (Remote Signal Name)
    return function(eElement, callback)
        local rsEvent
        rsEvent = eElement[event_name]
        if rsEvent then
            rsEvent:Connect(callback)
        end
    end
end

function plum.aChild(eElement, args)
    if args.name and args.properties then
        _setProperties(eElement[args.name], args.properties)
    end
end

function plum.Child(parent, child)
    child.Parent = parent
end
---- Plum Methods
function plum.dElement(eObject) -- Add reference variable and it will be set.
    return aDynamicElement.new(eObject, plum.dLoopEventObserver)
end

function plum.sElement(eName, eAttributes, eParent)
    local _, iResponse = pcall(Instance.new, eName)
    if iResponse then
        _setProperties(iResponse, eAttributes)
    else
        error(iResponse)
    end
    return iResponse
end

if plum.dLoopStarted == false then
    plum.dLoopStarted = true
    dLoopEvent:Connect(function()
        dLoopEventObserver:Fire()
    end)
end

return setmetatable(plum, {__index = aProvidedElement}) -- You can index for certain elements and create them via that.
