// ignore_for_file: prefer_const_constructors,, 

import 'package:flutter/material.dart';
import 'package:proje2/app/screens/hayvanlar_screen.dart';
import '../widgets/category_card.dart';
import 'alfabe_screen.dart';
import 'renkler_screen.dart';
import 'sayılar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryCard(
        title: 'Animals',
        primaryColor: const Color.fromARGB(255, 73, 41, 234),
        secondaryColor: Colors.purple,
        screen: const HayvanlarScreen(
          title: 'Animals',
          primaryColor: Color.fromARGB(255, 16, 206, 124),
          secondaryColor: Colors.purple,
        ),
      ),
    
      CategoryCard(
        title: 'Colors',
        primaryColor: Color.fromARGB(255, 185, 14, 68),
        secondaryColor: Colors.orange,
        screen: RenklerScreen(
          title: 'Colors',
          primaryColor: Colors.orangeAccent[100]!,
          secondaryColor: Colors.orange,
        ),
      ),
      CategoryCard(
        title: '123',
        primaryColor: Color.fromARGB(255, 219, 15, 165),
        secondaryColor: Colors.green,
        screen: SayilarScreen(
          title: '123',
          primaryColor: Colors.greenAccent[100]!,
          secondaryColor: Colors.green,
        ),
      ),
      CategoryCard(
        title: 'ABC',
        primaryColor: Color.fromARGB(255, 23, 185, 188),
        secondaryColor: Colors.purple,
        screen: AlfabeScreen(
          title: 'ABC',
          primaryColor: Colors.purpleAccent[100]!,
          secondaryColor: Colors.purple,
        ),
      ),
                ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          image: const DecorationImage(
            image: AssetImage('assets/images/bg-bottom.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 188.0,
              backgroundColor: Colors.grey[50],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/bg-top.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(categories),
            ),
          ],
        ),
      ),
    );
  }
}
