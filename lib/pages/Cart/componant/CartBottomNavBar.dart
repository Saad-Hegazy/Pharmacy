import 'package:flutter/material.dart';
class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("165 L.E",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),
                Spacer(),
                Text(" : الإجمالي",style: TextStyle(
                  color: Colors.lightBlue,fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "تأكيد الطلب",
                style: TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
