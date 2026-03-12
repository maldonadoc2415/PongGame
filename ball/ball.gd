extends Area2D
# difference between VAr and Constant
@export var speed:int = 100


var direction = Vector2(0,0)

var screen_size
signal PlayerGoal
signal ComputerGoal
# called when the node enters the scene tree for the first time.

func _ready() -> void:
	direction = Vector2(set_random_direction(), set_random_direction())
	screen_size = get_window().size
	


func _process(delta: float) -> void: 
	position = position + direction * (speed * delta)
	
	if position.x >= screen_size.x or position.x <= 0:
		direction.x *= -1
	if position.y >= screen_size.y or position.y <= 0:
		direction.y *= -1
		
func _on_area_entered(area: Area2D) -> void:
	if area.name == "PlayerGoal":
		direction *= -1
	if area.name == "ComputerGoal":
		direction *= -1			
	if area.name == "ComputerGoal":
		emit_signal("ComputerGoal")
	if area.name == "PlayerGoal":
		emit_signal("PlayerGoal")
		
		
	

func set_random_direction():
	var choices = [-1, 1]
	var random_direction = choices.pick_random()
	return random_direction
