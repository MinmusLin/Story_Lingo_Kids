/*
 * Project Name:  StoryLingoKids
 * File Name:     stories_view.dart
 * File Function: 故事页面
 * Author:        林继申
 * Update Date:   2024-06-09
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        Alignment,
        BouncingScrollPhysics,
        BuildContext,
        Color,
        Container,
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
        Text,
        Widget;
import 'package:flutter/painting.dart'
    show Alignment, Color, EdgeInsets, TextStyle;
import 'package:storylingokids/app/widgets/view_header.dart' show ViewHeader;

class StoriesView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const StoriesView({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
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
            child: ViewHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
              showMicrophoneIcon: false,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Coming soon...',
                      style: TextStyle(
                        color: Color(0xFF959595),
                        fontSize: 24,
                      ),
                    ),
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
