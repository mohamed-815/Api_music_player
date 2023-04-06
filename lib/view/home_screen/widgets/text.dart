import 'package:flutter/material.dart';

class SmallTextBoldWidjets25 extends StatelessWidget {
  SmallTextBoldWidjets25({
    required this.Title,
    Key? key,
  }) : super(key: key);
  String Title;
  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
          overflow: TextOverflow.ellipsis),
    );
  }
}
