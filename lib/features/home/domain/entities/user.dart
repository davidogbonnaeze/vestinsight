import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String profileImageURL;
  final List<String> investments;
  final List<String> watching;

  User(
      {this.id,
      this.name,
      this.profileImageURL,
      this.investments,
      this.watching});

  @override
  List<Object> get props => [id, name, profileImageURL, investments, watching];
}
