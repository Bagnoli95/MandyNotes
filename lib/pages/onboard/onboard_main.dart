import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/utils/my_button_small.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: "Bienvenido",
      description: "Esta es una aplicación de ejemplo.",
      imageUrl: "http://localhost:8000/static/images/imagen1.jpg",
    ),
    OnboardingItem(
      title: "Característica 1",
      description: "Descubre la característica 1asdasdasd.",
      imageUrl: "http://localhost:8000/static/images/imagen2.jpg",
    ),
    OnboardingItem(
      title: "Característica 2",
      description: "Explora la característica 2asdasdqrqwrqwrqwrqw.",
      imageUrl: "http://localhost:8000/static/images/imagen3.jpg",
    ),
  ];

  int _currentIndex = 0;
  bool _boolLogin = false;

  void _nextPage() {
    setState(() {
      if (_currentIndex == 2) {
        print('IR A LOGIN');
        _currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        _currentIndex = _currentIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardingItemWidget(_onboardingItems[_currentIndex]),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [myButtonSmall(texto: 'Siguiente', accion: _nextPage), Container(width: 20)],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingItem({required this.title, required this.description, required this.imageUrl});
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;

  OnboardingItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.network(item.imageUrl, fit: BoxFit.cover),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(item.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 24.0, fontWeight: FontWeight.bold))],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.description, textAlign: TextAlign.center, style: TextStyle(color: Colors.amber, fontSize: 16.0)),
              ],
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ],
    );
  }
}
