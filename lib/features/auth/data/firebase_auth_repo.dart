import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try{
      UserCredential userCredential = await firebaseAuth.
      signInWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );

      return user;
    }
    catch(e){
      throw Exception("Login Failed!: $e");
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(String name, String email, String password) async {
    // TODO: implement registerWithEmailPassword
    try{
      UserCredential userCredential = await firebaseAuth.
      createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      //save user name to firebase
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());

      return user;
    }
    catch(e){
      throw Exception("Login Failed!: $e");
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    try{
      await firebaseAuth.signOut();
    }
    catch(e){
      throw Exception("Logout Failed!: $e");
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    // TODO: implement getCurrentUser
    
    //get current logged in user from firebase
    final firebaseUser = firebaseAuth.currentUser;

    //no user login
    if(firebaseUser == null){
      return Future.value(null);
    }

    //User exists
    return AppUser(
      email: firebaseUser.email!,
      uid: firebaseUser.uid, 
      name: '',
      );
  }
}