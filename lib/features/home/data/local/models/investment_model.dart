import 'package:vestinsight/features/home/data/local/models/user_model.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';

class InvestmentModel extends Investment {
  final String id;
  final String amount;
  final String brokerId;
  final String investorId;
  final String investorName;
  final String description;
  final String duration;
  final DateTime investmentDate;
  final String percentageROI;
  final String proofOfInvestmentURL;
  final String investmentStatus;
  final List<String> watchers;

  InvestmentModel({
    this.id,
    this.amount,
    this.brokerId,
    this.investorId,
    this.investorName,
    this.description,
    this.duration,
    this.investmentDate,
    this.percentageROI,
    this.proofOfInvestmentURL,
    this.investmentStatus,
    this.watchers,
  });
}

List<InvestmentModel> investments = [one, two, three, four, five, six, seven];

InvestmentModel one = InvestmentModel(
  brokerId: 'assets/images/piggyvest.png',
  description: 'Beef processing and trading in Lagos state',
  duration: '6 mos',
  percentageROI: '14%',
  amount: '50,000',
  investorId: joy.profileImageURL,
  investorName: joy.name,
);

InvestmentModel two = InvestmentModel(
  brokerId: 'assets/images/cowrywise.png',
  description: 'Ginger Farm Invstment',
  duration: '5 mos',
  percentageROI: '20%',
  amount: '40,000',
  investorId: favor.profileImageURL,
  investorName: favor.name,
);

InvestmentModel three = InvestmentModel(
  brokerId: 'assets/images/thriveagric.png',
  description: 'Cattle Fattening Program Investment',
  duration: '3 mos',
  percentageROI: '10%',
  amount: '20,000',
  investorId: charity.profileImageURL,
  investorName: charity.name,
);

InvestmentModel four = InvestmentModel(
  brokerId: 'assets/images/agro_partnerships.png',
  description: 'Poultry Farm',
  duration: '7 mos',
  percentageROI: '24%',
  amount: '80,000',
  investorId: zoe.profileImageURL,
  investorName: zoe.name,
);

InvestmentModel five = InvestmentModel(
  brokerId: 'assets/images/crowdyvest.jpeg',
  description: 'Cowpea Commodity Investment',
  duration: '3 mos',
  percentageROI: '21%',
  amount: '60,000',
  investorId: emily.profileImageURL,
  investorName: emily.name,
);

InvestmentModel six = InvestmentModel(
  brokerId: 'assets/images/piggyvest.png',
  description: 'Sesame Seed Investment',
  duration: '8 mos',
  percentageROI: '35%',
  amount: '100,000',
  investorId: nike.profileImageURL,
  investorName: nike.name,
);

InvestmentModel seven = InvestmentModel(
  brokerId: 'assets/images/crowdyvest.jpeg',
  description: 'Fish Farm Investment',
  duration: '6 mos',
  percentageROI: '12%',
  amount: '50,000',
  investorId: david.profileImageURL,
  investorName: david.name,
);

//InvestmentModel one = InvestmentModel(
//  brokerId: 'assets/images/piggyvest.png',
//  description: 'Beef processing and trading in Lagos state',
//  duration: '6 mos',
//  percentageROI: '14%',
//  amount: '50,000',
//  investorId: joy.profileImageURL,
//  investorName: joy.name,
//);
//
//InvestmentModel one = InvestmentModel(
//  brokerId: 'assets/images/piggyvest.png',
//  description: 'Beef processing and trading in Lagos state',
//  duration: '6 mos',
//  percentageROI: '14%',
//  amount: '50,000',
//  investorId: joy.profileImageURL,
//  investorName: joy.name,
//);
