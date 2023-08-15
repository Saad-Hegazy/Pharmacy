import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
 final List titel=[
    'الصحة الجنسية',
    'الفيتامينات و المكملات',
    'المستلزمات الطبية',
    'المكياج و الاكسسورات',
    'الأم و الطفل',
    'العناية اليومية',
    'العناية بالبشرة',
    'العناية بالشعر',
    'الأدوية',
  ];
   CategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
        for(int i=1 ; i<=9 ;i++)
          InkWell(
            onTap: (){
              Navigator.pushNamed( context, 'CategoryPage',arguments:titel[i-1]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/categories/$i.png",width: 60,height: 60),
                  Text(titel[i-1],style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,),
                  ),
              ],),
            ),
          )
        ],),
    );
  }
}
