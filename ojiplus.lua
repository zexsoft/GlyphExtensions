name = "OJI+"
a = 0

-- Glyph extension designed for competitive programming

function OnLoad()
	AddMenuItem("IO Fisier Wizard", "OJI+ ItemIOWiz")
	AddMenuItem("PbInfo", "OJI+ ItemPbinfo")
	AddMenuItem("Codeforces", "OJI+ ItemCf")
	AddMenuItem("Todo", "OJI+ ItemTodo")
end

function ItemFisier()
	a = a+1
	Insert("ifstream fin(\".in\");\nofstream fout(\".out\");\n")
	AddLogEntry("Inserted 'fisier'.")
end

function ItemPbinfo()
	a = a+1
	n = GetProjectName()
	l = string.len(n)
	Execute("www.pbinfo.ro/probleme/" .. string.sub(n, 2, l))
	AddLogEntry("Opening PbInfo.")
end

function ItemCf()
	a = a+1
	n = GetProjectName()
	l = string.len(n)
	Execute("www.codeforces.com/problemset/problem/" .. string.sub(n, 0, l-1) .. "/" .. string.sub(n, l))
	AddLogEntry("Opening CF.")
end

function ItemIOWiz()
	a = a+1
	n = ShowInputBox("Enter IO name", "OJI+")
	InsertAt("ifstream fin(\"" .. n .. ".in\");\nofstream fout(\"" .. n .. ".out\");", 49)
	Save()
	sleep(5)
	AddIO(n)
	sleep(5)
	AddLogEntry("'Fisier' wizard complete.")
end

function ItemTodo()
	a = a+1
	Execute(RenderPath("[root]Items\\todo.txt"))
end

function AddIO(p)
	CreateFile(RenderPath("[prjDir]\\" .. p .. ".in"))
	CreateFile(RenderPath("[prjDir]\\" .. p .. ".out"))
	AddSheet(RenderPath("[prjDir]\\" .. p .. ".in"))
	AddSheet(RenderPath("[prjDir]\\" .. p .. ".out"))
	AddLogEntry("Created IO.")
end

function OnLogCommand(args)
	a = a+1
	DialogBox("OJI+ used " .. tostring(a) .. " times.", "OJI+")
end

function sleep(s)	
	local ntime = os.clock() + s/10
	repeat until os.clock() > ntime
end