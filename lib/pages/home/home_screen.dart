import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/color.dart';
import '../../theme/size_config.dart';
import '../Cart/cartScreen.dart';
import '../profile/profileScreen.dart';
import 'component/body.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex=1;
  List Screens=[
    CartPage(),
    HomePageBodyComponent(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Screens[_selectedIndex],
     bottomNavigationBar: CurvedNavigationBar(
       index: _selectedIndex,
       backgroundColor: Colors.transparent,
       color: lightBlueColor,
       height: 50,
       onTap: (index){
         setState(() {
          _selectedIndex   =  index ;
         });
       },
       items: [
         Icon(Icons.shopping_cart_rounded,size: 30, color: whiteColor,),
         Icon(Icons.home,size: 30, color: whiteColor,),
         Icon(Icons.person,size: 30, color: whiteColor,),
       ],
     ),
    );
  }
}
