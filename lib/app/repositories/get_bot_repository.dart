import 'package:http/http.dart' as http;
import '../interfaces/repository_interface.dart';
import '../shared/urls/url_base_insta_bot.dart';

class InstaRepository implements IGetBotRepository {
  @override
  Future<String> followInsta(
      String username, String password, String getInsta) async {
    try {
      var url = UrlsBase.urlGetFollows(username, password, getInsta);
      var response = await http.get(url);
      return response.body.toString();
    } on Exception catch (e) {
      return 'Erro ao processar! $e';
    }
  }

  @override
  Future<String> likeInstaAndComment(String username, String password,
      String getInsta, String commentary, String limit) async {
    try {
      var url = UrlsBase.urlLikeAndComment(
          username, password, getInsta, commentary, limit);
      var response = await http.get(url);
      return response.body.toString();
    }on Exception catch (e) {
      return 'Erro ao processar! $e';
    }
  }
}
