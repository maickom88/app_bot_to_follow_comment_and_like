class UrlsBase {
  static String urlGetFollows(
      String username, String password, String getInsta) {
    return 'Only url in the full version! download the app!';
  }

  static String urlLikeAndComment(String username, String password,
      String getInsta, String comment, String limit) {
    return 'https://api-online.herokuapp.com/instaCommentAllFeed?name=$username&password=$password&userinsta=$getInsta&comment=$comment&limit=$limit';
  }
}
