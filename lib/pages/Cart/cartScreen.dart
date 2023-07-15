import 'package:flutter/material.dart';

import 'componant/CartAppBar.dart';
import 'componant/CartBottomNavBar.dart';
import 'componant/CartItemSamples.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CartAppBar(),
        Container(
          height: 700,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight:Radius.circular(35),
            )
          ),
          child: Column(
            children: [
              CartItemSamples(),
              Container(
              //  decoration: BoxDecoration(
              //    borderRadius: BorderRadius.circular(10),
              //  ),
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "أضف كود خصم",style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],),
              ),
            ],),
        )
      ],),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
