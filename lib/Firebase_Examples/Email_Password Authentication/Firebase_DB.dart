import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper{
  //object creation of firebase
final FirebaseAuth auth = FirebaseAuth.instance;
//user vilicha already ulla usersne kitm  currentUser - builin
get user => auth.currentUser;

 Future<String?> register({required String useremail, required String password}) async{
   try{
     await auth.createUserWithEmailAndPassword(
         email: useremail,
         password: password
     );
     return null;
   }on FirebaseAuthException catch (e){
     return e.message;
   }
 }

Future<String?> login({required String email, required String password}) async{
   try{
     await auth.signInWithEmailAndPassword(
         email: email,
         password: password);
     return null;
   }on FirebaseAuthException catch (e){
     return e.message;
   }
}


///logout
 Future<void> logOut() async{
   await auth.signOut();
 }





}