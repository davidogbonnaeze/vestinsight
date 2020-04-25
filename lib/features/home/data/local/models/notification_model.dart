import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vestinsight/features/home/data/local/models/user_model.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';

class NotificationModel{
  final String id;
  final String notifierId;
  final String investmentId;
  final String investorName;
  final Timestamp timestamp;

  NotificationModel(
      {this.id,
      this.notifierId,
      this.investorName,
      this.investmentId,
      this.timestamp});
}

List<NotificationModel> notifications = [
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine
];
NotificationModel one =
    NotificationModel(notifierId: joy.profileImageUrl, investorName: joy.name);
NotificationModel two = NotificationModel(
    notifierId: favor.profileImageUrl, investorName: favor.name);
NotificationModel three = NotificationModel(
    notifierId: charity.profileImageUrl, investorName: charity.name);
NotificationModel four = NotificationModel(
    notifierId: nike.profileImageUrl, investorName: nike.name);
NotificationModel five = NotificationModel(
    notifierId: emily.profileImageUrl, investorName: emily.name);
NotificationModel six =
    NotificationModel(notifierId: zoe.profileImageUrl, investorName: zoe.name);
NotificationModel seven =
    NotificationModel(notifierId: zoe.profileImageUrl, investorName: zoe.name);
NotificationModel eight =
    NotificationModel(notifierId: joy.profileImageUrl, investorName: joy.name);
NotificationModel nine = NotificationModel(
    notifierId: charity.profileImageUrl, investorName: charity.name);
