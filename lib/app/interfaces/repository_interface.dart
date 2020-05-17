class IGetBotRepository {
  Future<void> likeInstaAndComment(String username, String password,
      String getInsta, String commentary, String limit) async {}

  Future<void> followInsta(
      String username, String password, String getInsta) async {}
}
