import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppNotification extends Equatable {
  final String id;
  final String notifierId;
  final String notifierProfileImageUrl;
  final String notifierName;
  final String investmentId;
  final String action;
  final Timestamp timestamp;

  AppNotification(
      {this.id,
      this.notifierId,
      this.notifierProfileImageUrl,
      this.notifierName,
      this.investmentId,
      this.timestamp,
      this.action});

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        notifierId,
        notifierProfileImageUrl,
        notifierName,
        investmentId,
        timestamp,
        action
      ];

  factory AppNotification.fromDoc(DocumentSnapshot doc) {
    return AppNotification(
        id: doc.documentID,
        notifierId: doc['notifierId'],
        investmentId: doc['investmentId'],
        notifierName: doc['notifierName'],
        notifierProfileImageUrl: doc['notifierProfileImageUrl'],
        timestamp: doc['timestamp'],
        action: doc['action']);
  }
}
