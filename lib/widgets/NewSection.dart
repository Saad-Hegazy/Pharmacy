import 'package:flutter/material.dart';

class NewSection extends StatelessWidget {
  final String titel;
  NewSection({
    super.key, required this.titel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding:EdgeInsets.fromLTRB(0, 8, 15, 0),
      child:  Text(
        titel,
        style: const TextStyle(
          fontWeight:FontWeight.w900,
          fontSize:18,
          color: Colors.black54,
        ),
      ),
    );
  }
}