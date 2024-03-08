import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/pages/onboard/intro_screens/intro_page_1.dart';
import 'package:mandy_notes/pages/onboard/intro_screens/intro_page_2.dart';
import 'package:mandy_notes/pages/onboard/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Controller para trackear en que pantalla estamos
  PageController _controller = PageController();

  //Para controlar si estamos en la última página
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //SKIP
              GestureDetector(
                child: Text('skip'),
                onTap: () => {
                  _controller.jumpToPage(2),
                },
              ),

              //DOT INDICATOR
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(dotColor: Colors.pink.shade900, activeDotColor: Colors.pink.shade500),
              ),

              //NEXT or done
              onLastPage
                  ? GestureDetector(
                      child: Text('done'),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyLoginPage()),
                        ).whenComplete(() => _controller.jumpToPage(0)),
                      },
                    )
                  : GestureDetector(
                      child: Text('next'),
                      onTap: () => {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                      },
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
