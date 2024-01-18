extends Sprite2D

var speed = 200  
var direction = Vector2(1, 1).normalized() 
var rounds = 0
var initial_position: Vector2

var player1_score = 0
var player2_score = 0
var player1_label: Label
var player2_label: Label



func _ready() -> void:
	initial_position = position
	direction = Vector2(randf(), randf()).normalized()
	player1_label = get_node("/root/Play_Scene/Score_Player")
	player2_label = get_node("/root/Play_Scene/Score_Enemy")
	
func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_HorizontalBorder_body_entered(body: Node) -> void:
	print("Horizontal wall collided!")
	direction.y *= -1
	speed += 50

func _on_HorizontalBorder2_body_entered(body: Node) -> void:
	print("Horizontal wall collided!")
	direction.y *= -1 
	speed += 50

func _on_VerticalBorder_body_entered(body: Node) -> void:
	print("Vertical wall collided!")
	reset_ball()
	speed += 50
	player2_score += 1
	player2_label.text = "Enemy Score: " + str(player2_score)
	check_score(2)
	
func _on_VerticalBorder2_body_entered(body: Node) -> void:
	print("Vertical wall collided!")
	reset_ball()
	speed += 50
	player1_score += 1
	player1_label.text = "Player Score: " + str(player1_score)
	check_score(1)
	
func reset_ball() -> void:
	position = initial_position
	rounds += 1
	speed = 200
	print("Round:", rounds)

func _on_Paddle_body_entered(body: Node) -> void:
	direction.x *= -1  

func check_score(player: int) -> void:
	if player == 1:
		if player1_score >= 5:
			game_over("Player 1 Wins!")
		else:
			reset_ball()
	elif player == 2:
		if player2_score >= 5:
			game_over("Player 2 Wins!")
		else:
			reset_ball()

func game_over(message: String) -> void:
	get_tree().change_scene_to_file("res://Scene/Game_Over_Scene.tscn")
