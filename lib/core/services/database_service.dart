import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vestinsight/core/constants.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';

class DataBaseService {
  Future<User> getUserWIthId({String userId}) async {
    DocumentSnapshot snapshot = await usersRef.document(userId).get();
    if (snapshot.exists) {
      return User.fromDoc(snapshot);
    }
    return User(
        email: null, firstName: null, lastName: null, profileImageUrl: null);
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
}
