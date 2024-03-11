extends Node2D

var player
var bgm

var maxVolume = 1.0
var minVolume = 0.1
var maxDistance = 500

func _ready():
	player = get_node("Player2")
	bgm = get_node("BGM")

func _physics_process(delta):
	var distance = bgm.global_position.distance_to(player.global_position)
	var volume = clamp(1.0 - (distance / maxDistance), minVolume, maxVolume)
	bgm.volume_db = linear2db(volume)
