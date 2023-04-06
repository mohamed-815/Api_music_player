import 'package:assets_audio_player/assets_audio_player.dart';

class AssetAudioPlay {
  AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId("0");
  List<Audio> audioconvertedsongs;
  int index;
  AssetAudioPlay({required this.audioconvertedsongs, required this.index});
  Future<void> songPlayNow(List<Audio> audioconvertedsongs, int index) async {
    audioplayer.stop();

    await audioplayer
        .open(Playlist(audios: audioconvertedsongs, startIndex: index));

    audioplayer.play();
  }
}
