import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelui/src/constants/responive_con.dart';
import 'package:travelui/src/widgets/customer_reviews.dart';
import 'package:travelui/src/widgets/galeery_row.dart';
import 'package:travelui/src/widgets/header_image.dart';
import 'package:travelui/src/widgets/homepage.dart';
import 'package:travelui/src/widgets/titlr_panel.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(user);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(this.user);
  User user;
  int currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List imgList = [
    "assets/images/Business.jpg",
    "assets/images/Digital.jpg",
    "assets/images/Event.jpg",
    "assets/images/Model.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: <Widget>[
            HomePage(user: user),
            Scaffold(
              appBar: AppBar(
                title: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
                backgroundColor: Colors.blue[800],
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderImage(width: width),
                    TitleWithCustomUnderline(
                      text: 'Gallery',
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GaleeryRow(
                            text: 'Business Branding',
                            image: "assets/images/branding.svg",
                          ),
                          GaleeryRow(
                            text: 'Event and Entertainment Manegement',
                            image: "assets/images/event.svg",
                          ),
                          GaleeryRow(
                            text: 'Digital Marketing',
                            image: "assets/images/market.svg",
                          ),
                          GaleeryRow(
                            text: 'Model Mangement',
                            image: "assets/images/model.svg",
                          ),
                        ],
                      ),
                    ),
                    TitleWithCustomUnderline(
                      text: 'Follow Us',
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: Container(
                        width: width,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[800],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(FontAwesomeIcons.dribbble,
                                size: SizeConfig.textSize(context, 7),
                                color: Colors.white),
                            Icon(FontAwesomeIcons.twitter,
                                size: SizeConfig.textSize(context, 7),
                                color: Colors.white),
                            Icon(FontAwesomeIcons.instagram,
                                size: SizeConfig.textSize(context, 7),
                                color: Colors.white),
                            Icon(FontAwesomeIcons.globe,
                                size: SizeConfig.textSize(context, 7),
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    TitleWithCustomUnderline(
                      text: 'Customers Review',
                    ),
                    SizedBox(height: 15,),
                    AxonReview(),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavyBar(),
    );
  }

  BottomNavyBar buildBottomNavyBar() {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      itemCornerRadius: 8,
      curve: Curves.easeInBack,
      onItemSelected: (index) {
        setState(() => currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Dashboard'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text(
            'Messages test for mes teset test test ',
          ),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
