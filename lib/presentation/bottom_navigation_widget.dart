import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  BottomNavigationWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<Color> itemColors =
      List.filled(5, Color(0xFF74533B)); 

  @override
  void initState() {
    super.initState();
    itemColors[widget.selectedIndex] =
        Colors.white; 
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 83, // Adjust the height as per your requirement
        child: BottomNavigationBar(
          items: [
            buildSvgItem('assets/home.svg', 0, 'Home'),
            buildSvgItem('assets/library.svg', 1, 'Library'),
            buildSvgItem('assets/devices.svg', 2, 'Devices'),
            buildSvgItem('assets/music.svg', 3, 'Music'),
            buildSvgItem('assets/profile.svg', 4, 'profile'),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            widget.onItemTapped(index);
            setState(() {
              for (int i = 0; i < itemColors.length; i++) {
                itemColors[i] = (i == index) ? Colors.white : Color(0xFF74533B);
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFB0927E),
        ));
  }

  BottomNavigationBarItem buildSvgItem(
      String assetPath, int index, String lable) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          widget.onItemTapped(index);
          setState(() {
            for (int i = 0; i < itemColors.length; i++) {
              itemColors[i] = (i == index) ? Colors.white : Color(0xFF74533B);
            }
          });
        },
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
          color: itemColors[index],
        ),
      ),
      label: lable,
    );
  }
}
