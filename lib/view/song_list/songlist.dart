import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/controller/songplayfuntion.dart';
import 'package:flutter_application_1/view/play_screen/playscreen.dart';
import 'package:flutter_application_1/view/song_list/songlistservice/songlistservice.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

List<Audio> audioconvertedsongs = [];

class SongList extends StatefulWidget {
  const SongList({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Songs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: SongListservice().Fechthesong(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Some Thing Went Wrong"),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(13.h),
                            itemCount: snapshot.data?.length,
                            itemBuilder: ((context, index) {
                              final song = snapshot.data![index];

                              for (var element in snapshot.data!) {
                                audioconvertedsongs.add(Audio.file(
                                  element.url.toString(),
                                  metas: Metas(
                                      image: MetasImage.network(element.image!),
                                      id: element.id.toString(),
                                      title: element.title,
                                      artist: element.artist,
                                      album: element.duration.toString()),
                                ));
                              }

                              return Padding(
                                padding: EdgeInsets.all(6.h),
                                child: Card(
                                  child: ListTile(
                                    onTap: () async {
                                      await AssetAudioPlay(
                                              audioconvertedsongs:
                                                  audioconvertedsongs,
                                              index: index)
                                          .songPlayNow(
                                              audioconvertedsongs, index)
                                          .then((value) => Get.to(PlayScreen(
                                              audiosongs:
                                                  audioconvertedsongs)));
                                    },
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(song
                                                  .image ==
                                              null
                                          ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeexmC73RvuOHEl4xTDWQFnikrHo4AWFyoPw&usqp=CAU'
                                          : song.image!),
                                    ),
                                    title: Text(song.title!),
                                    subtitle: Text(song.subtitle!),
                                  ),
                                ),
                              );
                            })));
                  } else {
                    return Expanded(
                        child: Center(
                            child: const CircularProgressIndicator(
                      color: Colors.white,
                    )));
                  }
                })
          ],
        ),
      ),
    );
  }
}
