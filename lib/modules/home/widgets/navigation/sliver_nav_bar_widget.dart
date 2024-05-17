import 'package:flutter/material.dart';

class SliverNavBarWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  SliverNavBarWidget({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / expandedHeight;
    const double topPadding = 8.0;
    const double minHeight = kToolbarHeight + topPadding;
    final double maxHeight = expandedHeight;

    final double currentHeight = maxHeight - shrinkOffset;

    return SliverAppBar(
      title: const Text('My App Bar'),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
     // collapsedHeight: expandedHeight,
      expandedHeight: minHeight,
      toolbarHeight: currentHeight,
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}