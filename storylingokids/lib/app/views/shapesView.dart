import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/viewHeader.dart';

class ShapesView extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const ShapesView({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<ShapesView> createState() => _ShapesViewState();
}

class _ShapesViewState extends State<ShapesView> {
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
                    child: Text(
                      'Coming soon...',
                      style: kSubTextStyle.copyWith(fontSize: 24),
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
