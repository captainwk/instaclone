import 'package:flutter/material.dart';
import 'package:instaclone/src/components/image_data.dart';
import 'package:instaclone/src/controller/bottom_nav_controller.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  //TabController
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          // onTap: Get.back,
          // onTap: () {
            // Get.find<BottomNavController>().willPopAction();
          // },
          onTap: BottomNavController.to.willPopAction,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFEFEFEF),
          ),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              isDense: true,
              border: InputBorder.none,
              hintText: '검색',
            ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body()
    );
  }

  PreferredSize _tabMenu() {
    return PreferredSize(
      // preferredSize: const Size.fromHeight(50), //50만큼 밑의 바닥에서 시작
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      //디바이스의 AppBar만큼의 height
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width, // double.infinity
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFEFEFEF)))),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          tabs: [
            _tabsMenu('인기'),
            _tabsMenu('계정'),
            _tabsMenu('오디오'),
            _tabsMenu('태그'),
            _tabsMenu('장소'),
          ],
        ),
      ),
    );
  }

  Widget _tabsMenu(String title) {
    return Padding(
      // 여기 패딩을 넣지 않고 클릭 영역을 꽉 차게 할 수는 없나?
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: const [
        Center(child: Text('인기페이지')),
        Center(child: Text('계정페이지')),
        Center(child: Text('오디오페이지')),
        Center(child: Text('태그페이지')),
        Center(child: Text('장소페이지')),
      ],
    );
  }
}
