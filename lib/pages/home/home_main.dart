import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandy_notes/class/colores.dart';
import 'package:mandy_notes/pages/account/user_page.dart';
import 'package:mandy_notes/pages/calendar/calendar_main.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 3;
  Image _expandedImage = Image.asset(
    'assets/imagenes/header.jpg',
    fit: BoxFit.fill,
  );

  List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.orange),
    Container(color: Colors.yellow),
    HeatMapCalendarExample(),
    MyAccountUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("MandyNotes"),
        backgroundColor: myColores().rose_300,
      ),
      bottomNavigationBar: myButtonNavigatorBar(),
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          color: Colors.amber,
          // margin: EdgeInsets.only(top: 10),
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }

  // SliverAppBar mySliverAppBar() {
  //   return SliverAppBar(
  //     pinned: true,
  //     backgroundColor: Colors.deepPurple,
  //     expandedHeight: 200.0,
  //     stretch: true,
  //     flexibleSpace: FlexibleSpaceBar(
  //       title: Text('MandyNotes'),
  //       centerTitle: true,
  //       background: _expandedImage,
  //       // background: Container(
  //       //   color: Colors.pink,
  //       // ),
  //       stretchModes: [
  //         StretchMode.zoomBackground,
  //         StretchMode.blurBackground,
  //         StretchMode.fadeTitle,
  //       ],
  //     ),
  //   );
  // }

  BottomNavigationBar myButtonNavigatorBar() {
    return BottomNavigationBar(
      elevation: 10,
      backgroundColor: myColores().rose_300,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        //Primer Item
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectedIndex == 0 ? 'assets/vectors/heart_bold.svg' : 'assets/vectors/heart_outline.svg'),
          label: "",
        ),

        //Segundo Item
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectedIndex == 1 ? 'assets/vectors/edit_bold.svg' : 'assets/vectors/edit_outline.svg'),
          label: "",
        ),

        //Tercer Item
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectedIndex == 2 ? 'assets/vectors/heart_bold.svg' : 'assets/vectors/home_outline.svg'),
          label: "",
        ),

        //Cuarto Item
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectedIndex == 3 ? 'assets/vectors/calendar-lines_bold.svg' : 'assets/vectors/calendar-lines_outline.svg'),
          label: "",
        ),

        //Quinto Item
        BottomNavigationBarItem(
          icon: SvgPicture.asset(_selectedIndex == 4 ? 'assets/vectors/heart_bold.svg' : 'assets/vectors/user_outline.svg'),
          label: "",
        ),
      ],
    );
  }
}
