extends Node #main

class_name BaseLevel

@export_category("Propietà")
@onready var tempo_prima_di_mostrare_GameMenu : float = 0.5
@export var ID : int = 1 # default value. 0 ignora salvatggio
@export var numero_chiavi_nel_livello : int = 3
@export var prossimo_livello : String = ""

@onready var transition = $"/root/Transition" as CanvasLayer


var config_file : ConfigFile = ConfigFile.new()
var path_salvataggio : String = "user://CuboSaves/DatiLivelli.cfg"


func salva_dati_livello() -> void:
	if ID == 0:
		return
		
	ScriptGlobale.ultimo_livello_sbloccato = max(ID, ScriptGlobale.ultimo_livello_sbloccato)
	config_file.set_value("livello", "id_ultimo_livello_sbloccato", ScriptGlobale.ultimo_livello_sbloccato)
	
	ScriptGlobale.salva_dati(config_file, path_salvataggio)


func ricarica_dati_livello() -> void:
	var config : ConfigFile = ScriptGlobale.prendi_config_file(path_salvataggio) as ConfigFile
	
	if config == null:
		return
	
	ScriptGlobale.ultimo_livello_sbloccato = config.get_value("livello", "id_ultimo_livello_sbloccato", 1)


func _ready() -> void:
	ricarica_dati_livello()
	
	transition.get_node("AnimationTransition").play("Out")
	ScriptGlobale.numero_corrente_di_chiavi = numero_chiavi_nel_livello
	
	if $"2D/ContenitoreChiavi".get_child_count() != numero_chiavi_nel_livello:
		print_debug("il numero totale delle chiavi dichiarete per il corrente livello è diverso dal numero effettivo. Potrebbero verificarsi comportamenti non voluti")


func _on_player_perso() -> void:
	salva_dati_livello()
	await get_tree().create_timer(tempo_prima_di_mostrare_GameMenu).timeout
	get_tree().set_pause(true)


func _on_player_cambia_livello() -> void: # one shot
	salva_dati_livello()
	
	transition.get_node("AnimationTransition").play("In")
	get_tree().set_pause(true)
	await transition.get_node("AnimationTransition").animation_finished
	
	if prossimo_livello != "":
		var scena = load(prossimo_livello)
		get_tree().set_pause(false)
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("non c'è un livello successivo")
