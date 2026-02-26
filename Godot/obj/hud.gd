extends Control
@export var Player: Node3D
@onready var textObject: Label =  $score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (Player == null):
		Player == self.get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Player.has_method("_get_collected_trees"):
		textObject.text = ("trees: " + str(Player.collectedTrees))
