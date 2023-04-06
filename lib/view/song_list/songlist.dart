import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/songlist/songlistcontroller.dart';
import 'package:flutter_application_1/controller/songplayfuntion.dart';
import 'package:flutter_application_1/view/play_screen/playscreen.dart';
import 'package:flutter_application_1/view/song_list/songlistservice/songlistservice.dart';
import 'package:get/get.dart';

class SongList extends StatelessWidget {
  SongList({
    super.key,
    required this.id,
  });
  List<Audio> audioconvertedsongs = [];
  final String id;
  final listcontroller = Get.put(() => SongListController);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => SongListController().loadFalse());
    return GetX(
        init: SongListController(),
        builder: (c) {
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
              child: c.isloading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        FutureBuilder(
                            future: SongListservice().Fechthesong(id),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text("Some Thing Went Wrong"),
                                );
                              } else if (snapshot.hasData) {
                                audioconvertedsongs.clear();
                                for (var element in snapshot.data!) {
                                  audioconvertedsongs.add(Audio.file(
                                    element.url.toString(),
                                    metas: Metas(
                                        image:
                                            MetasImage.network(element.image!),
                                        id: element.id.toString(),
                                        title: element.title,
                                        artist: element.artist,
                                        album: element.duration.toString()),
                                  ));
                                }
                                return Expanded(
                                    child: ListView.builder(
                                        padding: const EdgeInsets.all(13),
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: ((context, index) {
                                          final song = snapshot.data![index];

                                          return Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Card(
                                              child: ListTile(
                                                onTap: () async {
                                                  try {
                                                    c.loadTreu();

                                                    await AssetAudioPlay(
                                                            audioconvertedsongs:
                                                                audioconvertedsongs,
                                                            index: index)
                                                        .songPlayNow(
                                                            audioconvertedsongs,
                                                            index)
                                                        .then((value) => Get.to(
                                                            PlayScreen(
                                                                audiosongs:
                                                                    audioconvertedsongs)));
                                                    c.loadFalse();
                                                  } catch (e) {
                                                    Get.snackbar('Song',
                                                        "Incorect Song File",
                                                        colorText:
                                                            Colors.white);
                                                  }
                                                },
                                                leading: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      song.image == null
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
                                return const Expanded(
                                    child: Center(
                                        child: CircularProgressIndicator(
                                  color: Colors.white,
                                )));
                              }
                            })
                      ],
                    ),
            ),
          );
        });
  }
}
