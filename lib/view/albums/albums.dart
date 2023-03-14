import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/gridclass.dart';
import 'package:flutter_application_1/view/home_screen/HomeService/homeservice.dart';
import 'package:flutter_application_1/view/home_screen/widgets/grid_item.dart';
import 'package:flutter_application_1/view/song_list/songlist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AlbumsPage extends StatefulWidget {
  AlbumsPage({super.key, required this.albumlist});

  List<GenreAlbums> albumlist;

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
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
                  padding: EdgeInsets.all(18.w),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 4.5.h,
                  children: List.generate(widget.albumlist.length, (index) {
                    //   final item = showingitems[index];
                    final item = widget.albumlist[index];
                    return GestureDetector(
                      onTap: () {
                        if (item.id != null) {
                          Get.to(() => SongList(
                                id: item.id!,
                              ));
                        } else {
                          Get.snackbar("albums Details", "no Album Found");
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
