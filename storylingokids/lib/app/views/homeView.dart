import 'package:flutter/material.dart';
import 'package:storylingokids/app/views/animalsView.dart';
import 'package:storylingokids/app/views/birdsView.dart';
import '../widgets/categoryCard.dart';
import 'alphabetsView.dart';
import 'colorsView.dart';
import 'numbersView.dart';
import 'shapesView.dart';
import 'storiesView.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      CategoryCard(
        title: 'Animals',
        primaryColor: Colors.pinkAccent[100]!,
        secondaryColor: Colors.pink,
        screen: AnimalsView(
          title: 'Animals',
          primaryColor: Colors.pinkAccent[100]!,
          secondaryColor: Colors.pink,
        ),
      ),
      CategoryCard(
        title: 'Birds',
        primaryColor: Colors.purpleAccent[100]!,
        secondaryColor: Colors.purple,
        screen: BirdsView(
          title: 'Birds',
          primaryColor: Colors.purpleAccent[100]!,
          secondaryColor: Colors.purple,
        ),
      ),
      CategoryCard(
        title: 'Colors',
        primaryColor: Colors.orangeAccent[100]!,
        secondaryColor: Colors.orange,
        screen: ColorsView(
          title: 'Colors',
          primaryColor: Colors.orangeAccent[100]!,
          secondaryColor: Colors.orange,
        ),
      ),
      CategoryCard(
        title: '123',
        primaryColor: Colors.greenAccent[100]!,
        secondaryColor: Colors.green,
        screen: NumbersView(
          title: '123',
          primaryColor: Colors.greenAccent[100]!,
          secondaryColor: Colors.green,
        ),
      ),
      CategoryCard(
        title: 'ABC',
        primaryColor: Colors.cyanAccent[100]!,
        secondaryColor: Colors.cyan,
        screen: AlphabetsView(
          title: 'ABC',
          primaryColor: Colors.cyanAccent[100]!,
          secondaryColor: Colors.cyan,
        ),
      ),
      CategoryCard(
        title: 'Stories',
        primaryColor: Colors.blueAccent[100]!,
        secondaryColor: Colors.blue,
        screen: StoriesView(
          title: 'Stories',
          primaryColor: Colors.blueAccent[100]!,
          secondaryColor: Colors.blue,
        ),
      ),
      CategoryCard(
        title: 'Shapes',
        primaryColor: Colors.redAccent[100]!,
        secondaryColor: Colors.red,
        screen: ShapesView(
          title: 'Shapes',
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
