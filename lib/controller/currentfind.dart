import 'package:assets_audio_player/assets_audio_player.dart';

AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId("0");
Audio find(List<Audio> audioconvertedsongs, String frompath) {
  return audioconvertedsongs.firstWhere((element) => element.path == frompath);
}
