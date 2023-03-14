import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/albums/albums.dart';
import 'package:flutter_application_1/view/home_screen/HomeService/homeservice.dart';
import 'package:flutter_application_1/view/home_screen/widgets/grid_item.dart';
import 'package:flutter_application_1/view/song_list/songlist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 13, 14),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          title: Center(
            child: Text(
              'Take Your Music',
              //  style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                  future: HomeService().FechtheId(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Some Thing Went Wrong'),
                      );
                    }

                    if (snapshot.hasData) {
                      return Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.all(20),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.h,
                          crossAxisSpacing: 18.h,
                          children:
                              List.generate(snapshot.data!.length, (index) {
                            //   final item = showingitems[index];
                            final item = snapshot.data?[index];
                            return GestureDetector(
                              onTap: () {
                                if (item.genreAlbums!.isEmpty) {
                                  Get.snackbar('Album', 'The Album is Empty');
                                } else {
                                  Get.to(() => AlbumsPage(
                                        albumlist: item.genreAlbums!,
                                      ));
                                }
                              },
                              child: SimpleItem(
                                borderadiusGeometry: BorderRadius.circular(160),
                                itemname: item!.genre.toString(),
                              ),
                            );
                          }),
                        ),
                      );
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
        ));
  }
}

final showingitems = [
  "new one",
  "best song",
  "rap",
  "trance",
  "beach Music",
  "Hot Songs",
  "best Songs"
];

final songs = [
  "thulli",
  "nilavu",
  "rap",
  "trance",
  "beach Music",
  "Hot Songs",
  "best Songs"
];
