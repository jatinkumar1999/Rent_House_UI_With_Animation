import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:housing_app/modal/rentHo_modal.dart';

class DetailPage extends StatefulWidget {
  final DataModal list;

  DetailPage({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: widget.list.image,
            child: Stack(
              children: [
                Image.asset(
                  widget.list.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: VxTicket(
                    width: 60,
                    height: 60,
                    backgroundColor: Colors.white30,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                ),
              ],
            ),
          ),
          30.heightBox,
          VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 30,
              child: Container(
                color: Vx.coolGray200,
                height: 400,
                width: double.infinity,
                padding: Vx.mOnly(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: widget.list.title.text.size(18).make()),
                        Container(
                            padding: Vx.m8,
                            decoration: BoxDecoration(
                              color: Vx.purple800,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child:
                                "\$2500/month".text.xl2.bold.make().shimmer()),
                      ],
                    ),
                    20.heightBox,
                    widget.list.location.text.headline6(context).make(),
                    20.heightBox,
                    widget.list.data.text.size(15).make(),
                    20.heightBox,
                    "FACLITIES".text.size(25).bold.gray900.make(),
                    8.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildwidget(Icons.wifi, "WIFI"),
                        buildwidget(Icons.local_parking_sharp, "PARKING"),
                        buildwidget(Icons.pool, "POOL"),
                      ],
                    ),
                    Spacer(),
                    Container(
                        padding: Vx.m8,
                        decoration: BoxDecoration(
                            color: Vx.coolGray100,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                widget.list.image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            25.widthBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.list.ownerName.text.semiBold
                                    .size(20)
                                    .make(),
                                widget.list.tag.text.gray400.make(),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                buildcontactTile(Icons.call, true),
                                15.widthBox,
                                buildcontactTile(Icons.message_outlined, false),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

buildcontactTile(IconData icon, bool isCall) {
  return Container(
    height: 50,
    width: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: isCall ? Vx.green700 : Vx.red700,
        width: 2,
      ),
    ),
    child: Icon(icon, color: isCall ? Vx.green700 : Vx.red700),
  );
}

buildwidget(IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: Vx.warmGray500,
      ),
      5.widthBox,
      text.text.purple800.bold.xl2.make(),
    ],
  );
}
