import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../interfaces/repository_interface.dart';
import '../../repositories/get_bot_repository.dart';

part 'get_controller.g.dart';

class GetInstaController = _GetInstaControllerBase with _$GetInstaController;

abstract class _GetInstaControllerBase with Store {
  InstaRepository instaModel = Modular.get<IGetBotRepository>();

  @observable
  SharedPreferences prefs;

  @observable
  String usernameGetInsta;

  @observable
  String passwordGetInsta;

  @observable
  String response = "ACTIVE BOT";

  @observable
  String ifProcess = '';

  @observable
  String limit = '3';

  @observable
  bool buttonCheckedLike = true;

  @action
  Future<String> getFollow(String username, String password, String getInsta,
      {String setProccess}) async {
    setIfProccess(setProccess);
    ifProcess = await instaModel.followInsta(username, password, getInsta);
    response = ifProcess;
    savePreferences(username: username, password: password);
    return ifProcess;
  }

  @action
  Future<String> getLikeComment(String username, String password,
      String getInsta, String commentary, String limit,
      {String setProccess}) async {
    setIfProccess(setProccess);
    ifProcess = await instaModel.likeInstaAndComment(
        username, password, getInsta, commentary, limit);
    response = ifProcess;
    savePreferences(username: username, password: password);
    return ifProcess;
  }

  @action
  String ifpass(String password) {
    if (password.length < 7 && password.length > 0) {
      return "Digite senha maior que 7 caracteres";
    }
    return null;
  }

  @action
  bool buttonCheckMode(bool ifChecked) {
    buttonCheckedLike = ifChecked;
    return buttonCheckedLike;
  }

  @action
  String setIfProccess(String process) {
    return ifProcess = process;
  }

  Future<void> savePreferences({String username, String password}) async {
    SharedPreferences.getInstance().then((instance) => {
          prefs.setString('username', username),
          prefs.setString('password', password),
        });
  }
}
