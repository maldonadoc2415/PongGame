extends Area2D
# difference between VAr and Constant
@export var speed:int = 120

var direction = Vector2(0,0)

var screen_size
signal player_goal
signal computer_goal
# called when the node enters the scene tree for the first time.

func _ready() -> void:
	direction = Vector2(1,1)
	screen_size = get_window().size
	


func _process(delta: float) -> void: 
	position = position + direction * (speed * delta)
	
	if position.x >= screen_size.x or position.x <= 0:
		direction.x *= -1
	if position.y >= screen_size.y or position.y <= 0:
		direction.y *= -1
		
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player1":
		direction *= -1
	if area.name == "Computer":
		direction *= -1			
	if area.name == "computer_goal":
		emit_signal("computer_goal")
	if area.name == "player_goal":
		emit_signal("player_goal")
		
		
	
