extends Control #UI

@onready var h_box_container_scudi = $MarginContainerScudi/HBoxContainer as HBoxContainer
@onready var transition_menu = $Menu/TransitionMenu as AnimationPlayer
@onready var label_num_chiavi = $MarginContainerChiavi/HBoxContainer/NumChiavi as Label

var numero_icone_scudo : int
var numero_totale_chiavi : int


func _ready() -> void:
	label_num_chiavi.text = str(ScriptGlobale.numero_corrente_di_chiavi)
	
	numero_icone_scudo = h_box_container_scudi.get_child_count()


func _on_player_aggiorna_ui_chiave() -> void:
	label_num_chiavi.text = str(ScriptGlobale.numero_corrente_di_chiavi)


func _on_player_aggiorna_ui_scudo() -> void:
	for i in range(ScriptGlobale.numero_corrente_di_scudi, numero_icone_scudo):
		h_box_container_scudi.get_child(i).set_visible(false)



func _on_player_perso() -> void:
	transition_menu.play("MostraMenu")
