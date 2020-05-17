import 'package:flutter_modular/flutter_modular.dart';
import 'get_insta_page.dart';
class GetInstaModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router( '/getLikeComment'  , child: (_, args) => GetInstaPage()),
  ];

  static Inject get to => Inject<GetInstaModule>.of();
}
