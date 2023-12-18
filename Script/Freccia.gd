class_name Freccia

extends Area2D # Freccia

const DANNO = 1


@export_enum("destra", "sotto", "sinistra", "sopra") var direzione : int = 0
@export var velocita : int = 10


@onready var sprite = $Sprite2D as Sprite2D
@onready var ombra = $Sprite2D/Ombra as Sprite2D
@onready var collision_shape = $CollisionShape2D as CollisionShape2D


var direzioni : Array = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var texture : Array = [preload("res://Assets/Arco/FrecciaDestra.png"), 
					   preload("res://Assets/Arco/FrecciaSotto.png"), 
					   preload("res://Assets/Arco/FrecciaSinistra.png"),
					   preload("res://Assets/Arco/FrecciaSopra.png")]
var offset_ombra : Array = [Vector2(0, 20), Vector2(0, 20), Vector2(0, 20), Vector2(0, 20)]
var pos_collisione : Array = [Vector2(23, 0), Vector2(0, 23), Vector2(-23, 0), Vector2(0, -23)]


func _ready() -> void:
	collision_shape.position = pos_collisione[direzione]
	sprite.texture = texture[direzione]
	ombra.rotation_degrees = 90 * direzione
	ombra.position = offset_ombra[direzione]


func _physics_process(delta : float) -> void:
	match direzione:
		0: # destra
			position += velocita * direzioni[direzione] * delta * 60
		1: # sotto
			position += velocita * direzioni[direzione] * delta * 60
		2: # sinistra
			position += velocita * direzioni[direzione] * delta * 60
		3: # sopra
			position += velocita * direzioni[direzione] * delta * 60


func elimina() -> void:
	get_parent().remove_child(self)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
