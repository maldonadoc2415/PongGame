extends Node
 
var computer_goal:int = 0
var player_goal:int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$'computer_score'.text = "Computer Score: 0"
	$'player_score'.text = "Player Score: 0"
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ball_player_goal() -> void:
	player_goal += 1
	print(player_goal)
	$"player_score".text = "Player: " + str(player_goal)
	$"Ball".position.x = 574
	$"Ball".position.y = 283
	
func _on_ball_computer_goal() -> void:
	computer_goal += 1
	print(computer_goal)
	$"computer_score".text = "Computer: " + str(computer_goal)
	$"Ball".position.x = 574
	$"Ball".position.y = 283
