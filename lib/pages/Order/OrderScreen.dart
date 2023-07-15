import 'package:flutter/material.dart';

import 'componant/OrdeAppBar.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
         body: SingleChildScrollView(
           child: Column(
             children: [
               OrderAppBar(),
             ],
           ),
         ),
    );
  }
}
