import 'package:flutter/material.dart';
import 'package:instaclone/src/components/avatar_widget.dart';
import 'package:instaclone/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          // _postList(),
        ],
      ),
    );
  }
}

Widget _storyBoardList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: [
      const SizedBox(width: 16),
      _myStory(),
      const SizedBox(width: 5),
      ...List.generate(
        100,
        (index) => AvatarWidget(
            type: AvatarType.type1,
            thumbPath:
                'http://image.dongascience.com/Photo/2017/03/14900752352661.jpg'),
      ),
    ]),
  );
}

Widget _myStory() {
  return Stack(
    children: [
      AvatarWidget(
        type: AvatarType.type2,
        size: 70,
        thumbPath:
            'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/2u0z/image/zD2bHQFD3Kkd1qoxo_EJlu-b7c0.jpg',
      ),
      Positioned(
        right: 5,
        bottom: 0,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

