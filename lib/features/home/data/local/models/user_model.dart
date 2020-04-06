import 'package:vestinsight/features/home/domain/entities/user.dart';

class UserModel extends User {
  final String id;
  final String name;
  final String profileImageURL;
  final List<String> investments;
  final List<String> watching;

  UserModel(
      {this.id,
      this.name,
      this.profileImageURL,
      this.investments,
      this.watching});
}

UserModel david = UserModel(
    id: '1', name: 'David Ernest', profileImageURL: 'assets/images/dave.jpg');
UserModel joy = UserModel(
    id: '2', name: 'Joy Anderson', profileImageURL: 'assets/images/joy.png');
UserModel favor = UserModel(
    id: '3', name: 'Favor Brooks', profileImageURL: 'assets/images/favor.png');
UserModel charity = UserModel(
    id: '4',
    name: 'Charity Klassen',
    profileImageURL: 'assets/images/charity.png');
UserModel zoe = UserModel(
    id: '5', name: 'Zoe Chinaka', profileImageURL: 'assets/images/zoe.png');
UserModel emily = UserModel(
    id: '6', name: 'Emily Woods', profileImageURL: 'assets/images/emily.png');
UserModel nike = UserModel(
    id: '7', name: 'Nike Adams', profileImageURL: 'assets/images/nike.png');

List<UserModel> users = [david, joy, favor, charity, zoe, emily, nike];
