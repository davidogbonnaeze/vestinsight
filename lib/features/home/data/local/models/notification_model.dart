import 'package:vestinsight/features/home/data/local/models/user_model.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';

class NotificationModel extends Notification {
  final String id;
  final String notifierId;
  final String investmentId;
  final String investorName;
  final DateTime timestamp;

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
    NotificationModel(notifierId: joy.profileImageURL, investorName: joy.name);
NotificationModel two = NotificationModel(
    notifierId: favor.profileImageURL, investorName: favor.name);
NotificationModel three = NotificationModel(
    notifierId: charity.profileImageURL, investorName: charity.name);
NotificationModel four = NotificationModel(
    notifierId: nike.profileImageURL, investorName: nike.name);
NotificationModel five = NotificationModel(
    notifierId: emily.profileImageURL, investorName: emily.name);
NotificationModel six =
    NotificationModel(notifierId: zoe.profileImageURL, investorName: zoe.name);
NotificationModel seven =
    NotificationModel(notifierId: zoe.profileImageURL, investorName: zoe.name);
NotificationModel eight =
    NotificationModel(notifierId: joy.profileImageURL, investorName: joy.name);
NotificationModel nine = NotificationModel(
    notifierId: charity.profileImageURL, investorName: charity.name);
