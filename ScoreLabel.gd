extends Label

var score = 0

func _on_mob_squashed():
	score += 1
	text = "Pontuação: %s" % score
	#Godot automatically converts values to string text
