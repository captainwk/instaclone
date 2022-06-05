import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      // 몇 번째 인덱스가 가장 작으냐
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      print('gi = $gi');
      // var gi = i % 3;
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
      print(groupBox);
    }
    //print(groupBox);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _appBar(),
          _body(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFEFEFEF),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF838383),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.location_pin)
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                  groupBox[index].length,
                  (jndex) => Container(
                    height: (Get.width / 3) * groupBox[index][jndex],
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
