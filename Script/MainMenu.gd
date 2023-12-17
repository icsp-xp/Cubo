extends Control # MainMuenu

@export var livelli_menu : String = ""
@export var tutorial : String = ""


@onready var transition = $"/root/Transition" as CanvasLayer
@onready var button_play = $VBoxContainer/ButtonPlay as Button
@onready var button_tutorial = $VBoxContainer/ButtonTutorial as Button
@onready var button_exit = $MarginContainer/ButtonExit as Button
@onready var animation_settings = $Settings/AnimationSettings as AnimationPlayer
@onready var button_music = $Settings/Control/VBoxContainer2/ButtonMusic as Button
@onready var button_sfx = $Settings/Control/VBoxContainer2/ButtonSFX as Button


var config_file : ConfigFile = ConfigFile.new()


func  _ready() -> void:
	ricarica_dati_menu()
	
	transition.get_node("AnimationTransition").play("Out")


func _on_button_play_button_up() -> void:
	if livelli_menu != "":
		transition.get_node("AnimationTransition").play("In")
		await transition.get_node("AnimationTransition").animation_finished
		
		ScriptGlobale.salva_dati(config_file, "res://Salvataggi/datiMainMenu.cfg")
		
		var scena = load(livelli_menu)
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("non c'è una scena selezionata come livelli_menu")


func _on_button_tutorial_button_up() -> void:
	if tutorial != "":
		transition.get_node("AnimationTransition").play("In")
		await transition.get_node("AnimationTransition").animation_finished
		
		ScriptGlobale.salva_dati(config_file, "res://Salvataggi/datiMainMenu.cfg")
		
		var scena = load(tutorial)
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("non c'è una scena selezionata come tutorial")


func _on_button_exit_button_up() -> void:
	transition.get_node("AnimationTransition").play("In")
	await transition.get_node("AnimationTransition").animation_finished
	
	ScriptGlobale.salva_dati(config_file, "res://Salvataggi/datiMainMenu.cfg")
	
	get_tree().quit()


func _on_button_settings_toggled(toggled_on : bool) -> void:
	if toggled_on:
		animation_settings.play("In")
	else:
		animation_settings.play("Out")


func _on_button_sfx_toggled(toggled_on : bool) -> void:
	if toggled_on:
		config_file.set_value("stato_pulsanti", "is_pressed_button_sfx", true)
		AudioServer.set_bus_mute(1, true)
		config_file.set_value("audio", "is_mute_sfx", true)
	else:
		config_file.set_value("stato_pulsanti", "is_pressed_button_sfx", false)
		AudioServer.set_bus_mute(1, false)
		config_file.set_value("audio", "is_mute_sfx", false)


func _on_button_music_toggled(toggled_on : bool) -> void:
	if toggled_on:
		config_file.set_value("stato_pulsanti", "is_pressed_button_music", true)
		AudioServer.set_bus_mute(2, true)
		config_file.set_value("audio", "is_mute_music", true)
	else:
		config_file.set_value("stato_pulsanti", "is_pressed_button_music", false)
		AudioServer.set_bus_mute(2, false)
		config_file.set_value("audio", "is_mute_music", false)


func ricarica_dati_menu() -> void:
	var config : ConfigFile = ScriptGlobale.prendi_config_file("res://Salvataggi/datiMainMenu.cfg") as ConfigFile
	
	if config == null:
		return
	
	AudioServer.set_bus_mute(2, config.get_value("audio", "is_mute_music", false))
	AudioServer.set_bus_mute(1, config.get_value("audio", "is_mute_sfx", false))
	button_music.button_pressed = config.get_value("stato_pulsanti", "is_pressed_button_music", false)
	button_sfx.button_pressed = config.get_value("stato_pulsanti", "is_pressed_button_sfx", false)


