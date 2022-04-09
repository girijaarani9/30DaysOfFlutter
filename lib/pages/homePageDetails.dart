import 'package:flutter/material.dart';
import 'package:flutter_days/models/catlog.dart';
import 'package:flutter_days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetail extends StatelessWidget {
  final Item catalog;
  const HomePageDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                height: 300,
                width: 100,
                child: Image.network(catalog.imageUrl)),
            Expanded(
                child: VxArc(
              arcType: VxArcType.CONVEX,
              edge: VxEdge.TOP,
              height: 30,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                color: Colors.white,
                child: Column(
                  children: [
                    Hero(
                      tag: Key(catalog.id.toString()),
                      child: Center(
                          child: Text(
                        catalog.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: MyTheme.black),
                      )),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(color: MyTheme.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //  crossAxisAlignment: CrossAxisAlignment.end,

                        "\$${catalog.price}"
                            .text
                            .bold
                            .xl4
                            .color(MyTheme.blue)
                            .make(),
                        Container(
                            width: 100,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(MyTheme.black),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              child: Text("Buy"),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
