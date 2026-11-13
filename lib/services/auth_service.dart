/// Calls to Supabase Auth: accounts and sessions.
class AuthService {
  Future<String> signUp(String email, String password) async {
    return '';
  }

  Future<void> signIn(String email, String password) async {}

  Future<void> signOut() async {}

  bool isLoggedIn() {
    return false;
  }
}
