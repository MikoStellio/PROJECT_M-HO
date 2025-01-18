extends CharacterBody2D


const SPEED = 150
const START_DIRECTION := Vector2.RIGHT
var player_state = "idle"
@onready var sprite: Sprite2D = $Sprite2D
@onready var sprite_animation: AnimationPlayer = $AnimationPlayer


func _ready():
	add_to_group("player")
	play_animation(START_DIRECTION)

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	

func get_input():
	var input_direction := Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	if input_direction:
		player_state = "walk"
	elif not input_direction:
		player_state = "idle"
		
	velocity = input_direction * SPEED
	play_animation(input_direction)


func play_animation(direction):
	# TODO: Fix the animation
	if player_state == "idle":
		if direction == Vector2.LEFT:
			sprite.flip_h = true
			sprite_animation.play("idle_right")
		if direction == Vector2.RIGHT:
			sprite.flip_h = false
			sprite_animation.play("idle_right")
		if direction == Vector2.UP:
			sprite_animation.play("idle_up")
		if direction == Vector2.DOWN:
			sprite_animation.play("idle_down")
	elif player_state == "walk":
		if direction == Vector2.LEFT:
			sprite.flip_h = true
			sprite_animation.play("walk_right")
		if direction == Vector2.RIGHT:
			sprite.flip_h = false
			sprite_animation.play("walk_right")
		if direction == Vector2.UP:
			sprite_animation.play("walk_up")
		if direction == Vector2.DOWN:
			sprite_animation.play("walk_down")
