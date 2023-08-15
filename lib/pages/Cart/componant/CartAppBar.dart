import 'package:flutter/material.dart';
class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 20,),
          child: Text('سلة المشتريات',style: TextStyle(
            fontSize: 23,fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
          ),
          ),
          Spacer(),
          Icon(Icons.more_vert,size: 30,
              color: Colors.lightBlue,)
        ],
      ),
    );
  }
}
