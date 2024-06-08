/*
 * Project Name:  StoryLingoKids
 * File Name:     alphabets_test_view.dart
 * File Function: 字母表测试页面
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        BouncingScrollPhysics,
        BuildContext,
        Color,
        Colors,
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
import 'package:storylingokids/app/lists/alphabets_list.dart'
    show alphabetsList;
import 'package:storylingokids/app/widgets/test_view_header.dart'
    show TestViewHeader;
import 'package:storylingokids/app/widgets/test_text_card.dart'
    show TestTextCard;

class AlphabetsTestView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const AlphabetsTestView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<AlphabetsTestView> createState() => _AlphabetsTestViewState();
}

class _AlphabetsTestViewState extends State<AlphabetsTestView> {
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
              childCount: alphabetsList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TestTextCard(
                    title: alphabetsList[index].text,
                    textColor: getIndexColor(index),
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

Color getIndexColor(int index, {double opacity = 0.8}) {
  return Colors.primaries[index % Colors.primaries.length].withOpacity(opacity);
}
