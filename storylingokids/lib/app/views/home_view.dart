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
import 'package:storylingokids/app/widgets/category_card.dart' show CategoryCard;
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
