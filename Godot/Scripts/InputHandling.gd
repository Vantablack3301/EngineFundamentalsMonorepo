extends Node

var attack_held = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Attack"):
		attack_held = true
		print("Attack")
		
	var move := Input.get_vector("Move_Left", "Move_Right", "Move_Backward", "Move_Forward")
	#print("Move ", move)
