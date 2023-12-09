class_name GestioneSegnali

extends Node

##
# da nodo collego a scena il segnale aa (segnale di nodo) come _aa (nome metodo)
# { ^"nodo": { ^"scena": [["aa", "_aa"]] } }
#
# da nodo collego a scena il segnale aa (segnale di nodo) come _aa (nome metodo) e
# wwa (segnale di nodo) come _wwa (nome medtodo), da nodo collego a camera
# wwa (segnale di nodo) come _wwa (nome medtodo)
# { ^"nodo": { ^"scena": [["aa", "_aa"], ["wwa", "_wwa"]], ^"camera": [["wwa", "_wwa"]] } }
var segnali_da_connttere : Dictionary


func _init() -> void:
	segnali_da_connttere = {}


# aggiuge i segneli da connettere a segnali_da_connttere
func aggiungi_segnale(path_nodo_partenza : NodePath, path_nodo_arrivo : NodePath, nome_segnale : String, nome_metodo : String) -> bool:
	if segnali_da_connttere.has(path_nodo_partenza):
		if segnali_da_connttere[path_nodo_partenza].has(path_nodo_arrivo):
			for seganle in segnali_da_connttere[path_nodo_partenza][path_nodo_arrivo]:
				if seganle[0] == nome_segnale:
					print_debug("è gia presente un segnale con lo stesso nome")
					return false
					
			segnali_da_connttere[path_nodo_partenza][path_nodo_arrivo].append([nome_segnale, nome_metodo])
		else:
			segnali_da_connttere[path_nodo_partenza][path_nodo_arrivo] = [[nome_segnale, nome_metodo]]
	else:
		segnali_da_connttere[path_nodo_partenza] = {path_nodo_arrivo : [[nome_segnale, nome_metodo]]}
		
	return true


# una volta connessi i segnali vengono rimossi da segnali_da_connettere
func connetti_segnali() -> bool:
	for nodo_partenza_path in segnali_da_connttere.keys():
		for nodo_arrivo_path in segnali_da_connttere[nodo_partenza_path].keys():
			for segnali in segnali_da_connttere[nodo_partenza_path][nodo_arrivo_path]:
				var nodo_partenza = get_node(nodo_partenza_path)
				var nodo_arrivo = get_node(nodo_arrivo_path)
				
				if nodo_partenza == null or nodo_arrivo == null:
					print_debug("nodo partenza o nodo arrivo nulli")
					return false
					
				if nodo_partenza.is_connected(segnali[0], Callable(nodo_arrivo, segnali[1])):
					print_debug("il segnale '", segnali[0], "' di '", nodo_partenza, "' è gia connesso a '", nodo_arrivo, "' con il metodo '", segnali[1], '\'')
					return false
				else:
					var messaggio_err = nodo_partenza.connect(segnali[0], Callable(nodo_arrivo, segnali[1]))
					
					if messaggio_err != OK:
						print_debug("non è stato possibile connettere il segnale '", segnali[0], "' di '", nodo_partenza, "' è gia connesso a '", nodo_arrivo, "' con il metodo '", segnali[1], '\'', "   ERROR: ", messaggio_err)
						return false
						
	segnali_da_connttere.clear()
	return true


