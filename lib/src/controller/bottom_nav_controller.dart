import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaclone/src/components/message_popup.dart';
import 'package:instaclone/src/pages/uploadPage.dart';

enum PageName {
  home,
  search,
  upload,
  activity,
  myPage,
}

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int index, {bool hasGesture = true}) {
    var page = PageName.values[index];
    switch (page) {
      case PageName.home:
      case PageName.search:
      case PageName.activity:
      case PageName.myPage:
        _changePage(index, hasGesture: hasGesture);
        break;
      case PageName.upload:
        Get.to(() => const UploadPage());
        break;
    }
  }

  void _changePage(int index, {bool hasGesture = true}) {
    pageIndex(index);
    if (!hasGesture) return;
    if (bottomHistory.contains(index)) {
      bottomHistory.remove(index);
    }
    bottomHistory.add(index);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                title: '시스템',
                message: '종료하시겠습니까?',
                okCallback: () {
                  exit(0);
                },
                cancelCallback: Get.back,
              ));
      print('exit');

      return false;
    } else {
      print('goto before page!');
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}
