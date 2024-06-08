/*
 * Project Name:  StoryLingoKids
 * File Name:     animals_test_view.dart
 * File Function: 动物测试页面
 * Author:        林继申
 * Update Date:   2024-06-09
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        BouncingScrollPhysics,
        BuildContext,
        Color,
        CustomScrollView,
        EdgeInsets,
        Padding,
        Scaffold,
        ScrollController,
        SliverChildBuilderDelegate,
        SliverGrid,
        SliverGridDelegateWithFixedCrossAxisCount,
        SliverToBoxAdapter,
        State,
        StatefulWidget,
        Widget;
import 'package:storylingokids/app/lists/animals_list.dart' show animalsList;
import 'package:storylingokids/app/widgets/test_image_card.dart'
    show TestImageCard;
import 'package:storylingokids/app/widgets/test_view_header.dart'
    show TestViewHeader;

class AnimalsTestView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const AnimalsTestView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<AnimalsTestView> createState() => _AnimalsTestViewState();
}

class _AnimalsTestViewState extends State<AnimalsTestView> {
  final _scrollController = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TestViewHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: animalsList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TestImageCard(
                    title: animalsList[index].name!,
                    image: animalsList[index].image!,
                    onPressed: () {
                      print("start");
                    },
                    onReleased: () {
                      print("end");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
