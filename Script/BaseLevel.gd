extends Node2D # BaseLevel

class_name BaseLevel

@export_category("Connessione Segnali")
# struttura dizionario
#struttura_segnali
#{
#	"percorso_nodo_partenza" : 
#			{
#				percorso_nodo_arrivo : [[nome segnali da connettere, nome segnale da ricevere]]
#			}
#}
@export var struttura_segnali : Dictionary = {}


func _ready() -> void:
	
	for percorso_nodo_partenza in struttura_segnali.keys():
		for percorso_nodo_arrivo in struttura_segnali.get(percorso_nodo_partenza):
			var nodo_partenza : Node = get_node(percorso_nodo_partenza)
			var nodo_arrivo : Node = get_node(percorso_nodo_arrivo)
			
			for coppia_segnali in struttura_segnali[percorso_nodo_partenza].get(percorso_nodo_arrivo):
				nodo_partenza.connect(coppia_segnali[0], Callable(nodo_arrivo, coppia_segnali[1]))
