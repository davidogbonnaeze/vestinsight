import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/presentation/blocs/broker_investment/bloc.dart';
import 'package:vestinsight/features/home/presentation/blocs/explore_investment/bloc.dart';
import 'package:vestinsight/features/home/presentation/widgets/elevated_investment_card.dart';

import '../../../../injection_container.dart';

class BrokerInvestmentsScreen extends StatefulWidget {
  final String brokerId;

  const BrokerInvestmentsScreen({Key key, this.brokerId}) : super(key: key);
  @override
  _BrokerInvestmentsScreenState createState() =>
      _BrokerInvestmentsScreenState();
}

class _BrokerInvestmentsScreenState extends State<BrokerInvestmentsScreen> {
  BrokerInvestmentBloc _brokerInvestmentBloc;
  @override
  void initState() {
    super.initState();
    _brokerInvestmentBloc = sl<BrokerInvestmentBloc>();
    if (mounted) {
      _brokerInvestmentBloc
          .add(BrokerInvestmentsPageLoadedEvent(brokerId: widget.brokerId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrokerInvestmentBloc>(
      create: (_) => _brokerInvestmentBloc,
      child: BlocBuilder<BrokerInvestmentBloc, BrokerInvestmentState>(
        bloc: _brokerInvestmentBloc,
        builder: (context, state) {
          if (state is BrokerInvestmentLoadingState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: SizedBox.shrink(),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
                title: Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black45, fontSize: 20),
                  ),
                ),
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is BrokerInvestmentFailureState) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: SizedBox.shrink(),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
                title: Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black45, fontSize: 20),
                  ),
                ),
              ),
              body: Center(
                child: Text(state.message),
              ),
            );
          }
          if (state is BrokerInvestmentSuccessState) {
            List<Investment> allInvestments = state.investments;
            Broker broker = state.broker;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: SizedBox.shrink(),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {},
                  )
                ],
                title: Center(
                  child: Text(
                    '${broker.name}',
                    style: TextStyle(color: Colors.black45, fontSize: 20),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: allInvestments.length,
                    itemBuilder: (BuildContext context, int index) {
                      Investment investment = allInvestments[index];
                      return ElevatedInvestmentCard(
                        investmentId: investment.id,
                        brokerId: investment.brokerId,
                        investmentAmount: investment.amount,
                        investmentDescription: investment.description,
                        investmentDuration: investment.duration,
                        investorId: investment.investorId,
                        percentageROI: investment.percentageROI,
                      );
                    }),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _brokerInvestmentBloc.close();
  }
}
