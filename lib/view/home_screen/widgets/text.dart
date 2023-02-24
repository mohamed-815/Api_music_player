import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/const.dart';

class smalltextboldWidjets25 extends StatelessWidget {
  smalltextboldWidjets25({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
          overflow: TextOverflow.ellipsis),
    );
  }
}
