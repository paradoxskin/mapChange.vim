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
		
	endif
	for cmd in g:vimMap[id]
		exec cmd
	endfor
enddef

var stat = "init"
ChangeMap("init")
