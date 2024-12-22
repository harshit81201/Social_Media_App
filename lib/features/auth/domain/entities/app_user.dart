class AppUser {
  final String uid;
  final String email;
  final String name;

  AppUser({
    required this.email, 
    required this.uid, 
    required this.name,
  });

  //convert app user to json
  Map<String, dynamic> toJson(){
    return{
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  //convert json to app user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser){
    return AppUser(
      email: jsonUser['email'],
      uid: jsonUser['uid'],
      name: jsonUser['name'],
      );
  }
}
