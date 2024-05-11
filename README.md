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
- Element Manipulation
```lua
local sElement("Frame"){
  
}
