--ALMRun������ʾ�ȼ�(����ALMRun.ini������)
--addCommand{ key = 'A-R', cmd = toggleMerry }
local DisableToggleMerryKey = false
addCommand { key = "Alt+Shift+R", cmd = function()
    if DisableToggleMerryKey then
	enableCommandKey(0)
    else
	disableCommandKey(0)
    end
    DisableToggleMerryKey = not DisableToggleMerryKey
end }

--���¼��������ļ�
addCommand{name="ReConfig",desc="���¼��������ļ�",cmd = ReConfig}

--�رյ�ǰ����ss
--addCommand{ key = 'A-Q', cmd = function()
--	closeWindow(getForegroundWindow())
--end }
--[[
local curHideWindow
addCommand{ key = 'A-H', cmd = function()
    if not curHideWindow then
        curHideWindow = GetForegroundWindow()
        ShowWindow(curHideWindow, 'hide')
    else
        ShowWindow(curHideWindow, 'normal')
        curHideWindow = nil
    end
end }
]]
if WINDOWS then
--[[
	for i = string.byte('c'), string.byte('z') do
		local disk = string.char(i).. ':'
		local isOk, errMsg = io.open(disk)
		if isOk or errMsg:find('Permission denied') then
			addCommand{name=disk,key='',cmd=disk,desc="�򿪴���"..disk}
		else
			break
		end
	end
--]]
	addCommand{ name = 'cmd', key = 'A-T', cmd = function(arg)
		local window = getForegroundWindow()
		local dir = getWindowText(window)
		shellExecute('cmd', '', dir)
	end }
--[[
	addCommand{ key = 'A-Up', cmd = function() shellExecute('nircmdc', 'changesysvolume 65535', '', 'hide') end }
	addCommand{ key = 'A-Down', cmd = function() shellExecute('nircmdc', 'changesysvolume -65535', '', 'hide') end }
	addCommand{ key = 'A-Left', cmd = function() shellExecute('nircmdc', 'changesysvolume -4000', '', 'hide') end }
	addCommand{ key = 'A-Right', cmd = function() shellExecute('nircmdc', 'changesysvolume 4000', '', 'hide') end }
--]]
elseif MAC then
	addCommand{ name = 'terminal', key = 'A-T', cmd = function() shellExecute('/Applications/Utilities/terminal.app') end }
end
--[[
addCommand{ name = 'google',desc = "��Google����", cmd = function(str) shellExecute('http://www.google.com.hk/search?q=' .. str) end }
addCommand{ name = 'googlecode',cmd = function(str) shellExecute('http://code.google.com/query/#q=' .. str) end }
addCommand{ name = 'baidu', cmd = function(str) shellExecute('http://www.baidu.com/s?wd=' .. str) end }
addCommand{ name = 'youku', cmd = function(str) shellExecute('http://www.soku.com/search_video/q_' .. str) end }
--]]