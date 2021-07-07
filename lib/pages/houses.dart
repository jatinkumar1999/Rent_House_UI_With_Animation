import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/modal/rentHo_modal.dart';
import 'package:housing_app/transformers/transformers.dart';
import 'package:velocity_x/velocity_x.dart';

class HousePage extends StatefulWidget {
  HousePage({Key? key}) : super(key: key);

  @override
  HousePageState createState() => HousePageState();
}

class HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TransformerPageView(
          transformer: transformers[1],
          curve: Curves.easeInBack,
          scrollDirection: Axis.vertical,
          duration: Duration(milliseconds: 200),
          viewportFraction: 5.0,
          itemCount: houselist.length,
          itemBuilder: (context, index) {
            return buildImage(roomlist[index], context);
          },
        ),
      ),
    );
  }
}

//? for add Image
buildImage(DataModal dataModal, BuildContext context) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          dataModal.image,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          bottom: 90,
          left: 15,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  dataModal.ownerImage,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
              30.widthBox,
              dataModal.ownerName.text.red600.bold.xl2.make().shimmer(),
            ],
          )),
      Positioned(
        bottom: 50,
        left: 15,
        child: dataModal.title.text.white.xl2.make(),
      ),
      Positioned(
        bottom: 30,
        left: 18,
        child: dataModal.location.text.coolGray800
            .size(15)
            .headline6(context)
            .make(),
      ),
    ],
  );
}
