import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/src/components/avatar_widget.dart';
import 'package:instaclone/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 8),
          _image(),
          const SizedBox(height: 8),
          _infoCount(),
          const SizedBox(height: 8),
          _infoDescription(),
          const SizedBox(height: 8),
          _replyTextBtn(),
          const SizedBox(height: 8),
          _dateAgo(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.type3,
            thumbPath:
                'https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/2u0z/image/zD2bHQFD3Kkd1qoxo_EJlu-b7c0.jpg',
            nickname: 'wk',
            size: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: ImageData(
              IconsPath.postMoreIcon,
              width: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl:
          'https://image.fnnews.com/resource/media/image/2021/12/23/202112232132269156_l.jpg',
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ImageData(IconsPath.likeOffIcon, width: 60),
          const SizedBox(width: 8),
          ImageData(IconsPath.replyIcon, width: 60),
          const SizedBox(width: 8),
          ImageData(IconsPath.directMessage, width: 55),
          const Spacer(),
          ImageData(IconsPath.bookMarkOffIcon, width: 55),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 150개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            '콘텐츠 1입니다. \n콘텐츠 1입니다. \n콘텐츠 1입니다. \n콘텐츠 1입니다. \n',
            prefixText: '부자왕',
            onPrefixTap: () {
              print('부자왕 페이지 이동');
            },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: '더보기',
            collapseText: '접기',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          '댓글 19개 모두 보기',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '1일 전',
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}
