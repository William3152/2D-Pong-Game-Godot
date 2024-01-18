extends Node2D

var speed = 200
var ball_reference: Node2D  

func _ready() -> void:
	ball_reference = get_node("/root/Play_Scene/Ball")  

func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	if ball_reference.position.y > position.y:
		direction.y += 1
	elif ball_reference.position.y < position.y:
		direction.y -= 1
	direction = direction.normalized() * speed
	position += direction * delta
	position.y = clamp(position.y, -get_viewport_rect().size.y / 2 + 50, get_viewport_rect().size.y / 2 - 50)
