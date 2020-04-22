import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String profileImageUrl;

  User(
      {this.id,
      @required this.firstName,
      @required this.email,
      @required this.lastName,
      @required this.profileImageUrl});

  @override
  List<Object> get props => [id, firstName, email, lastName, profileImageUrl];

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
        id: doc.documentID,
        firstName: doc['firstName'],
        lastName: doc['lastName'],
        email: doc['email'],
        profileImageUrl: doc['profileImageUrl']);
  }
}
