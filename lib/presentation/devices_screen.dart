import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/presentation/common/titlewidget.dart';

const Color deviceBackgroundColor = const Color(0xFFE2DAD4);

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  bool active = true;
  String state = 'On';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30.83, 24.91, 30.83, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(text: 'My Devices'),
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
            SizedBox(height: 20),
            CustomTitle(text: 'My Rooms'),
            _buildSearchAndAddButton(),
            _buildRoomContainer('Home <3', [
              'assets/person1.png',
              'assets/person2.png',
              'assets/person3.png'
            ]),
            SizedBox(
              height: 15,
            ),
            _buildRoomContainer('UniDays', [
              'assets/person4.png',
              'assets/person5.png',
              'assets/person6.png'
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceContainer() {
    return Container(
      height: 96,
      width: 181,
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 19),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 184, 184, 184),
            blurRadius: 5.0,
            offset: Offset(3, 3), // Right and bottom shadow
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 184, 184, 184),
            blurRadius: 5.0,
            offset: Offset(-3, 3), // Left and bottom shadow
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
    );
  }

  Widget _buildSearchAndAddButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset("assets/search.svg"),
          ),
          Icon(
            size: 20,
            Icons.add,
            color: Color(0xFFA59081),
          )
        ],
      ),
    );
  }

  Widget _buildRoomContainer(String title, List<String> imagePaths) {
    return Container(
      width: 325,
      height: 87,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: deviceBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color(0xFF74533B),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 50,
            height: 30,
            child: Stack(
              children: [
                for (int i = 0; i < imagePaths.length; i++)
                  Positioned(
                    left: i * 7.0,
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(imagePaths[i]),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
