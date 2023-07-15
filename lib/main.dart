import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/pages/Cart/cartScreen.dart';
import 'package:pharmacy/pages/Order/OrderScreen.dart';
import 'package:pharmacy/pages/category/CategoryScreen.dart';
import 'package:pharmacy/pages/home/component/ItemPage.dart';
import 'package:pharmacy/pages/home/home_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pharmacy',
      theme:ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      routes:{
       '/':(context)=>Home(),
       'CartPage':(context)=>CartPage(),
       'ItemPage':(context)=>ItemPage(),
        'CategoryPage':(context)=>CategoryPage(),
        'OrderScreen':(context)=>OrderScreen(),
      },
    );
  }
}