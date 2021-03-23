MouseFunctionTable = {
    MOUSE_BUTTON_PRESSED = {},
    MOUSE_BUTTON_RELEASED = {}
}
local x,y
local mapLength = 500
function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %s\n", event, arg);
    if MouseFunctionTable[event] and MouseFunctionTable[event][arg] then
        MouseFunctionTable[event][arg]()
    end
end
MouseFunctionTable.MOUSE_BUTTON_PRESSED[9] = function()
    x, y = GetMousePosition()
    y = y * 9 / 16
    OutputLogMessage("x = %d, y = %d \n", x, y)
end
local miniMapRatio = 1485
local largeMapRatio = 3457
MouseFunctionTable.MOUSE_BUTTON_RELEASED[9] = function()
    local nx, ny = GetMousePosition()
    local ny = ny * 9 / 16
    local dp = math.sqrt(math.pow(nx - x, 2) + math.pow(ny - y, 2))
    local miniLength = dp / miniMapRatio * mapLength
    local largeMap = dp / largeMapRatio * mapLength
    OutputLogMessage("MiniMap Distance = %f\nLargeMap Distance = %f\n", miniLength, largeMap)
end
