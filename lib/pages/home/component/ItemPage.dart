import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ItemAppBar.dart';
import 'ItemBottomNaveBar.dart';
class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  late int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(padding: EdgeInsets.all(16),
          child: Image.asset('assets/Best/1.png',height: 230,),
          ),
          Arc(
            edge:Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              height: 350,
              color: Colors.white,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(
                      top: 50,
                      bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('اسم المنتج',style: TextStyle(
                        fontSize: 28,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5,bottom: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating:4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context,_) => Icon(Icons.favorite,color: Colors.lightBlue,),
                        onRatingUpdate: (index) {  },
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                if(count>=100){
                                  count=100;
                                }else{count++;}
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:[ BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  )]
                              ),
                              child: Icon(CupertinoIcons.plus,size: 18,),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('$count',style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                            ),),
                          ),   GestureDetector(
                            onTap:(){
                              setState(() {
                                if(count>0){
                                  count--;
                                }else{
                                  count=0;
                                }});
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow:[ BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),
                                  )]
                              ),
                              child: Icon(CupertinoIcons.minus,size: 18,),
                            ),
                          ),
                        ],)
                    ],),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.end ,
                    children:[Text(
                      "توصيف للمنتج فيتامين معزز لنشاط الجسم",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],),
                  ),
                  Padding(
                      padding:EdgeInsets.symmetric(vertical: 8),
                  child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius:2,
                                    blurRadius: 8,)]
                            ),
                            child: Text('علبة',),
                          ),
                          SizedBox(width: 10,),
                          Text(": الوحدة",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold
                            ),
                          ),],
                      ),
                  ),
                ],),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: ItemBottomNaveBar(),
    );
  }
}
