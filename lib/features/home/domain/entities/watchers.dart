import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Watcher extends Equatable {
  final String name;
  final String profileImageUrl;
  final String id;

  Watcher({this.name, this.profileImageUrl, this.id});

  @override
  List<Object> get props => [name, profileImageUrl, id];

  factory Watcher.fromDoc(DocumentSnapshot doc) {
    return Watcher(
        name: doc['name'],
        id: doc.documentID,
        profileImageUrl: doc['profileImageUrl']);
  }
}
