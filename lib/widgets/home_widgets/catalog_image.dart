import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  // const CatalogImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .rounded
        .p8
        .color(Color.fromARGB(255, 247, 244, 244))
        .make()
        .p16()
        .w40(context);
  }
}
