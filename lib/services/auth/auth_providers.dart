abstract class AuthService{
  void login();
  void logOut();
  void register();

}

abstract class AuthWithFirebase extends AuthService{
  @override
  void login() {
    print('login');
  }
  @override
  void logOut() {
    print('log out');
  }
}
class GmailFirebase extends AuthWithFirebase{

  @override
  void register() {
    print('say something in register with gmail firebase');
  }
}
class AccountFirebase extends AuthWithFirebase{
  @override
  void register() {
    print('say something in register with account firebase');
  }

}