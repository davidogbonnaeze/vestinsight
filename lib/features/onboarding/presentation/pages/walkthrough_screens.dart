import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sailor/sailor.dart';
import 'package:vestinsight/routes.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> widgetList = [];
    for (int i = 0; i < _numPages; i++) {
      widgetList.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return widgetList;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24 : 16,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Color(0xFFEDF1F9),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDF1F9),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _currentPage != _numPages - 1
                          ? FlatButton(
                              onPressed: () => Routes.sailor.navigate(
                                  '/login_screen',
                                  navigationType: NavigationType.pushReplace),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17,
                                ),
                              ))
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/onboarding_1.png'),
                          )),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  SizedBox(height: 60),
                                  Text(
                                    'Welcome to',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vestinsight',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Lorem ipsum dolot met sit i am a champ'),
                                  SizedBox(height: 60),
                                  OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    textColor: Theme.of(context).primaryColor,
                                    shape: StadiumBorder(),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Text('Next'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/onboarding_2.png'),
                          )),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  SizedBox(height: 60),
                                  Text(
                                    'Welcome to',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vestinsight',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Lorem ipsum dolot met sit i am a champ'),
                                  SizedBox(height: 60),
                                  OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    textColor: Theme.of(context).primaryColor,
                                    shape: StadiumBorder(),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Text('Next'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/onboarding_3.png'),
                          )),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  SizedBox(height: 60),
                                  Text(
                                    'Welcome to',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vestinsight',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Lorem ipsum dolot met sit i am a champ'),
                                  SizedBox(height: 60),
                                  OutlineButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    textColor: Theme.of(context).primaryColor,
                                    shape: StadiumBorder(),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor),
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Text('Next'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/onboarding_4.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  SizedBox(height: 60),
                                  Text(
                                    'Welcome to',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Vestinsight',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Lorem ipsum dolot met sit i am a champ'),
                                  SizedBox(height: 60),
                                  FlatButton(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    textColor: Colors.white,
                                    shape: StadiumBorder(),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      Routes.sailor.navigate('/login_screen',
                                          navigationType:
                                              NavigationType.pushReplace);
                                    },
                                    child: Text('Get Started'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
        ),
      ),
    );
  }
}
