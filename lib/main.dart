import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:housing_app/detailPage.dart';
import 'package:housing_app/modal/headerModal.dart';
import 'package:housing_app/pages/home.dart';
import 'package:housing_app/pages/houses.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modal/rentHo_modal.dart';
import 'pages/flats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RentH0o',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily,
          iconTheme: IconThemeData(color: Colors.white)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            //?Custom AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Find Your\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: "Perfect House",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                ),
                VxBox(
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
                    .p4
                    .size(45, 45)
                    .coolGray200
                    .rounded
                    .border(color: Colors.black26)
                    .make(),
              ],
            ),
            10.heightBox,
            Divider(height: 2),
            10.heightBox,

            //!HeaderTile
            Container(
              height: 120,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  OpenContainer(
                      closedElevation: 0.0,
                      closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tappable: true,
                      useRootNavigator: true,
                      transitionDuration: Duration(seconds: 1),
                      transitionType: ContainerTransitionType.fade,
                      closedBuilder: (context, action) {
                        return _buildTile("Home", Icons.home);
                      },
                      openBuilder: (context, action) {
                        return HomePage();
                      }),
                  OpenContainer(
                      closedElevation: 0.0,
                      transitionDuration: Duration(seconds: 1),
                      transitionType: ContainerTransitionType.fade,
                      closedBuilder: (context, action) {
                        return _buildTile("Flats", Icons.date_range);
                      },
                      openBuilder: (context, action) {
                        return FlatsPage();
                      }),
                  OpenContainer(
                      closedElevation: 0.0,
                      transitionDuration: Duration(seconds: 1),
                      transitionType: ContainerTransitionType.fade,
                      closedBuilder: (context, action) {
                        return _buildTile("Rooms", Icons.person);
                      },
                      openBuilder: (context, action) => HousePage()),
                ],
              ),
            ),
            10.heightBox,
            Divider(height: 2),
            10.heightBox,
            //?................
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Nearby Houses".text.xl2.make(),
                "See All".text.red400.make(),
              ],
            ),
            10.heightBox,
            Divider(height: 2),
            10.heightBox,

            //*NearBy Flates Lists

            Container(
              height: 500,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: Vx.mOnly(top: 10, left: 10, right: 10),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final listData = list[index];
                    return OpenContainer(
                      closedElevation: 0.0,
                      openElevation: 15.0,
                      closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 500),
                      openBuilder: (context, action) {
                        return DetailPage(list: listData);
                      },
                      closedBuilder: (context, action) {
                        return _buildlistTile(
                            listData.image, listData.title, listData.location);
                      },
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }

  //!ListTile

  _buildlistTile(String image, String title, String location) {
    return Container(
      margin: Vx.mOnly(top: 15),
      decoration: BoxDecoration(
        color: Vx.coolGray200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 100,
                width: 150,
              )),
          10.widthBox,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.bold.make().shimmer(),
                3.heightBox,
                location.text.make(),
              ],
            ),
          ),
          10.widthBox,
        ],
      ),
    );
  }

  //*build Header Tile
  _buildTile(String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 100,
        decoration: BoxDecoration(
          color: Vx.purple800,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Vx.white,
              ),
              name.text.color(Vx.white).make(),
            ]),
      ),
    );
  }

  selected(String name) {
    setState(() {
      isSelected = name;
    });
  }

  changeColor(String name) {
    if (isSelected == name) {
      return Colors.black;
    } else {
      return Vx.coolGray200;
    }
  }

  changeiconColor(String name) {
    if (isSelected == name) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
