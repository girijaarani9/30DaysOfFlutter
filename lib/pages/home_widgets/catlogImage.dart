import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogImage extends StatelessWidget {
  final String image;
  const CatlogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, child: Image.network(image))
        .p12();
  }
}