import 'package:flutter/material.dart';
class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.lightBlue,
      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          Spacer(),
          const Text('اسم القسم',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),

          Spacer(),
        ],),
    );
  }
}
