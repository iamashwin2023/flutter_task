import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/presentation/common/titlewidget.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 24.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(text:'Browse'),
            SizedBox(height: 5,),
            _buildMusicServiceContainer(),
          ],
        ),
      ),
    );
  }


  Widget _buildMusicServiceContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFEDE9E5),
      ),
      width: 334,
      height: 238.26,
      child: Column(
        children: [
          _buildMusicServiceItem(
            title: 'Spotify',
            iconPath: 'assets/spotify.png',
            onTap: () {},
          ),
          _buildMusicServiceItem(
            title: 'Apple Music',
            iconPath: 'assets/applemusic.png',
            onTap: () {},
          ),
          _buildMusicServiceItem(
            title: 'SoundCloud',
            iconPath: 'assets/soundcloud.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMusicServiceItem({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(iconPath),
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xFFB0927E),
            ),
          ],
        ),
      ),
    );
  }
}