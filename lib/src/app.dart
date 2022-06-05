import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaclone/src/controller/bottom_nav_controller.dart';
import 'package:instaclone/src/pages/home.dart';
import 'package:instaclone/src/pages/search.dart';
import 'components/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.willPopAction,
        child: Obx(
          () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                // Container(
                //   child: const Center(child: Text('HOME')),
                // ),
                const Search(),
                // Container(
                //   child: const Center(child: Text('SEARCH')),
                // ),
                Container(
                  child: const Center(child: Text('UPLOAD')),
                ),
                Container(
                  child: const Center(child: Text('ACTIVITY')),
                ),
                Container(
                  child: const Center(child: Text('MYPAGE')),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 3,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff),
                    activeIcon: ImageData(IconsPath.homeOn),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff),
                    activeIcon: ImageData(IconsPath.searchOn),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    label: 'Home'),
              ],
            ),
          ),
        )
    );
  }
}
