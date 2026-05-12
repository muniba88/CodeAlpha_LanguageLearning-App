import '../supabase/supabase_cilent.dart';

class AuthService {
  static Future signUp(String email, String password) async {
    return await SupabaseService.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  static Future login(String email, String password) async {
    return await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future logout() async {
    await SupabaseService.client.auth.signOut();
  }
}
