import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Categorybody extends StatefulWidget {
  const Categorybody({super.key});
  @override
  State<Categorybody> createState() => _CategorybodyState();
}
class _CategorybodyState extends State<Categorybody> {
  List _medicine=[];
  fetchMedicine()async{
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("medicine").
        where('category',isEqualTo: 'الأدوية').get();
    setState(() {
      for(int i=0 ; i<qn.docs.length ;i++){
        _medicine.add(
            {
              'name': qn.docs[i]['name'],
              'company': qn.docs[i]['company'],
              'category': qn.docs[i]['category'],
              'ImageURL': qn.docs[i]['ImageURL'],
              'description': qn.docs[i]['description'],
              'price': qn.docs[i]['price'] ,
              'OrderAmount': qn.docs[i]['OrderAmount'],
              'available': qn.docs[i]['available'],
              'discount': qn.docs[i]['discount'],
              'favorite': qn.docs[i]['favorite'],
              'initialRating':qn.docs[i]['initialRating'],
              'numberOfStripes':qn.docs[i]['numberOfStripes'],
              'hasStripe':qn.docs[i]['hasStripe'],

            }
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
    final _category = ModalRoute.of(context)?.settings.arguments  as String;

    return  SafeArea(
      child: SingleChildScrollView(
          child: Column(
              children:[
            Container(
            color:Colors.lightBlue,
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(_category,style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),

                Spacer(),
              ],),
          ),
              ])
      ),
    );

  }
}

