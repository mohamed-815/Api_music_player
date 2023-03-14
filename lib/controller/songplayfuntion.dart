import 'package:assets_audio_player/assets_audio_player.dart';

class AssetAudioPlay {
  AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId("0");
  List<Audio> audioconvertedsongs;
  int index;
  AssetAudioPlay({required this.audioconvertedsongs, required this.index});
  Future<void> songPlayNow(List<Audio> audioconvertedsongs, int index) async {
    print("/////////////////.............................");

    //print(audioplayer.playlist?.audios[0].metas.title);
    if (audioplayer.playlist?.audios[0].metas.title != null) {
      audioplayer.playlist?.audios.clear();
      // print(audioplayer.playlist?.audios[0].metas.title);
    }

    await audioplayer
        .open(Playlist(audios: audioconvertedsongs, startIndex: index));

    //await widget.audioPlayer
    //    .open(audioconvertedsongs[widget.index!], showNotification: true);
    audioplayer.play();
  }
}
