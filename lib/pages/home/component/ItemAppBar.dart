import 'package:flutter/material.dart';
class ItemAppBar extends StatefulWidget {
  const ItemAppBar({super.key});

  @override
  State<ItemAppBar> createState() => _ItemAppBarState();
}

class _ItemAppBarState extends State<ItemAppBar> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,size: 30,color: Colors.lightBlue,
            ),
          ),
        const Padding(padding: EdgeInsets.only(left: 20),
        child: Text("منتجات",style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.lightBlue,),
        ),
        ),
          Spacer(),
          GestureDetector(
            onTap: (){
              setState(() {
                  favorite = !favorite;
              });
            },
              child: Icon(  favorite ? Icons.favorite : Icons.favorite_border ,size: 30,color: Colors.red,)
          ),
        ],
      ),
    );
  }
}
