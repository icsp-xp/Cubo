extends Control # GameMenu

@onready var animation_menu = $AnimationMenu as AnimationPlayer
@onready var button_pause = $MarginContainer/ButtonPause as Button
@onready var transition = $"/root/Transition" as CanvasLayer


func _on_player_perso() -> void:
	animation_menu.play("MenuIn")


func _on_button_pause_up() -> void:
	button_pause.disabled = true
	animation_menu.play("MenuIn")
	
	get_tree().set_pause(true)


func _on_button_continue_button_up() -> void:
	animation_menu.play("MenuOut")
	button_pause.disabled = false
	
	get_tree().set_pause(false)


func _on_button_main_menu_button_up() -> void:
	transition.get_node("AnimationTransition").play("In")
	await transition.get_node("AnimationTransition").animation_finished
	
	var scena = load("res://Scene/MainMenu.tscn")
	get_tree().set_pause(false)
	get_tree().change_scene_to_packed(scena)


func _on_button_reload_button_up() -> void:
	transition.get_node("AnimationTransition").play("In")
	await transition.get_node("AnimationTransition").animation_finished
	
	get_tree().set_pause(false)
	get_tree().reload_current_scene()
