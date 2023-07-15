import 'package:flutter/material.dart';
class OrderNow extends StatelessWidget {
  const OrderNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.11,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration:BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(20),
        border:Border.all(color: Colors.lightBlue,width: 0.6) ,
      ),
      child: Row(
        children: [
          Image.asset("assets/images/Medicine.png",height: 130,width: 130,),
          Spacer(),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "OrderScreen");
            },
            child: Container(
              width:MediaQuery.of(context).size.width * 0.5 ,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration:BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Center(
                child: Text("<  اطلب الأن", style: TextStyle(
                  fontSize: 19,fontWeight: FontWeight.bold,
                  color: Colors.blue,),
                ),
              ),
            ),
          )
        ],),
    );
  }
}



