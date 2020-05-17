
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'interfaces/repository_interface.dart';
import 'modules/get_insta/get_controller.dart';
import 'modules/get_insta/get_insta_module.dart';
import 'modules/get_like_comment/get_like_comment_controller.dart';
import 'modules/get_like_comment/get_like_comment_module.dart';
import 'modules/home/home_module.dart';
import 'repositories/get_bot_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IGetBotRepository>(
          (i) => InstaRepository(),
        ),
        Bind(
          (i) => GetInstaController(),
        ),
        Bind(
          (i) => GetLikeCommentController(),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/getFollows', module: GetInstaModule()),
        Router('/getLikeComment', module: GetLikeCommentModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
