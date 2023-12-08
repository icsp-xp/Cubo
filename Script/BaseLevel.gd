extends Node2D # BaseLevel

@onready var gestione_segnali = $GestioneSegnali as GestioneSegnali


func _ready() -> void:
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/UI", "perso", "_on_player_perso")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Camera2D", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main/Effetti", "danneggiato", "_on_player_danneggiato")
	gestione_segnali.aggiungi_segnale("../Player", "/root/Main", "perso", "_on_player_perso")
	gestione_segnali.connetti_segnali()
