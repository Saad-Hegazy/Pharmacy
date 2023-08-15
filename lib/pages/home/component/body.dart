import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../services/model/Carusel.dart';
import '../../../services/Function.dart';
import '../../../theme/size_config.dart';
import '../../../widgets/ItemsWidget.dart';
import '../../../widgets/NewSection.dart';
import 'CategoriesWidget.dart';
import 'OrderNow.dart';
import 'home_header.dart';
class HomePageBodyComponent extends StatefulWidget {
  const HomePageBodyComponent({super.key});

  @override
  State<HomePageBodyComponent> createState() => _HomePageBodyComponentState();
}

class _HomePageBodyComponentState extends State<HomePageBodyComponent> {
  List<Carusel> _CaruselimagesList = [];
  fetchCarouselImages()async{
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("sliderImage").get();
    setState(() {
      for(int i=0 ; i<qn.docs.length ;i++){
        _CaruselimagesList.add(
          Carusel(url: qn.docs[i]['url'], link: qn.docs[i]['link'],)
        );
      }
    });
    return _CaruselimagesList;
  }

  @override
  void initState() {
    fetchCarouselImages();
    super.initState();
  }

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                HomeHeader(),
                SizedBox(height: getProportionateScreenWidth(10)),
                slider(),
                NewSection(titel: "اطلب دوائك بأسهل طرية"),
                OrderNow(),
                Container(margin: EdgeInsets.only(right: 7), child: NewSection(titel: "الأقسام")),
                CategoriesWidget(),
                Container(margin: EdgeInsets.only(right: 7), child: NewSection(titel: "خليك بصحة كاملة")),
                const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: ItemsWidget()),
              ],),
          ),
    );

  }
  Padding slider() {
    return Padding(
      padding: EdgeInsets.only(left: 15,  right: 15),
      child: Stack(
        children: [
           ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: CarouselSlider(
                items: _CaruselimagesList
                    .map(
                      (item) => InkWell(
                        onTap: (){
                          Functions().launchURLBrowser(item.link);
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                item.url
                              ),
                              fit: BoxFit.fill,

                            ),
                          ),
                        ),
                      )
                ).toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _CaruselimagesList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(510),
                        color: currentIndex == entry.key
                            ? Colors.red
                            : Colors.blue),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

}

