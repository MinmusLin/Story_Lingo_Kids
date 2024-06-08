/*
 * Project Name:  StoryLingoKids
 * File Name:     home_view.dart
 * File Function: 主页页面
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        Alignment,
        BouncingScrollPhysics,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Colors,
        Container,
        CustomScrollView,
        Image,
        MediaQuery,
        Scaffold,
        SliverChildListDelegate,
        SliverList,
        SliverToBoxAdapter,
        StatelessWidget,
        Widget;
import 'package:storylingokids/app/views/animals_view.dart' show AnimalsView;
import 'package:storylingokids/app/views/birds_view.dart' show BirdsView;
import 'package:storylingokids/app/widgets/menu_card.dart' show MenuCard;
import 'package:storylingokids/app/views/alphabets_view.dart'
    show AlphabetsView;
import 'package:storylingokids/app/views/colors_view.dart' show ColorsView;
import 'package:storylingokids/app/views/numbers_view.dart' show NumbersView;
import 'package:storylingokids/app/views/shapes_view.dart' show ShapesView;
import 'package:storylingokids/app/views/stories_view.dart' show StoriesView;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      MenuCard(
        title: 'ABC',
        primaryColor: Colors.pinkAccent[100]!,
        secondaryColor: Colors.pink,
        screen: AlphabetsView(
          title: 'ABC',
          primaryColor: Colors.pinkAccent[100]!,
          secondaryColor: Colors.pink,
        ),
      ),
      MenuCard(
        title: '123',
        primaryColor: Colors.purpleAccent[100]!,
        secondaryColor: Colors.purple,
        screen: NumbersView(
          title: '123',
          primaryColor: Colors.purpleAccent[100]!,
          secondaryColor: Colors.purple,
        ),
      ),
      MenuCard(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.orange,
        screen: ColorsView(
          title: 'Colors',
          primaryColor: Colors.orangeAccent[100]!,
          secondaryColor: Colors.orange,
        ),
      ),
      MenuCard(
        title: 'Shapes',
        primaryColor: Colors.greenAccent[100]!,
        secondaryColor: Colors.green,
        screen: ShapesView(
          title: 'Shapes',
          primaryColor: Colors.greenAccent[100]!,
          secondaryColor: Colors.green,
        ),
      ),
      MenuCard(
        title: 'Animals',
        primaryColor: Colors.cyanAccent[100]!,
        secondaryColor: Colors.cyan,
        screen: AnimalsView(
          title: 'Animals',
          primaryColor: Colors.cyanAccent[100]!,
          secondaryColor: Colors.cyan,
        ),
      ),
      MenuCard(
        title: 'Birds',
        primaryColor: Colors.blueAccent[100]!,
        secondaryColor: Colors.blue,
        screen: BirdsView(
          title: 'Birds',
          primaryColor: Colors.blueAccent[100]!,
          secondaryColor: Colors.blue,
        ),
      ),
      MenuCard(
        title: 'Stories',
        primaryColor: Colors.redAccent[100]!,
        secondaryColor: Colors.red,
        screen: StoriesView(
          title: 'Stories',
          primaryColor: Colors.redAccent[100]!,
          secondaryColor: Colors.red,
        ),
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/background/Title.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(categories),
            ),
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/background/Bottom.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
