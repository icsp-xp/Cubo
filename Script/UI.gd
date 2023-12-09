extends Control #UI

@onready var h_box_container = $MarginContainer/HBoxContainer as HBoxContainer
@onready var transition_menu = $Menu/TransitionMenu as AnimationPlayer

var numero_icone_scudo : int


func _ready() -> void:
	numero_icone_scudo = h_box_container.get_child_count()


func _on_player_danneggiato(scudo_rimanente: int) -> void:
	if scudo_rimanente >= 0:
		for i in range(scudo_rimanente, numero_icone_scudo):
			h_box_container.get_child(i).set_visible(false)
	else:
		h_box_container.set_visible(false)


func _on_player_perso() -> void:
	transition_menu.play("MostraMenu")
