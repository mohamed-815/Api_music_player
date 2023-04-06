import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/gridclass.dart';
import 'package:flutter_application_1/view/home_screen/widgets/grid_item.dart';
import 'package:flutter_application_1/view/song_list/songlist.dart';
import 'package:get/get.dart';

class AlbumsPage extends StatefulWidget {
  AlbumsPage({super.key, required this.albumlist});

  List<GenreAlbums> albumlist;

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  void initState() {
    super.initState();
  }

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
            "Albums",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(18),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 4.5,
                  children: List.generate(widget.albumlist.length, (index) {
                    final item = widget.albumlist[index];
                    return GestureDetector(
                      onTap: () {
                        if (item.id != null) {
                          Get.to(() => SongList(
                                id: item.id!,
                              ));
                        } else {
                          Get.snackbar("Albums Details", "No Album Found");
                        }
                      },
                      child: SimpleItem(
                        itemname: item.title,
                        image: item.image,
                        borderadiusGeometry: BorderRadius.circular(6),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
