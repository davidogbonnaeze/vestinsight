import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vestinsight/core/constants.dart';
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

  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'profileImageUrl': user.profileImageUrl,
    });
  }
}
