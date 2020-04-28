import 'package:cached_network_image/cached_network_image.dart';
import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/investment_card/bloc.dart';
import 'package:vestinsight/routes.dart';

class InvestmentCard extends StatefulWidget {
  final String investorId;
  final String brokerId;
  final String investmentId;
  final String investmentDescription;
  final String investmentAmount;
  final String investmentDuration;
  final String percentageROI;

  InvestmentCard(
      {this.investorId,
      this.brokerId,
      this.investmentId,
      this.investmentDescription,
      this.investmentAmount,
      this.investmentDuration,
      this.percentageROI});

  @override
  _InvestmentCardState createState() => _InvestmentCardState();
}

class _InvestmentCardState extends State<InvestmentCard> {
  InvestmentCardBloc _investmentCardBloc;

  @override
  void initState() {
    super.initState();
    _investmentCardBloc = InvestmentCardBloc()
      ..add(InvestmentCardLoaded(
          brokerId: widget.brokerId,
          investorId: widget.investorId,
          investmentId: widget.investmentId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvestmentCardBloc>(
      create: (_) => _investmentCardBloc,
      child: BlocBuilder<InvestmentCardBloc, InvestmentCardState>(
        bloc: _investmentCardBloc,
        builder: (context, state) {
          if (state is InvestmentCardSuccessState) {
            Broker broker = state.broker;
            User investor = state.investor;
            return InkWell(
              onTap: () => Routes.sailor.navigate(
                '/investment_screen',
                transitions: [SailorTransition.slide_from_right],
                params: {
                  'investment': state.investment,
                  'broker': state.broker,
                  'investor': state.investor,
                },
              ),
              child: Container(
                height: 200,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage:
                                      investor.profileImageUrl.isEmpty
                                          ? AssetImage(
                                              'assets/images/placeholder.png')
                                          : CachedNetworkImageProvider(
                                              investor.profileImageUrl),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  '${investor.firstName} ${investor.lastName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(broker.imgUrl),
                          )
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.investmentDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '₦${widget.investmentAmount}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Amount',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${widget.percentageROI}%',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Returns',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${widget.investmentDuration} mos',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Duration',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is InvestmentCardLoadingState) {
            return ContentPlaceholder(
              height: 200,
              spacing: EdgeInsets.only(bottom: 0),
            );
          }
          if (state is InvestmentCardFailureState) {
            return ContentPlaceholder(height: 200);
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _investmentCardBloc.close();
  }
}
