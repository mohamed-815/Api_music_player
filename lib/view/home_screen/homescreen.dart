import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/albums/albums.dart';
import 'package:flutter_application_1/view/home_screen/HomeService/homeservice.dart';
import 'package:flutter_application_1/view/home_screen/widgets/grid_item.dart';
import 'package:get/get.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 14),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
          title: const Center(
            child: Text(
              'Take Your Music',
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
                      return const Center(
                        child: Text('Some Thing Went Wrong'),
                      );
                    }

                    if (snapshot.hasData) {
                      return Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.all(20),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 18,
                          children:
                              List.generate(snapshot.data!.length, (index) {
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
