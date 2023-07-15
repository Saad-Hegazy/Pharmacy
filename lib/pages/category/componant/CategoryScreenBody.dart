import 'package:flutter/material.dart';

import 'CategoryAppBar.dart';
class Categorybody extends StatelessWidget {
  const Categorybody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
          child: Column(
              children:[
                CategoryAppBar(),
              ])
      ),
    );
  }
}

