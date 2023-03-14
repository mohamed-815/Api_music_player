import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/currentfind.dart';
import 'package:flutter_application_1/view/albums/albums.dart';
import 'package:flutter_application_1/view/home_screen/homescreen.dart';
import 'package:flutter_application_1/view/song_list/songlist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class PlayScreen extends StatelessWidget {
  AssetsAudioPlayer audioplayer = AssetsAudioPlayer.withId("0");
  final Audio? songdetailsshow;
  List<Audio> audiosongs;

  int? index;

  PlayScreen({
    Key? key,
    this.songdetailsshow,
    this.index,
    required this.audiosongs,
  }) : super(key: key);

  int? numberindex;

  bool isplay = true;

  bool isfavorite = false;

  int count = 1;

  int count1 = 1;

  int count2 = 1;

  @override
  Widget build(BuildContext context) {
    final double screenhight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 8, 8),
      body: audioplayer.builderCurrent(builder: (context, Playing playing) {
        final curentsongdetail = find(audiosongs, playing.audio.assetAudioPath);

        if (playing.audio.assetAudioPath.isEmpty) {
          return const Center(
            child: Text('empty'),
          );
        } else {
          print(curentsongdetail.metas.image.toString());
          return SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: screenhight / 35,
              ),
              ListTile(
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.1),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    )),
                  ),
                ),
              ),
              Container(
                height: screenhight / 3,
                width: screenwidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            curentsongdetail.metas.image!.path.toString()))),
              ),
              SizedBox(
                height: screenhight / 20,
              ),
              Container(
                width: screenwidth / 1.5,
                height: screenhight / 30,
                child: Marquee(
                  velocity: 20,
                  text: curentsongdetail.metas.title!,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(
                height: screenhight / 60,
              ),
              curentsongdetail.metas.artist == '<unknown>'
                  ? const Text(
                      'unknown artist',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  : Text(
                      curentsongdetail.metas.artist!,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
              SizedBox(
                height: screenhight / 50,
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: audioplayer.builderRealtimePlayingInfos(
                      builder: (context, infos) {
                    Duration currentposition = infos.currentPosition;
                    Duration totalduration = infos.duration;
                    return ProgressBar(
                        timeLabelTextStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        thumbColor: const Color.fromARGB(255, 64, 82, 68),
                        baseBarColor: const Color.fromARGB(255, 127, 126, 126),
                        progressBarColor:
                            const Color.fromARGB(255, 86, 110, 91),
                        bufferedBarColor:
                            const Color.fromARGB(255, 123, 157, 131),
                        thumbRadius: 8,
                        barHeight: 3,
                        progress: currentposition,
                        total: totalduration,
                        onSeek: (to) {
                          audioplayer.seek(to);
                        });
                  })),
              SizedBox(
                height: screenhight / 25,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onDoubleTapCancel: () {},
                    onDoubleTapDown: ((details) {}),
                    onDoubleTap: () async {
                      await audioplayer.seekBy(const Duration(seconds: -5));
                    },
                    onTap: () async {
                      audioplayer.previous();
                    },
                    child: const Icon(
                      Icons.skip_previous,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: screenwidth / 30,
                  ),
                  PlayerBuilder.isPlaying(
                      player: audioplayer,
                      builder: (context, isPlaying) {
                        return GestureDetector(
                          onTap: () async {
                            await audioplayer.playOrPause();
                          },
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade200,
                              child: isPlaying
                                  ? const Icon(
                                      size: 40,
                                      Icons.pause,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.play_arrow,
                                      size: 40,
                                      color: Colors.black,
                                    )),
                        );
                      }),
                  SizedBox(
                    width: screenwidth / 30,
                  ),
                  GestureDetector(
                      onDoubleTapCancel: () {},
                      onDoubleTapDown: ((details) {}),
                      onDoubleTap: () async {},
                      onTap: () async {
                        audioplayer.next();
                      },
                      child: const Icon(
                        Icons.skip_next,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              ),
              PlayerBuilder.isPlaying(
                  player: audioplayer,
                  builder: (context, isPlaying) {
                    return GestureDetector(
                      child: Container(
                          height: 100.h,
                          color: Colors.grey.shade200,
                          child: isPlaying
                              ? Image.network(
                                  'https://gifimage.net/wp-content/uploads/2018/10/audio-spectrum-gif.gif',
                                  fit: BoxFit.contain,
                                )
                              : const SizedBox()),
                    );
                  }),
            ],
          ));
        }
      }),
    );
  }
}
