-- �߼�ģʽ,ʹ��LUA�����Զ�������
addCommand{ name = "test_func", desc = "���������",cmd = function(arg,id,flags)
	message('����',"����test����,����:"..arg..',����ID:'..id)
end}

-- ��ͨģʽ,ֱ�ӵ���cmd����ָ���ĳ���
addCommand{ name = "test_cmd", desc = "�����������",cmd = [[cmd.exe /c pause >nul|echo ����:]]}
addCommand{ name = "test_notepad", desc = "Notepad",cmd = [[%WinDir%\notepad.exe]]}
addCommand{ name = "EmptyRecycle", desc = "��ջ���վ",cmd = function () EmptyRecycleBin() end }
--[[
 ɨ��ָ��Ŀ¼�Զ��������
 scan_dir(PATH,EXT,SUB)
 PATH  Ҫɨ���Ŀ¼
 EXT   ��������*.exe(����.exe���ļ�),k*.exe(������k��ͷ���ļ�)
 SUB   ɨ�輶��,Ĭ��(-1)
       -1 ����.
       0  ������Ŀ¼
       N  N����Ŀ¼
]]
--�°潨����ALMRun.ini�����.�ٶȻ�ȽϿ�.
--scan_dir([[E:\��ɫ���]],"*.exe")

-- �Զ���ӳ���˵�����(�°�ĵ�ALMRun.ini��)
--scan_dir(GetShellFolder(2),"*.lnk")
-- �Զ���������ݷ�ʽ
--scan_dir(GetShellFolder(0),"*.lnk")

-- ����altrun������
altrun_config("ShortCutList.txt")

-- ����ƥ��ģʽ(������ALMRUN.INI��������)
-- 1 ƥ�俪ͷ
-- 2 ʹ��lua����HookCompre�Զ���ƥ��
-- 0 Ĭ��,����λ��ƥ��
--config{CompareMode=0}
-- ����ƥ�亯��,�����Լ���չ,��CompareModeΪ2ʱ����
--function HookCompare(commandName,Prefix)
--	return commandName:lower():find(Prefix:lower())
--end
