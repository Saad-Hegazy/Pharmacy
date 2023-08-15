import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/services/model/Medicine.dart';
class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}
class _ItemsWidgetState extends State<ItemsWidget> {
  List<Medicine> _medicine=[];
  fetchMedicine()async{
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("medicine").get();
    setState(() {
      for(int i=0 ; i<qn.docs.length ;i++){
        _medicine.add(
          Medicine(
            name: qn.docs[i]['name'],
            company: qn.docs[i]['company'],
            category: qn.docs[i]['category'],
            ImageURL: qn.docs[i]['ImageURL'],
            description: qn.docs[i]['description'],
            price: qn.docs[i]['price'] ,
            OrderAmount: qn.docs[i]['OrderAmount'],
            available: qn.docs[i]['available'],
            discount: qn.docs[i]['discount'],
            favorite: qn.docs[i]['favorite'],
            hasDiscount:qn.docs[i]['hasDiscount'],
            initialRating:qn.docs[i]['initialRating'],
            numberOfStripes:qn.docs[i]['numberOfStripes'],
            hasStripe:qn.docs[i]['hasStripe'],

          )
        );
      }
    });
    return _medicine;
  }
  @override
  void initState() {
    fetchMedicine();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
        for(int i=0;i<_medicine.length;i++)
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
                  _medicine[i].hasDiscount?
                  Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                    child:Text(_medicine[i].discount.toString() + "%",
                      style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ):SizedBox(),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          _medicine[i].favorite = !_medicine[i].favorite;
                        });
                      },
                      child: Icon(  _medicine[i].favorite ? Icons.favorite : Icons.favorite_border ,size: 23,color: Colors.red,)
                  ),
              ],),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context,'ItemPage',arguments:_medicine[i]);
                },
                child: CachedNetworkImage(imageUrl:_medicine[i].ImageURL,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0,5,0,5),
                alignment: Alignment.centerRight,
                child: Expanded(
                  child: Text(_medicine[i].name,
                    style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(_medicine[i].price.toString() +' جنيه' ,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,),
                    ),
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
