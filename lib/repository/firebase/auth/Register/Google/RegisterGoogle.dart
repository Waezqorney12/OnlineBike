import 'package:bike_online_application/common/component/AlertDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUp {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<User?> signUpWithGoogle(context) async {
    try {
      // Menggunakan Google Sign-In untuk mendapatkan kredensial Google
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // Pengguna membatalkan proses sign-in dengan Google
        return null;
      } 

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Membuat kredensial Google untuk Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Menggunakan kredensial Google untuk masuk ke Firebase
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      return authResult.user;
    } catch (e) {
      ShowDialog().errorDialogs(context, "Error Sign Up with Google");
      return null;
    }
  }
}
