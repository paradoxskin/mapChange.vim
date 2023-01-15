vim9script

if (!exists("g:vimMap"))
	exec "source " ..  expand("<sfile>:p:h:h") .. "/mask.vim"
endif

def ChangeMap(id: string): void
	# find if id in dict
	try
	   var ttmp = g:vimMap[id]
	catch /E716/
		echo "[x] MASK_" .. id .. " not Found."
		return
	endtry

	try
		if (stat != id)
			# clear stat's map
			for cmd in g:vimMap[stat]
				var tmp = split(cmd)
				if (match(tmp[0], "map") != -1)
					try
						exec tmp[0][0] .. "unmap " .. tmp[1]
					catch /E31/
						continue
					catch /E492/
						try
							exec "unmap" .. tmp[1]
						catch /E31/
							continue
						endtry
					endtry
				endif
			endfor
		elseif (stat != "init")
			return
		endif
		for cmd in g:vimMap[id]
			exec cmd
		endfor
		stat = id
	catch /E716/
		echo "[x] MASK_" .. id .. " not Found."
	catch /E474/
		echo "[x] MASK_" .. id .. " not Found."
	endtry
enddef

var stat = "init"
ChangeMap("init")

if (!exists(":ChgMap"))
  command -nargs=1 ChgMap call ChangeMap(<q-args>)
endif
