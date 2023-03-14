import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/view/home_screen/widgets/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleItem extends StatelessWidget {
  SimpleItem({
    required this.borderadiusGeometry,
    this.image,
    required this.itemname,
    Key? key,
  }) : super(key: key);

  String? itemname;

  String? image;
  BorderRadiusGeometry borderadiusGeometry;

  @override
  Widget build(BuildContext context) {
    final shieght = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Container(
      width: swidth / 2.3,
      padding: EdgeInsets.all(8),
      //margin: EdgeInsets.all(3),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: borderadiusGeometry,
                image: DecorationImage(
                    image: NetworkImage(image != null
                        ? image!
                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz2vlb6hWMPrKdrtMZmLIPGJQd67d4VhIeMA&usqp=CAU"),
                    fit: BoxFit.cover)),
            height: shieght / 7,
            width: swidth / 1.8,

            // child: Image.asset(
            //   image,
            //   fit: BoxFit.cover,
            // ),
          ),
          khieght,
          Container(
              width: 130.w,
              child: Center(child: smalltextboldWidjets25(Title: itemname!)))
        ],
      ),
    );
  }
}
