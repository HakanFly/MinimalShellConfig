menu(where=sel.count>0 type='file|dir|drive|namespace|back' mode="multiple" title='File Manage' image=\uE253)
{
	//item(mode="single" type="file" title="Change extension" image=\uE0B5 cmd=if(input("Change extension", "Type extension"), 
	//	io.rename(sel.path, path.join(sel.dir, sel.file.title + "." + input.result))))

	menu(separator="before" type='file|dir|back.dir' mode="single" title='Attributes' image=[\uE194,#f00])
	{
		$atrr = io.attributes(sel.path)
		item(title='Hidden' checked=io.attribute.hidden(atrr)
			cmd args='/c ATTRIB @if(io.attribute.hidden(atrr),"-","+")H "@sel.path"' window=hidden)
		
		item(title='System' checked=io.attribute.system(atrr)
			cmd args='/c ATTRIB @if(io.attribute.system(atrr),"-","+")S "@sel.path"' window=hidden)
			
		item(title='Read-Only' checked=io.attribute.readonly(atrr)
			cmd args='/c ATTRIB @if(io.attribute.readonly(atrr),"-","+")R "@sel.path"' window=hidden)
			
		item(title='Archive' checked=io.attribute.archive(atrr)
			cmd args='/c ATTRIB @if(io.attribute.archive(atrr),"-","+")A "@sel.path"' window=hidden)
		separator
		item(title="CREATED" keys=io.dt.created(sel.path, 'y/m/d') cmd=io.dt.created(sel.path,2000,1,1))
		item(title="MODIFIED" keys=io.dt.modified(sel.path, 'y/m/d') cmd=io.dt.modified(sel.path,2000,1,1))
		item(title="ACCESSED" keys=io.dt.accessed(sel.path, 'y/m/d') cmd=io.dt.accessed(sel.path,2000,1,1))
	}

	menu(mode="single" type='file' find='.dll|.ocx' separator="before" title='Register Server' image=\uea86)
	{
		item(title='Register' admin cmd='regsvr32.exe' args='@sel.path.quote' invoke="multiple")
		item(title='Unregister' admin cmd='regsvr32.exe' args='/u @sel.path.quote' invoke="multiple")
	}

	menu(mode="single" type='back' expanded=true)
	{
		separator
		item(title='Nouveau Dossier' cmd=io.dir.create(sys.datetime("ymdHMSs")) image=icon.new_folder)
		
		menu(title='Nouveau Fichier' image=icon.new_file)
		{
			$dt = sys.datetime("ymdHMSs")
			item(title='TXT' cmd=io.file.create('@(dt).txt', ''))
			item(title='JSON' cmd=io.file.create('@(dt).json', '[]'))
			//item(title='HTML' cmd=io.file.create('@(dt).html', "<html>\n\t<head>\n\t</head>\n\t<body>Hello World!\n\t</body>\n</html>"))					
		}
	}

	menu(separator="before" title=title.copy_path image=icon.copy_path)
	{
		item(where=sel.count > 1 title='Copy (@sel.count) items selected' cmd=command.copy(sel(false, "\n")))
		item(mode="single" title=@sel.path tip=sel.path cmd=command.copy(sel.path))
		item(mode="single" type='file' separator="before" find='.lnk' title='open file location')
		separator
		item(mode="single" where=@sel.parent.len>3 title=sel.parent cmd=@command.copy(sel.parent))
		separator
		item(mode="single" type='file|dir|back.dir' title=sel.file.name cmd=command.copy(sel.file.name))
		item(mode="single" type='file' where=sel.file.len != sel.file.title.len title=@sel.file.title cmd=command.copy(sel.file.title))
		item(mode="single" type='file' where=sel.file.ext.len>0 title=sel.file.ext cmd=command.copy(sel.file.ext))
	}
	
	item(where=!wnd.is_desktop title=title.folder_options image=icon.folder_options cmd=command.folder_options)
}