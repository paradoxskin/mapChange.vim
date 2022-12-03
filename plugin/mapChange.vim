vim9script
if (!exists("g:vimMap"))
	g:vimMap = {
		"init": [
		]
	}
endif

def ChangeMap(id: string): void
	if (stat != id)
		# clear stat's map
		for cmd in g:vimMap[stat]
			if (match(split(cmd)[0], "map") != -1)
				exec "unmap " .. split(cmd)[1]
			endif
		endfor
		stat = id
	elseif (stat != "init")
		return
	endif
	for cmd in g:vimMap[id]
		exec cmd
	endfor
enddef

var stat = "init"
ChangeMap("init")

if (!exists(":ChgMap"))
  command -nargs=1 ChgMap call ChangeMap(<q-args>)
endif
