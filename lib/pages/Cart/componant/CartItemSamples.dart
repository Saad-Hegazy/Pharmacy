import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=1; i<4 ;i++)
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 110,
          margin: EdgeInsets.symmetric(horizontal:15 ,vertical: 10,),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Radio(
                value: "",
                groupValue: "",
                activeColor: Colors.lightBlue,
                onChanged: (index) {  },
              ),
              Container(
                height: 70,
                width: 50,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset('assets/Best/$i.png'),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product name",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                  ),
                  Text("55 L.E"),
                ],

              ),
              ),
              Spacer(),
              Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.delete,
                  color: Colors.red,
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
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                          ),
                          child: Icon(
                            CupertinoIcons.plus,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,),
                        child: Text('$count',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        ),),
                      ),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            if(count>0){
                              count--;
                            }else{
                              count=0;
                            }});
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                )
                              ]
                          ),
                          child: Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  )


                ],
              ),
              )

            ],
          ),
        )
      ],

    );
  }
}
