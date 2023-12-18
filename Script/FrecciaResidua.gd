extends Sprite2D # FrecciaResidua

@export_enum("destra", "sotto", "sinistra", "sopra") var direzione : int = 0
@export var life_time : float = 2.0


@onready var timer = $Timer as Timer


var _texture : Array = [preload("res://Assets/Arco/FrecciaDestra.png"), 
					   preload("res://Assets/Arco/FrecciaSotto.png"), 
					   preload("res://Assets/Arco/FrecciaSinistra.png"),
					   preload("res://Assets/Arco/FrecciaResiduaSopra.png")]

var posizioni : Array = [Vector2(-40, -12), Vector2(0, -40), Vector2(40, -12), Vector2(0, 40)]


func _ready() -> void:
	if direzione == 3:
		z_index = 1
	
	position = posizioni[direzione]
	texture = _texture[direzione]
	
	timer.set_wait_time(life_time)
	timer.start()


func _on_timer_timeout() -> void: 
	var tween = create_tween()
	tween.tween_property(self, "self_modulate", Color(1.1, 1.1, 1.1, 0.0), 0.2)
	await tween.finished
	queue_free()
