local dElement = {}
local dMethods = {}
local dElementMeta = {
    __index = dMethods
}

function dElement.new(eObject, dLoopEventObserver)
    local dStruct = {
        dObject = dObject,
        dObservable = dLoopEventObserver
    }-- This does consume more memory sadly...

    return setmetatable(dStruct, dElementMeta)
end

function dElement:Connect(dLoopEventCallback)
    return self.dObservable:Connect(function()
        dLoopEventCallback(self.dObject, self)
    end)
end

function dElement:Update(eAttributes)
    for key, value in next, eAttributes do
        self.dObject[key] = value
    end
end

return dElement