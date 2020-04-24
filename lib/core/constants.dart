import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vestinsight/injection_container.dart';

final _fireStore = sl<Firestore>();
final _fireBaseStorage = sl<FirebaseStorage>();
final storageRef = _fireBaseStorage.ref();
final allInvestmentsRef = _fireStore.collection('allInvestments');
final brokersRef = _fireStore.collection('brokers');
final investmentWatchersRef = _fireStore.collection('investmentWatchers');
final notificationsRef = _fireStore.collection('notifications');
final userInvestmentsRef = _fireStore.collection('userInvestments');
final brokerInvestmentsRef = _fireStore.collection('brokerInvestments');
final usersRef = _fireStore.collection('users');
final watchingInvestmentsRef = _fireStore.collection('watchingInvestments');
