import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ 
          Positioned(
            top: -20,
            child: SvgPicture.asset('assets/Ellipse 11.svg'),
          ),
          Positioned(
            top: -20,
            child: SvgPicture.asset('assets/Ellipse 12.svg'),
          ),
          Positioned(
            top: -20,
            child: SvgPicture.asset('assets/Ellipse 13.svg'),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 85,
                  width: 85,
                  child: Image.asset('assets/profile.png'),
                ),
                const Text(
                  'Anousha Chowdhry',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB58D40),
                  ),
                ),
                const Text(
                  '@AnChow',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF75553E),
                  ),
                ),
                const Text(
                  'London, United Kingdom',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF75553E),
                  ),
                ),
                const SizedBox(height: 10),
                _buildProfileOption(
                  iconPath: 'assets/profiledetailes.svg',
                  title: 'Personal details',
                ),
                const SizedBox(height: 10),
                _buildProfileOption(
                  iconPath: 'assets/addfriends.svg',
                  title: 'Add friends',
                ),
                const SizedBox(height: 10),
                _buildProfileOption(
                  iconPath: 'assets/privacy.svg',
                  title: 'Privacy settings',
                ),
                const SizedBox(height: 10),
                _buildProfileOption(
                  iconPath: 'assets/notification.svg',
                  title: 'Notification preferences',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({required String iconPath, required String title}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE9E5),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 40,
      width: 340,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF4D2B13),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Color(0xFFB0927E),
          ),
        ],
      ),
    );
  }
}
