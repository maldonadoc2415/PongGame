extends Node2D

@export var ball:Area2D 
var speed:float = 50.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y != ball.position.y:
		position.y = move_toward(position.y, ball.position.y, delta * 1000)
		


func _on_ball_computer_goal() -> void:
	pass # Replace with function body.
