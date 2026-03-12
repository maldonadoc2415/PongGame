extends Area2D


@export var speed: int = 250

var direction = Vector2(0, 0)
var screen_size

signal PlayerGoal
signal ComputerGoal

func _ready() -> void:
	screen_size = get_window().size
	reset_ball()

func _process(delta: float) -> void: 
	position = position + direction * (speed * delta)
	if position.y >= screen_size.y:
		position.y = screen_size.y - 1 
		direction.y *= -1
	elif position.y <= 0:
		position.y = 1 
		direction.y *= -1
		
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player1" or area.name == "Computer":
		direction.x *= -1 
		speed += 10 
	if area.name == "ComputerGoal":
		emit_signal("ComputerGoal")
	elif area.name == "PlayerGoal":
		emit_signal("PlayerGoal")

func set_random_direction():
	var choices = [-1, 1]
	return choices.pick_random()

func reset_ball():
	position = screen_size / 2
	speed = 250
	direction = Vector2(set_random_direction(), set_random_direction())

func _on_computer_goal() -> void:
	reset_ball()

func _on_player_goal() -> void:
	reset_ball()
