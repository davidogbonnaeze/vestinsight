import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

class Notification extends Equatable {
  final String id;
  final String notifierId;
  final String notifierProfileImageUrl;
  final String notifierName;
  final String investmentId;

  final Timestamp timestamp;

  Notification({
    this.id,
    this.notifierId,
    this.notifierProfileImageUrl,
    this.notifierName,
    this.investmentId,
    this.timestamp,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        notifierId,
        notifierProfileImageUrl,
        notifierName,
        investmentId,
        timestamp
      ];

  factory Notification.fromDoc(DocumentSnapshot doc) {
    return Notification(
        id: doc.documentID,
        notifierId: doc['notifierId'],
        investmentId: doc['investmentId'],
        notifierName: doc['notifierName'],
        notifierProfileImageUrl: doc['notifierProfileImageUrl'],
        timestamp: doc['timestamp']);
  }
}
