import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ItemAppBar.dart';
import 'ItemBottomNaveBar.dart';
class ItemPage extends StatefulWidget {
   ItemPage({super.key});
  @override
  State<ItemPage> createState() => _ItemPageState();
}
class _ItemPageState extends State<ItemPage> {
  bool chooseBox=true;
  bool chooseStrip=false;
  List unit= [
        'شريط',
        'علبة',
      ];
  late int count=0;
  @override
  Widget build(BuildContext context) {
    final _medicine = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(16),
           child:CachedNetworkImage(imageUrl: _medicine['ImageURL'].toString(),
           fit: BoxFit.fill,
           ),

          ),
          Arc(
            edge:Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
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
                      Expanded(
                        child: Text(_medicine['name']
                          ,style: TextStyle(
                          fontSize: 18,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),),
                      )
                    ],
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5,bottom: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating:_medicine['initialRating'],
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
                                if(_medicine['OrderAmount']>=100){
                                  _medicine['OrderAmount']=100;
                                }else{_medicine['OrderAmount']++;}
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
                            child: Text(_medicine['OrderAmount'].toString(),style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                            ),),
                          ),   GestureDetector(
                            onTap:(){
                              setState(() {
                                if(_medicine['OrderAmount']>1){
                                  _medicine['OrderAmount']--;
                                }else{
                                  _medicine['OrderAmount']=1;
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
                    children:[Expanded(
                      child: Text(
                        _medicine['description'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.lightBlue,
                        ),
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
                          _medicine['hasStripe']?
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                chooseStrip=!chooseStrip;
                                chooseBox=!chooseBox;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: chooseStrip ? Colors.lightBlue: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius:2,
                                      blurRadius: 8,)
                                  ]
                              ),
                              child:Text( 'شريط' ,style: TextStyle(
                                color:chooseStrip? Colors.white :Colors.lightBlue ,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            ),
                          ):SizedBox(),
                          SizedBox(width: 10,),
                          GestureDetector(
                               onTap: (){
                           setState(() {
                             chooseStrip=!chooseStrip;
                             chooseBox=!chooseBox;
                           });
                           },
                             child: Container(
                                height: 40,
                                  width: 40,
                                alignment: Alignment.center,
                                 margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: chooseBox ? Colors.lightBlue: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                              BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                       spreadRadius:2,
                                blurRadius: 8,)
                                ]
                             ),
                              child:Text( "علبة" ,style: TextStyle(
                                 color:chooseBox? Colors.white :Colors.lightBlue ,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                          ),
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
      bottomNavigationBar:  ItemBottomNaveBar(
        price: chooseBox? _medicine['price']: _medicine['price']/_medicine['numberOfStripes'],
        OrderAmount: _medicine['OrderAmount'],),
    );
  }
}
