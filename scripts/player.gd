extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
var dead = false
var is_rolling = false  # Flag to track if the player is rolling
signal rolling(is_rolling)

func _on_my_signal(message):
	dead = true
	animated_sprite.play(message)

func _ready():
	# Connect the signal
	var emitter = get_node("../slime/killzone")
	emitter.connect("dead", Callable(self, "_on_my_signal"))

func _physics_process(delta: float) -> void:
	if !dead:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor() and !is_rolling:
			velocity.y = JUMP_VELOCITY
		
		# Handle roll.
		if Input.is_action_just_pressed("roll") and is_on_floor() and !is_rolling:
			start_roll()
		
		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis("move_left", "move_right")
		
		# Flip the sprite.
		if direction < 0:
			animated_sprite.flip_h = true
		elif direction > 0:
			animated_sprite.flip_h = false
		
		# Play animations.
		if is_rolling:
			# Disable movement while rolling.
			velocity.x = 0
		else:
			if is_on_floor():
				if direction == 0:
					animated_sprite.play("idle")
				else:
					animated_sprite.play("run")
			else:
				animated_sprite.play("jump")
		
		# Apply movement.
		if direction and !is_rolling:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		move_and_slide()

func start_roll():
	is_rolling = true
	emit_signal("rolling", is_rolling)
	animated_sprite.play("roll")
	timer.start()
	await timer.timeout
	is_rolling = false  # End the roll state
