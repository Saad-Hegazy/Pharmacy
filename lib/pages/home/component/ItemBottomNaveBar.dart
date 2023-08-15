import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemBottomNaveBar extends StatelessWidget {
  final double  price;
  final int OrderAmount;
  const ItemBottomNaveBar({super.key,  required this.price, required this.OrderAmount});

  @override
  Widget build(BuildContext context) {
    final double totalPrice = price* OrderAmount;
    return BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0,3),
              spreadRadius: 3,
              blurRadius: 10,
            )]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(totalPrice.toStringAsFixed(1) + "جنيه" ,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
              ),
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(CupertinoIcons.cart_badge_plus),
                label:const Text('اضافة للسلة',
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,),
              ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical:13,horizontal: 15),),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  )
                ),
               )
            ],
          ),
        ),
    );
  }
}
