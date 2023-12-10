extends Node #main

@export_category("Propietà")
@export var numero_chiavi_nel_livello : int = 3


func _ready() -> void:
	ScriptGlobale.numero_corrente_di_chiavi = numero_chiavi_nel_livello
	if $"2D/ContenitoreChiavi".get_child_count() != numero_chiavi_nel_livello:
		print_debug("il numero totale delle chiavi dichiarete per il corrente livello è diverso dal numero effettivo. Potrebbero verificarsi comportamenti non voluti")


func _on_player_perso() -> void:
	# magari far asperttare che gli effetti e lo shake finiscano
	get_tree().set_pause(true)
