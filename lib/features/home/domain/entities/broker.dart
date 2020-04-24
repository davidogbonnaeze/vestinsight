import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Broker extends Equatable {
  final String id;
  final String name;
  final String imgUrl;

  Broker({
    this.id,
    this.name,
    this.imgUrl,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imgUrl,
      ];

  factory Broker.fromDoc(DocumentSnapshot doc) {
    return Broker(id: doc.documentID, name: doc['name'], imgUrl: doc['imgUrl']);
  }
}
