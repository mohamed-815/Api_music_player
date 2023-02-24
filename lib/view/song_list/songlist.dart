import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/controller/songplayfuntion.dart';
import 'package:flutter_application_1/view/play_screen/playscreen.dart';
import 'package:flutter_application_1/view/song_list/songlistservice/songlistservice.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            khieght,
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                Expanded(
                  child: Center(
                    child: Text(
                      "All Songs",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 18, 18, 18),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            khieght,
            FutureBuilder(
                future: SongListservice().Fechthesong(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some Thing Went Wrong"),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                        child: ListView.builder(
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
                                padding: const EdgeInsets.all(8.0),
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
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
