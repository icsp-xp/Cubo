extends Control #UI

@onready var h_box_container_scudi = $MarginContainerScudi/HBoxContainer as HBoxContainer
@onready var transition_menu = $Menu/TransitionMenu as AnimationPlayer
@onready var label_num_chiavi = $MarginContainerChiavi/HBoxContainer/NumChiavi as Label

var numero_icone_scudo : int
var numero_totale_chiavi : int


func _on_BaseLevel_tot_numero_chiavi(numero_chiavi : int) -> void:
	# aggiorna al valore iniziale nel caso in cui label_num_chiavi sia stato 
	# caricato prima dell'emissione del seguente segnale
	if label_num_chiavi != null:
		label_num_chiavi.text = str(numero_totale_chiavi)
		
	numero_totale_chiavi = numero_chiavi


func _ready() -> void:
	# aggiorna al valore iniziale nel caso in cui label_num_chiavi sia stato 
	# caricato dopo dell'emissione di _on_BaseLevel_tot_numero_chiavi
	label_num_chiavi.text = str(numero_totale_chiavi)
	
	numero_icone_scudo = h_box_container_scudi.get_child_count()


func _on_player_collezionata_chiave() -> void:
	label_num_chiavi.text = str(int(label_num_chiavi.text ) - 1)


func _on_player_danneggiato(scudo_rimanente: int) -> void:
	if scudo_rimanente >= 0:
		for i in range(scudo_rimanente, numero_icone_scudo):
			h_box_container_scudi.get_child(i).set_visible(false)
	else:
		h_box_container_scudi.set_visible(false)


func _on_player_perso() -> void:
	transition_menu.play("MostraMenu")
