import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/presentation/common/titlewidget.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String selectedCollection = "My Creation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.83, 24.91, 30.83, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(text:'My Library'),
            SizedBox(height: 5),
            Row(
              children: [
                _buildLibraryCollection("My Creation", "assets/heart.svg"),
                _buildLibraryCollection("Scents", null),
                _buildLibraryCollection("Sounds", null),
              ],
            ),
            _buildSearchAndAddButton(),
            Expanded(
              child: ListView(
                children: [
                  _buildMyLibraryWidget(
                    image: 'assets/chennai.png',
                    location: 'Chennai 2022',
                    info: 'April 2022 • Jasmine ',
                  ),
                  _buildMyLibraryWidget(
                    image: 'assets/homeland.png',
                    location: 'Missing the homeland',
                    info: 'Dec 2019 • Sandalwood + Rose',
                  ),
                  _buildMyLibraryWidget(
                    image: 'assets/comfortplace.png',
                    location: 'Comfort place',
                    info: 'Sept 2020 • Forest + rain',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildLibraryCollection(String collection, String? imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCollection = collection;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedCollection == collection
              ? const Color(0xFF4D2B13)
              : Color(0xFFA59081),
        ),
        child: Row(
          children: [
            if (imagePath != null)
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(imagePath),
              ),
            Text(
              collection,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndAddButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 15),
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
          ),
        ],
      ),
    );
  }

  Widget _buildMyLibraryWidget({
    required String image,
    required String location,
    required String info,
  }) {
    return Container(
      height: 76,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 53,
            width: 53,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
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
                Text(
                  info,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

