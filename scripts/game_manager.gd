extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel
@onready var head_count: Label = $"../Player/HeadCount"

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	head_count.text= "Coins " + str(score)
