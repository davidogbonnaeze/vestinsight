import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vestinsight/features/home/data/local/models/investment_model.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/presentation/blocs/explore_investment/bloc.dart';
import 'package:vestinsight/features/home/presentation/blocs/explore_investment/explore_investment_bloc.dart';
import 'package:vestinsight/features/home/presentation/pages/dashboard_screen.dart';
import 'package:vestinsight/features/home/presentation/widgets/elevated_investment_card.dart';
import 'package:vestinsight/features/home/presentation/widgets/investment_card.dart';

import '../../../../injection_container.dart';

class ExploreInvestmentsScreen extends StatefulWidget {
  @override
  _ExploreInvestmentsScreenState createState() =>
      _ExploreInvestmentsScreenState();
}

class _ExploreInvestmentsScreenState extends State<ExploreInvestmentsScreen> {
  ExploreInvestmentBloc _exploreInvestmentBloc;
  @override
  void initState() {
    super.initState();
    _exploreInvestmentBloc = sl<ExploreInvestmentBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreInvestmentBloc>(
      create: (_) => _exploreInvestmentBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: SizedBox.shrink(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              iconSize: 20,
              color: Colors.black45,
              onPressed: () {},
            )
          ],
          title: Center(
            child: Text(
              'Explore Investments',
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
          ),
        ),
        body: BlocBuilder<ExploreInvestmentBloc, ExploreInvestmentState>(
          bloc: _exploreInvestmentBloc,
          builder: (context, state) {
            if (state is ExploreInvestmentLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ExploreInvestmentFailureState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is ExploreInvestmentSuccessState) {
              List<Investment> allInvestments = state.investments;
              return Padding(
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
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _exploreInvestmentBloc.close();
  }
}
