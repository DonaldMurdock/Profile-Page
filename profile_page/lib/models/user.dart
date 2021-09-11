import 'dart:io';

class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String bio;
  File? photo;

  //Constructor with named parameters
  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.bio,
    this.photo
  });
  
}