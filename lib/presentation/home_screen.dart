import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/Model/datamodel.dart';
import 'package:flutter_task/presentation/common/timeline.dart';
import 'package:flutter_task/presentation/common/titlewidget.dart';
import 'package:flutter_task/presentation/devices_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataModel? dailyActivitiesData;
  @override
  void initState() {
    super.initState();
    loadDailyActivitiesData();
  }

  Future<void> loadDailyActivitiesData() async {
    // Simulated JSON data
    String jsonData = '''
      {
        "dailyactivity": [
          {
            "section": "Start your day ",
            "activity": [
              {
                "image": "assets/Rectangle 5.png",
                "header":"Chennai Mornings",
                "subheader":"Fresh Floral"
              },
              {
                "image": "assets/Rectangle 5 (1).png",
                "header":"Morning Coffee",
                "subheader":"Coffee"
              }
            ]
          },
          {
            "section": "Take an afternoon breather!",
            "activity": [
              {
                "image": "assets/Rectangle 5 (2).png",
                "header":"Pause",
                "subheader":"Vanilla Oud"
              },
              {
                "image": "assets/Rectangle 5 (3).png",
                "header":"Monsoon evening",
                "subheader":"Rain"
              }
            ]
          },
          {
            "section": "At night",
            "activity": [
              {
                "image": "assets/Rectangle 5 (4).png",
                "header":"Stroll in the tropics",
                "subheader":"Patchouli"
              }
            ]
          }
        ]
      }
    ''';

    // Parse JSON data
    final Map<String, dynamic> parsedJson = json.decode(jsonData);
    setState(() {
      dailyActivitiesData = DataModel.fromJson(parsedJson);
    });
  }

  bool active = true;
  late List<Map<String, String>> startYourDayData;
  String state = 'On';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: EdgeInsets.fromLTRB(25, 24.91, 30.83, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/profilepic.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Welcome back, Anousha!',
                      style: TextStyle(
                          color: Color(0xFFB58D40),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTitle(text: 'My Devices'),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF74533B),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 96,
                  width: 263,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDeviceContainer(),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: FloatingActionButton(
                            backgroundColor: deviceBackgroundColor,
                            shape: CircleBorder(),
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                              color: Color(0xFFBCB9B9),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTitle(text: 'Recently used'),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    _recentlyUsedCollection('assets/missingthehomelandpic.png',
                        'Missing the homeland'),
                    _recentlyUsedCollection(
                        'assets/comfortplacepic.png', 'Comfort place')
                  ],
                ),
              ],
            )),
        SizedBox(
          height: 15,
        ),
        dailyActivitiesData == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: dailyActivitiesData!.dailyactivity!
                    .map((activitySection) =>
                        _buildActivitySection(activitySection))
                    .toList(),
              ),
      ]),
    )));
  }

  Container _buildActivitySection(Dailyactivity section) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 170,
              child: Column(
                children: [
                  Expanded(
                    child: Timeline(),
                  ),
                ],
              )),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitle(text: section.section!),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 302,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: section.activity!.map((activity) {
                      return _buildActivityCollection(
                        activity.image!,
                        activity.header!,
                        activity.subheader!,
                      );
                    }).toList(),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActivityCollection(
      String image, String header, String subheader) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 49, 37, 37)
                  .withOpacity(0.5), // Shadow color
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        height: 118,
        width: 139,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 66,
              width: 143,
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: TextStyle(
                          color: Color(0xFF4D2B13),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subheader,
                      style: TextStyle(
                          color: Color(0xFF75553E),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ))
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }

  Widget _recentlyUsedCollection(String image, String place) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 130,
          height: 112,
        ),
        Text(
          place,
          style: TextStyle(
              fontSize: 12,
              color: Color(0xFF87654B),
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _buildDeviceContainer() {
    return Stack(children: [
      Container(
        height: 96,
        width: 181,
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 19),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 184, 184, 184),
              blurRadius: 5.0,
              offset: Offset(3, 3), 
            ),
            BoxShadow(
              color: const Color.fromARGB(255, 184, 184, 184),
              blurRadius: 5.0,
              offset: Offset(-3, 3), 
            ),
          ],
          color: deviceBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anousha’s home',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: TextStyle(color: Color(0xFFA39184)),
                ),
                SizedBox(
                  height: 22,
                  width: 48,
                  child: CupertinoSwitch(
                    value: active,
                    activeColor: Color(0xFFB4A194),
                    thumbColor: Color(0xFF4D2B13),
                    trackColor: Color.fromARGB(255, 158, 158, 158),
                    onChanged: (bool value) {
                      setState(() {
                        active = value;
                        state = active ? 'On' : 'Off';
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 20,
        right: 10,
        child: SvgPicture.asset('assets/setting.svg'),
      ),
    ]);
  }
}
