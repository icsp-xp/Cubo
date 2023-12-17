extends Control # LivelliMenu

@onready var transition = $"/root/Transition" as CanvasLayer


func _ready() -> void:
	transition.get_node("AnimationTransition").play("Out")


func cambia_scena(path : String) -> void:
	transition.get_node("AnimationTransition").play("In")
	await transition.get_node("AnimationTransition").animation_finished
	
	var scena = load(path) as PackedScene
	
	if scena != null:
		get_tree().change_scene_to_packed(scena)
	else:
		print_debug("scena non valida")


func _on_button_livello_1_button_up(extra_arg_0 : String) -> void:
	cambia_scena(extra_arg_0)


func _on_button_livello_2_button_up(extra_arg_0) -> void:
	cambia_scena(extra_arg_0)


func _on_button_livello_3_button_up(extra_arg_0) -> void:
	cambia_scena(extra_arg_0)
