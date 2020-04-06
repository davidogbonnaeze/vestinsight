import 'package:vestinsight/features/home/domain/entities/broker.dart';

class BrokerModel extends Broker {
  BrokerModel({
    String id,
    String name,
    String imgUrl,
    List<String> investmentIds,
  }) : super(
          id: id,
          name: name,
          imgUrl: imgUrl,
          investmentIds: investmentIds,
        );

  factory BrokerModel.fromJson(Map<String, dynamic> json) {
    return BrokerModel(
      id: json['id'],
      name: json['name'],
      imgUrl: json['imgUrl'],
      investmentIds: json['investmentIds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
      'investmentIds': investmentIds,
    };
  }
}

BrokerModel agroPartnerships = BrokerModel(
    id: '1',
    name: 'AgroPartnerships',
    imgUrl: 'assets/images/agro_partnerships.png');
BrokerModel cowryWise = BrokerModel(
    id: '2', name: 'CowryWise', imgUrl: 'assets/images/cowrywise.png');
BrokerModel crowdyVest = BrokerModel(
    id: '3', name: 'CrowdyVest', imgUrl: 'assets/images/crowdyvest.jpeg');
BrokerModel piggyVest = BrokerModel(
    id: '4', name: 'PiggyVest', imgUrl: 'assets/images/piggyvest.png');
BrokerModel thriveAgric = BrokerModel(
    id: '5', name: 'ThriveAgric', imgUrl: 'assets/images/thriveagric.png');
List<BrokerModel> brokers = [
  agroPartnerships,
  cowryWise,
  crowdyVest,
  piggyVest,
  thriveAgric
];
