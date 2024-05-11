# PlumUI
UI Library for Reactive UI components. Uses Roblox Luau.
## To do
- loopEventObserver should probably be made into a seperate portion of code.
- loopEventObserver should have private data and a Middleman to manipulate data.
- pElement - Prepared Element
- dElement - Dynamic Element
- sElement/element - Static Element
- Sequential Element Creation Function
  - Allows UI to be stated in a sequential order and the function will automatically handle parenting and children. Sort of the way ImGui works.
 
## API Documentation
- Element Creation
  - sElement (Static Element
  - dElement (Dynamic Element)
  - pElement (Plum/Provided Element)
- Element Manipulation (Example)
```lua
local element = plum.sElement("Frame",{
  BackgroundColor3 = Color3.new(1, 0.2, 1),
  [plum.Child "Frame"] = {
    name = "MyChild"
  },
  [plum.aChild] = {
    name = "MyChild"
    properties = {
      name = "Changed MyChild"
    }
  },
  [plum.Event "MouseEnter"] = function()
    print("Hovered")
  end
})
```
> [!TIP]
> Ensure you state your properties in the order you want them to initialize. **Ensure you initialize properties before extensions**
- Dynamic Element
```lua
local myElement = plum.sElement("Frame") -- You could use Instance.new
local dynamicElement = plum.dElement(myElement)
local i = 0
dynamicElement:Connect(function(object)
  i += 1
  object.Name = ("Water %d"):format(i)
end)
```
> [!NOTE]
> You cannot index dynamicElement for your original element. E.g `dynamicElement.Name` will error!

> [!WARNING]
> `Instance.new` is recommend if you are just creating a single component with no properties/extensions. Do not use `plum.sElement` since it has extra overhead for its protected call.
