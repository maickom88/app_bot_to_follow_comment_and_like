import 'package:insta_bot/app/modules/get_like_comment/get_like_comment_module.dart';
import 'package:insta_bot/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:insta_bot/app/modules/home/home_page.dart';
import '../get_insta/get_insta_module.dart';
class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/getFollow', module: GetInstaModule()),
        Router('/getLikeComment', module: GetLikeCommentModule()),
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
