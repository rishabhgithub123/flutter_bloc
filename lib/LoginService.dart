class LoginService {
  bool initiateLogin(String username, String password) {
    if (username == password) {
      return true;
    }
    return false;
  }
}
