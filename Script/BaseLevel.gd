extends Node2D # BaseLevel
		
@export_category("Propietà")
@export var numero_chiavi_nel_livello : int = 3

@onready var gestione_segnali = $GestioneSegnali as GestioneSegnali


func _ready() -> void:
	ScriptGlobale.numero_corrente_di_chiavi = numero_chiavi_nel_livello
	
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "aggiorna_ui_scudo", "_on_player_aggiorna_ui_scudo")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "presa_chiave", "_on_player_aggiorna_ui_chiave")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "perso", "_on_player_perso")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Camera2D", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Effetti", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main", "perso", "_on_player_perso")
	gestione_segnali.connetti_segnali()
	
	if $ContenitoreChiavi.get_child_count() != numero_chiavi_nel_livello:
		print_debug("il numero totale delle chiavi dichiarete per il corrente livello è diverso dal numero effettivo. Potrebbero verificarsi comportamenti non voluti")
