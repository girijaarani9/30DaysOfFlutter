import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App".text.xl5.color(context.theme.focusColor).bold.make(),
        "Trending Products".text.xl2.gray500.make()
      ],
    );
  }
}
