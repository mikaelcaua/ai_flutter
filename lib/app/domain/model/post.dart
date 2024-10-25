import 'dart:convert';

class Post {
  String userSurname;
  String message;

  Post({
    required this.userSurname,
    required this.message,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userSurname': userSurname,
      'message': message,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userSurname: map['userSurname'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Post(userSurname: $userSurname, message: $message)';
}
