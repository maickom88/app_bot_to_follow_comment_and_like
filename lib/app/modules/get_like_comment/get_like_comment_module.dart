import 'package:flutter_modular/flutter_modular.dart';

import 'get_like_comment_page.dart';

class GetLikeCommentModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router( '/getFollow'  , child: (_, args) => GetLikeCommentPage())
  ];

  static Inject get to => Inject<GetLikeCommentModule>.of();
}
