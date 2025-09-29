extends AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the signal
	var emitter = get_node("../slime/killzone")
	emitter.connect("rolling", Callable(self, "_on_my_signal"))

func _on_my_signal():
	$CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
