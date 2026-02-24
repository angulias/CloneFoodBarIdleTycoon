extends Node

const COINS = preload("res://Assets/Sound/coins.wav")
const NORMAL_SFX = preload("res://Assets/Sound/normal sfx.mp3")

@export var stream_players: Array[AudioStreamPlayer]

func play_audio(clip: AudioStream, volume: float) -> void:
	var free_player := get_free_audio_player()
	if free_player == null:
		return
	
	free_player.stream = clip
	free_player.volume_db = volume
	free_player.play()

func get_free_audio_player() -> AudioStreamPlayer:
	for audio: AudioStreamPlayer in stream_players:
		if not audio.playing:
			return audio
	return null

func play_coins() -> void:
	play_audio(COINS, 0.0)
	
func play_ui() -> void:
	play_audio(NORMAL_SFX, 0.0)
