extends Node2D # BaseLevel

signal tot_numero_chiavi(numero_chiavi : int)

@export var numero_chiavi_livello : int = 3

@onready var gestione_segnali = $GestioneSegnali as GestioneSegnali


func _ready() -> void:
	gestione_segnali.aggiungi_segnale("../", "/root/Main/UI", "tot_numero_chiavi", "_on_BaseLevel_tot_numero_chiavi")
	gestione_segnali.connetti_segnali()
	emit_signal("tot_numero_chiavi", numero_chiavi_livello)
	
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "collezionata_chiave", "_on_player_collezionata_chiave")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "perso", "_on_player_perso")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Camera2D", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Effetti", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main", "perso", "_on_player_perso")
	gestione_segnali.connetti_segnali()
	
	if $ContenitoreChiavi.get_child_count() != numero_chiavi_livello:
		print_debug("il numero totale delle chiavi dichiarete per il corrente livello è diverso dal numero effettivo. Potrebbero verificarsi comportamenti non voluti")
