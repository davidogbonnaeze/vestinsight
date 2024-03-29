import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vestinsight/core/constants.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/notification.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/domain/entities/watchers.dart';

class DataBaseService {
  Future<User> getUser({String userId}) async {
    DocumentSnapshot userSnapshot = await usersRef.document(userId).get();
    if (userSnapshot.exists) {
      return User.fromDoc(userSnapshot);
    }
    return User(
        email: null, firstName: null, lastName: null, profileImageUrl: null);
  }

  Future<Broker> getBroker({String brokerId}) async {
    DocumentSnapshot brokerSnapshot = await brokersRef.document(brokerId).get();
    if (brokerSnapshot.exists) {
      return Broker.fromDoc(brokerSnapshot);
    }
    return Broker();
  }

  Future<Investment> getInvestment({String investmentId}) async {
    DocumentSnapshot investmentSnapshot =
        await allInvestmentsRef.document(investmentId).get();
    if (investmentSnapshot.exists) {
      return Investment.fromDoc(investmentSnapshot);
    }
    return Investment(
        amount: null,
        brokerId: null,
        investorId: null,
        description: null,
        duration: null,
        investmentDate: null,
        percentageROI: null,
        proofOfInvestmentURL: null,
        investmentStatus: null,
        timestamp: null);
  }

  void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'profileImageUrl': user.profileImageUrl,
    });
  }

  static Future<List<Broker>> getBrokers() async {
    QuerySnapshot brokersSnapshot = await brokersRef.getDocuments();
    List<Broker> brokers =
        brokersSnapshot.documents.map((docs) => Broker.fromDoc(docs)).toList();
    return brokers;
  }

  Future<List<Investment>> getBrokerInvestments(String brokerId) async {
    QuerySnapshot brokerInvestmentsSnapshot = await brokerInvestmentsRef
        .document(brokerId)
        .collection('investments')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Investment> investments = brokerInvestmentsSnapshot.documents
        .map((document) => Investment.fromDoc(document))
        .toList();
    return investments;
  }

  Future<List<Investment>> getUserInvestments(String brokerId) async {
    QuerySnapshot userInvestmentsSnapshot = await userInvestmentsRef
        .document(brokerId)
        .collection('investments')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Investment> investments = userInvestmentsSnapshot.documents
        .map((document) => Investment.fromDoc(document))
        .toList();
    return investments;
  }

  Future<List<Investment>> getAllInvestments() async {
    QuerySnapshot allInvestmentsSnapshot = await allInvestmentsRef
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Investment> investments = allInvestmentsSnapshot.documents
        .map((document) => Investment.fromDoc(document))
        .toList();
    return investments;
  }

  static Future<List<Investment>> getLatestInvestments() async {
    QuerySnapshot allInvestmentsSnapshot = await allInvestmentsRef
        .orderBy('timestamp', descending: true)
        .limit(5)
        .getDocuments();
    List<Investment> investments = allInvestmentsSnapshot.documents
        .map((document) => Investment.fromDoc(document))
        .toList();
    return investments;
  }

  Future<List<Investment>> getWatchingInvestments(String userId) async {
    QuerySnapshot watchingInvestmentsSnapshot = await watchingInvestmentsRef
        .document(userId)
        .collection('investments')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<Investment> investments = watchingInvestmentsSnapshot.documents
        .map((document) => Investment.fromDoc(document))
        .toList();
    return investments;
  }

  Future<List<AppNotification>> getNotifications(String userId) async {
    QuerySnapshot notificationsSnapshot = await notificationsRef
        .document(userId)
        .collection('userNotifications')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<AppNotification> notifications = notificationsSnapshot.documents
        .map((document) => AppNotification.fromDoc(document))
        .toList();
    return notifications;
  }

  Future<List<Watcher>> getInvestmentWatchers(String investmentId) async {
    QuerySnapshot snapshot = await investmentWatchersRef
        .document(investmentId)
        .collection('watchers')
        .getDocuments();
    List<Watcher> watchers = snapshot.documents
        .map((document) => Watcher.fromDoc(document))
        .toList();
    return watchers;
  }

  void createInvestment(Investment investment) async {
    String investmentId;
    //Populate All Investments Collection with new investment and extract investmentId
    DocumentReference investmentDoc = await allInvestmentsRef.add({
      'amount': investment.amount,
      'brokerId': investment.brokerId,
      'investorId': investment.investorId,
      'description': investment.description,
      'duration': investment.duration,
      'investmentDate': investment.investmentDate,
      'percentageROI': investment.percentageROI,
      'proofOfInvestmentURL': investment.proofOfInvestmentURL,
      'investmentStatus': investment.investmentStatus,
      'timestamp': investment.timestamp,
    });
    investmentId = investmentDoc.documentID;

    //Populate User Investments Collection with new investment
    userInvestmentsRef
        .document(investment.investorId)
        .collection('investments')
        .document(investmentId)
        .setData({
      'amount': investment.amount,
      'brokerId': investment.brokerId,
      'investorId': investment.investorId,
      'description': investment.description,
      'duration': investment.duration,
      'investmentDate': investment.investmentDate,
      'percentageROI': investment.percentageROI,
      'proofOfInvestmentURL': investment.proofOfInvestmentURL,
      'investmentStatus': investment.investmentStatus,
      'timestamp': investment.timestamp,
    });

    //Populate Brokers Investments Collection with new investment
    brokerInvestmentsRef
        .document(investment.brokerId)
        .collection('investments')
        .document(investmentId)
        .setData({
      'amount': investment.amount,
      'brokerId': investment.brokerId,
      'investorId': investment.investorId,
      'description': investment.description,
      'duration': investment.duration,
      'investmentDate': investment.investmentDate,
      'percentageROI': investment.percentageROI,
      'proofOfInvestmentURL': investment.proofOfInvestmentURL,
      'investmentStatus': investment.investmentStatus,
      'timestamp': investment.timestamp,
    });
  }

  Future<int> getNumberOfUserInvestments(String userId) async {
    QuerySnapshot snapshot = await userInvestmentsRef
        .document(userId)
        .collection('investments')
        .getDocuments();
    return snapshot.documents.length;
  }

  void watchInvestment(Investment investment, User currentUser) {
    String notifierName = currentUser.firstName + ' ' + currentUser.lastName;
    //Populate Watching Investments Collection with investment records
    watchingInvestmentsRef
        .document(currentUser.id)
        .collection('investments')
        .document(investment.id)
        .setData({
      'amount': investment.amount,
      'brokerId': investment.brokerId,
      'investorId': investment.investorId,
      'description': investment.description,
      'duration': investment.duration,
      'investmentDate': investment.investmentDate,
      'percentageROI': investment.percentageROI,
      'proofOfInvestmentURL': investment.proofOfInvestmentURL,
      'investmentStatus': investment.investmentStatus,
      'timestamp': investment.timestamp,
    });
    //Populate investment watchers collection watcher id
    investmentWatchersRef
        .document(investment.id)
        .collection('watchers')
        .document(currentUser.id)
        .setData({
      'name': notifierName,
      'profileImageUrl': currentUser.profileImageUrl,
    });
    // populate Notifications collection with new notification record
    notificationsRef
        .document(currentUser.id)
        .collection('userNotifications')
        .add({
      'action': 'Started Watching',
      'notifierId': currentUser.id,
      'investmentId': investment.id,
      'notifierName': notifierName,
      'notifierProfileImageUrl': currentUser.profileImageUrl,
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });
  }

  void unWatchInvestment(Investment investment, User currentUser) {
    String notifierName = currentUser.firstName + ' ' + currentUser.lastName;
    //Populate Watching Investments Collection with investment records
    watchingInvestmentsRef
        .document(currentUser.id)
        .collection('investments')
        .document(investment.id)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    //Populate investment watchers collection watcher id
    investmentWatchersRef
        .document(investment.id)
        .collection('watchers')
        .document(currentUser.id)
        .get()
        .then((doc) {
      if (doc.exists) {
        doc.reference.delete();
      }
    });
    // populate Notifications collection with new notification record
    notificationsRef
        .document(currentUser.id)
        .collection('userNotifications')
        .add({
      'action': 'Stopped Watching',
      'notifierId': currentUser.id,
      'investmentId': investment.id,
      'notifierName': notifierName,
      'notifierProfileImageUrl': currentUser.profileImageUrl,
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });
  }

  Future<bool> isWatchingInvestment(
      Investment investment, User currentUser) async {
    DocumentSnapshot document = await watchingInvestmentsRef
        .document(currentUser.id)
        .collection('investments')
        .document(investment.id)
        .get();
    return document.exists;
  }
}
