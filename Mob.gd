extends CharacterBody3D

@export var min_speed = 10
@export var max_speed = 18

signal squashed

func _physics_process(_delta):
	move_and_slide()

func initialize(start_position, player_position):
	look_at_from_position(start_position, player_position, Vector3.UP)
	
	rotate_y(randf_range(-PI / 4, PI / 4)) #define a rotação
	var random_speed = randi_range(min_speed, max_speed)
	# calcula o tempo de autodestruição de acordo com a velocidade
	$autodestroi.wait_time = 40.0 / random_speed
	velocity = Vector3.FORWARD * random_speed
	# ajustando a DIREÇÃO de acordo com o EIXO Y do mob
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	# neste caso o VECTOR3.UP respresenta o EIXO Y que é girado

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free() #quem sabe um dia isso funcione!

func _on_autodestroi_timeout():
	queue_free()

func squash():
	squashed.emit() # pra usar na pontuação
	queue_free()
