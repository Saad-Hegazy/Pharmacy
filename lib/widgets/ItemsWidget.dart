import 'package:flutter/material.dart';
class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
        for(int i=1;i<=3;i++)
          Container(
            width: 150,
            margin: EdgeInsets.only(left: 15,right:15,top: 10),
            padding:EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            decoration: BoxDecoration(
              color:Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                    child: Text("30%",style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
              ],),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context,'ItemPage');
                },
                child: Image.asset('assets/Best/$i.png',
                height: 120,
                width: 120,),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerRight,
                child: Text("Prodact",style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text("شرح للمنتج  ",style: TextStyle(
                  fontSize: 15,color:Colors.black,
                ),),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("33 L.E",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,),
                  ),
                  Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.lightBlue,),
                ],),
              )
              ],),
          ),
      ],);
  }
}
