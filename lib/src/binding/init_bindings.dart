// 앱이 실행되는 동시에 getx 컨트롤러들을 필요에 따라 인스턴스에 올려주기 위한 클래스
import 'package:get/get.dart';
import 'package:instaclone/src/controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // permanent 를 true로 주면 앱이 종료되는 시점까지 살아있도록 옵션 설정
    Get.put(BottomNavController(), permanent: true);
  }

}