class UrlsBase {
  static String urlGetFollows(
      String username, String password, String getInsta) {
    return 'http://192.168.0.107:5000/instaBot2?name=$username&password=$password&userinsta=$getInsta';
  }

  static String urlLikeAndComment(String username, String password,
      String getInsta, String comment, String limit) {
    return 'http://192.168.0.107:5000/instaCommentAllFeed?name=$username&password=$password&userinsta=$getInsta&comment=$comment&limit=$limit';
  }
}
