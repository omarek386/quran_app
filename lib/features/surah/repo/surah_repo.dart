import 'package:audioplayers/audioplayers.dart';

class SurahRepo {
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playAudio(String audioUrl) async {
    await audioPlayer.play(UrlSource(audioUrl));
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> resumeAudio() async {
    await audioPlayer.resume();
  }
}
