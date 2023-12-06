extends Control #UI

@onready var h_box_container = $MarginContainer/HBoxContainer as HBoxContainer

var numero_icone_scudo : int


func _ready() -> void:
	numero_icone_scudo = h_box_container.get_child_count()


func _on_player_danneggiato(scudo_rimanente: int) -> void:
	if numero_icone_scudo > scudo_rimanente and h_box_container.get_child(scudo_rimanente).is_visible():
		h_box_container.get_child(scudo_rimanente).set_visible(false)
		
		# cambiare texture invece di fare scomparire
		# fare una scene apposita per le immagini dello scudo in modo da rendere 
		# più semplice la gestione
