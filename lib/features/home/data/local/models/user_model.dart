import 'package:vestinsight/features/home/domain/entities/user.dart';

class UserModel extends User {
  final String id;
  final String name;
  final String profileImageUrl;
  final List<String> investments;
  final List<String> watching;

  UserModel(
      {this.id,
      this.name,
      this.profileImageUrl,
      this.investments,
      this.watching});
}

UserModel david = UserModel(
    id: '1', name: 'David Ernest', profileImageUrl: 'assets/images/dave.jpg');
UserModel joy = UserModel(
    id: '2', name: 'Joy Anderson', profileImageUrl: 'assets/images/joy.png');
UserModel favor = UserModel(
    id: '3', name: 'Favor Brooks', profileImageUrl: 'assets/images/favor.png');
UserModel charity = UserModel(
    id: '4',
    name: 'Charity Klassen',
    profileImageUrl: 'assets/images/charity.png');
UserModel zoe = UserModel(
    id: '5', name: 'Zoe Chinaka', profileImageUrl: 'assets/images/zoe.png');
UserModel emily = UserModel(
    id: '6', name: 'Emily Woods', profileImageUrl: 'assets/images/emily.png');
UserModel nike = UserModel(
    id: '7', name: 'Nike Adams', profileImageUrl: 'assets/images/nike.png');

List<UserModel> users = [david, joy, favor, charity, zoe, emily, nike];
