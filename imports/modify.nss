// modify items
// Remove items by identifiers
modify(mode=mode.multiple 
	where=this.id(
		id.restore_previous_versions,
		id.cast_to_device,
		id.include_in_library,
		id.share,
		id.give_access_to
	)
	vis=vis.remove)

modify(type="recyclebin" where=window.is_desktop and this.id==id.empty_recycle_bin pos=1 sep)

modify(find="Désépingler*" menu="Favoris/Menu")
modify(find="Épingler*" menu="Favoris/Menu")
modify(find="Ajouter aux*" menu="Favoris/Menu")
modify(find="Supprimer de l'accès rapide" pos=1 menu="Favoris/Menu")

modify(where=str.equals(this.name, ["open in terminal", "open linux shell here", "Ouvrir dans le Terminal", "Ouvrir la fenêtre PowerShell ici"]) || this.id==id.open_powershell_window_here
	pos="bottom" menu="Terminal")

modify(mode=mode.multiple
	where=this.id(
		id.rotate_left,
		id.rotate_right,
		id.map_network_drive,
		id.disconnect_network_drive,
		id.format,
		id.eject
	)
	pos="top" menu=title.more_options)

modify(find="Toujours disponible hors connexion*" pos=1 menu=title.more_options)
modify(find="Choisir comme arrière-plan*" pos=1 menu=title.more_options)
modify(find="Faire pivoter à*" pos=1 menu=title.more_options)
modify(find="Faire pivoter à*" pos=1 menu=title.more_options)
modify(find="Formater*" pos=1 menu=title.more_options)

remove(where=str.equals(this.name, ["Nouveau", "Envoyer vers", "Imprimer", "Activer Bitlocker"]))
remove(find="Résoudre les problèmes de*")
remove(find="Copier en tant que chemin*")
remove(find="Personnaliser ce dossier*")
remove(find="Extraire tout*")
remove(find="AMD Software*")