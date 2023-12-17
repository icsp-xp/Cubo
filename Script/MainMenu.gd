extends Control # MainMuenu

@export var primo_livello : String = ""
@export var tutorial : String = ""

@onready var transition = $"/root/Transition" as CanvasLayer
@onready var button_play = $VBoxContainer/ButtonPlay
@onready var button_tutorial = $VBoxContainer/ButtonTutorial
@onready var button_exit = $MarginContainer/ButtonExit


func  _ready() -> void:
	transition.get_node("AnimationTransition").play("Out")


func _on_button_play_button_up() -> void:
	if primo_livello != "":
		transition.get_node("AnimationTransition").play("In")
		await transition.get_node("AnimationTransition").animation_finished
		var scena = load(primo_livello)
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("non c'è una scena selezionata come primo_livello")


func _on_button_tutorial_button_up() -> void:
	if tutorial != "":
		transition.get_node("AnimationTransition").play("In")
		await transition.get_node("AnimationTransition").animation_finished
		var scena = load(tutorial)
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("non c'è una scena selezionata come tutorial")


func _on_button_exit_button_up() -> void:
	transition.get_node("AnimationTransition").play("In")
	await transition.get_node("AnimationTransition").animation_finished
	get_tree().quit()
