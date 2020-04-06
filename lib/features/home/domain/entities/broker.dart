import 'package:equatable/equatable.dart';

class Broker extends Equatable {
  final String id;
  final String name;
  final String imgUrl;
  final List<String> investmentIds;

  Broker({this.id, this.name, this.imgUrl, this.investmentIds});

  @override
  List<Object> get props => [id, name, imgUrl, investmentIds];
}
