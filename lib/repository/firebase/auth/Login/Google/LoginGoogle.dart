import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin{
  Future<UserCredential> firebaseGoogleSignIn() async{
    final GoogleSignInAccount? login = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await login?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}