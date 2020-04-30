import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/features/home/domain/entities/broker.dart';
import 'package:vestinsight/features/home/domain/entities/investment.dart';
import 'package:vestinsight/features/home/domain/entities/user.dart';
import 'package:vestinsight/features/home/presentation/blocs/watch_investment/bloc.dart';
import 'package:vestinsight/features/onboarding/presentation/bloc/user_auth/bloc.dart';
import 'package:vestinsight/injection_container.dart';

import '../../../../routes.dart';

class InvestmentScreen extends StatefulWidget {
  final Investment investment;
  final User investor;
  final Broker broker;

  const InvestmentScreen({Key key, this.investment, this.investor, this.broker})
      : super(key: key);

  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  bool _isWatching = false;
  WatchInvestmentBloc _watchInvestmentBloc;
  User user;

  @override
  void initState() {
    super.initState();
    user = BlocProvider.of<UserAuthBloc>(context).state.props[0];
    _watchInvestmentBloc = sl<WatchInvestmentBloc>();
    if (mounted) {
      _watchInvestmentBloc.add(IsWatchingInvestmentEvent(
          currentUser: user, investment: widget.investment));
    }
  }

  toggleWatching() {
    return _isWatching = !_isWatching;
  }

  bool isCurrentUserOwnerOfInvestment() {
    return user.id == widget.investment.investorId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WatchInvestmentBloc>(
      create: (_) => _watchInvestmentBloc,
      child: BlocListener<WatchInvestmentBloc, WatchInvestmentState>(
        bloc: _watchInvestmentBloc,
        listener: (context, state) {
          if (state is WatchInvestmentLoadingState) {
            return BotToast.showCustomLoading(
                clickClose: false,
                allowClick: true,
                backButtonBehavior: BackButtonBehavior.none,
                ignoreContentClick: false,
                backgroundColor: Color(0x42000000),
                align: Alignment.center,
                toastBuilder: (cancelFunc) {
                  return Card(
                    shape: RoundedRectangleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                });
          }
          if (state is WatchInvestmentSuccessState) {
            setState(() {
              toggleWatching();
            });
            BotToast.closeAllLoading();
            BotToast.showNotification(
              leading: (cancel) => SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: IconButton(
                    icon:
                        Icon(Icons.done, color: Theme.of(context).primaryColor),
                    onPressed: cancel,
                  )),
              title: (_) => Text(
                  'You have succesfully started watching this investment',
                  style: TextStyle(fontSize: 16)),
              enableSlideOff: true,
              backButtonBehavior: BackButtonBehavior.none,
              crossPage: true,
              contentPadding: EdgeInsets.all(2),
              onlyOne: true,
              animationDuration: Duration(milliseconds: 200),
              animationReverseDuration: Duration(milliseconds: 200),
              duration: Duration(seconds: 5),
            );
            _watchInvestmentBloc.add(IsWatchingInvestmentEvent(
                currentUser: user, investment: widget.investment));
          }
          if (state is WatchInvestmentFailureState) {
            BotToast.closeAllLoading();
            BotToast.showCustomLoading(
                clickClose: true,
                allowClick: true,
                backButtonBehavior: BackButtonBehavior.none,
                ignoreContentClick: false,
                backgroundColor: Color(0x42000000),
                align: Alignment.center,
                toastBuilder: (cancelFunc) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(state.message),
                    ),
                  );
                });
          }
          if (state is UnWatchInvestmentLoadingState) {
            return BotToast.showCustomLoading(
                clickClose: false,
                allowClick: true,
                backButtonBehavior: BackButtonBehavior.none,
                ignoreContentClick: false,
                backgroundColor: Color(0x42000000),
                align: Alignment.center,
                toastBuilder: (cancelFunc) {
                  return Card(
                    shape: RoundedRectangleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).primaryColor,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                });
          }
          if (state is UnWatchInvestmentSuccessState) {
            setState(() {
              toggleWatching();
            });
            BotToast.closeAllLoading();
            BotToast.showNotification(
              leading: (cancel) => SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: IconButton(
                    icon:
                        Icon(Icons.done, color: Theme.of(context).primaryColor),
                    onPressed: cancel,
                  )),
              title: (_) => Text(
                  'You have succesfully stopped watching this investment',
                  style: TextStyle(fontSize: 16)),
              enableSlideOff: true,
              backButtonBehavior: BackButtonBehavior.none,
              crossPage: true,
              contentPadding: EdgeInsets.all(2),
              onlyOne: true,
              animationDuration: Duration(milliseconds: 200),
              animationReverseDuration: Duration(milliseconds: 200),
              duration: Duration(seconds: 5),
            );
            _watchInvestmentBloc.add(IsWatchingInvestmentEvent(
                currentUser: user, investment: widget.investment));
          }
          if (state is UnWatchInvestmentFailureState) {
            BotToast.closeAllLoading();
            BotToast.showCustomLoading(
                clickClose: true,
                allowClick: true,
                backButtonBehavior: BackButtonBehavior.none,
                ignoreContentClick: false,
                backgroundColor: Color(0x42000000),
                align: Alignment.center,
                toastBuilder: (cancelFunc) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(state.message),
                    ),
                  );
                });
          }
          if (state is IsNotWatchingInvestmentState) {
            setState(() {
              _isWatching = false;
            });
          }
          if (state is IsWatchingInvestmentState) {
            setState(() {
              _isWatching = true;
            });
          }
          return SizedBox.shrink();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              iconSize: 25,
              color: Colors.black45,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              user.id == widget.investment.investorId
                  ? IconButton(
                      icon: Icon(Icons.visibility),
                      iconSize: 20,
                      color: Colors.white,
                      onPressed: () {},
                    )
                  : BlocBuilder<WatchInvestmentBloc, WatchInvestmentState>(
                      bloc: _watchInvestmentBloc,
                      builder: (context, state) {
                        if (state is IsWatchingInvestmentState) {
                          return IconButton(
                            icon: Icon(Icons.visibility),
                            iconSize: 20,
                            color: _isWatching
                                ? Theme.of(context).primaryColor
                                : Colors.black45,
                            onPressed: () {
                              _watchInvestmentBloc.add(OnUnWatchInvestmentEvent(
                                  currentUser: user,
                                  investment: widget.investment));
                            },
                          );
                        }
                        if (state is IsNotWatchingInvestmentState) {
                          return IconButton(
                            icon: Icon(Icons.visibility),
                            iconSize: 20,
                            color: _isWatching
                                ? Theme.of(context).primaryColor
                                : Colors.black45,
                            onPressed: () {
                              _watchInvestmentBloc.add(OnWatchInvestmentEvent(
                                  currentUser: user,
                                  investment: widget.investment));
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                    )
            ],
            title: Center(
              child: Text(
                'Investment',
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        widget.investment.description,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: widget.investor.profileImageUrl.isEmpty
                          ? AssetImage('assets/images/placeholder.png')
                          : CachedNetworkImageProvider(
                              widget.investor.profileImageUrl),
                      backgroundColor: Colors.grey[300],
                      radius: 26,
                    )
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'In Progress',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: DecorationImage(
                            image: AssetImage(widget.broker.imgUrl)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 70),
                Row(
                  children: <Widget>[
                    Text(
                      'Amount:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '₦${widget.investment.amount}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Date of Investment:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 20),
                    Text(
                      widget.investment.investmentDate,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Duration of Investment:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '${widget.investment.duration} months',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      'Percentage ROI:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '${widget.investment.percentageROI}%',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Text(
                      'Proof of investment',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => Routes.sailor.navigate('/view_image_screen',
                      transitions: [
                        SailorTransition.slide_from_right
                      ],
                      params: {
                        'imageUrl': widget.investment.proofOfInvestmentURL
                      }),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.investment.proofOfInvestmentURL)),
                        ),
                      ),
                      Container(
                        height: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.touch_app,
                              color: Colors.white,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Tap to Expand',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
