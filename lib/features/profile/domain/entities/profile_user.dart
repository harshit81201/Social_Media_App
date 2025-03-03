import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser{
  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required super.uid,
    required super.name,
    required super.email,
    required this.bio,
    required this.profileImageUrl,
  });

  ProfileUser copyWith({String? newBio, String? newProfileImageUrl}){
    return ProfileUser(
        uid: uid,
        name: name,
        email: email,
        bio: newBio ?? bio,
        profileImageUrl: newProfileImageUrl ?? profileImageUrl
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
    };
  }

  //convert json -> ProfileUser
  factory ProfileUser.fromJson(Map<String, dynamic> json){
    return ProfileUser(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        bio: json['bio'] ?? '',
        profileImageUrl: json['profileImageUrl'] ?? '',
        );
  }
}