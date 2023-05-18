// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget({
    super.key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    // final direction = widget.controller.position.userScrollDirection;

    // if (direction == ScrollDirection.forward) {
    //   show();
    // } else if (direction == ScrollDirection.reverse) {
    //   hide();
    // }

    if (widget.controller.position.pixels >= 200) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isVisible ? kBottomNavigationBarHeight + 6 : 0,
      duration: widget.duration,
      child: Wrap(children: [widget.child]),
    );
  }
}
