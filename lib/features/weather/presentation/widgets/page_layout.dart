import 'package:flutter/material.dart';

class PageLayout extends StatefulWidget {
  final List<Widget> children;
  const PageLayout({super.key, required this.children});

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: widget.children,
    );
  }
}