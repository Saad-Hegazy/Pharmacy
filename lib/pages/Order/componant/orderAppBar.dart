import 'package:flutter/material.dart';
class OrderAppBar extends StatefulWidget {
  const OrderAppBar({super.key});

  @override
  State<OrderAppBar> createState() => _OrderAppBarState();
}

class _OrderAppBarState extends State<OrderAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
