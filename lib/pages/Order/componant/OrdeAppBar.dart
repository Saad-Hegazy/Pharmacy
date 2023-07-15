import 'package:flutter/material.dart';
class OrderAppBar extends StatelessWidget {
  const OrderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:   InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,size: 30,color: Colors.lightBlue,
      ),
    ),);
  }
}
