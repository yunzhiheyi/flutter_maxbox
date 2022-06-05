// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, unused_local_variable, unnecessary_new, unused_field, prefer_final_fields, must_be_immutable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, library_private_types_in_public_api, no_logic_in_create_state, unnecessary_this, unnecessary_brace_in_string_interps, unused_element, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

class ScrollLoopAutoScroll extends StatefulWidget {
  ScrollLoopAutoScroll({
    required this.child,
    required this.scrollDirection,
    Key? key,
    this.delay = const Duration(seconds: 1),
    this.play = false,
    this.reset = false,
    this.onEnd,
    this.onResetEnd,
    this.duration = const Duration(seconds: 10),
    this.reverseScroll = false,
    this.enableScrollInput = true,
    this.delayAfterScrollInput = const Duration(seconds: 1),
  }) : super(key: key);

  /// Widget to display in loop
  final ValueChanged<bool>? onEnd;

  final ValueChanged<bool>? onResetEnd;
  final Widget child;

  final Duration delay;

  final Duration duration;

  final Axis scrollDirection;

  final bool reverseScroll;

  final bool play;

  final bool reset;

  ///User scroll input
  ///
  ///Default set to true
  final bool enableScrollInput;

  final Duration delayAfterScrollInput;
  @override
  State<StatefulWidget> createState() => _ScrollLoopAutoScrollState();
  static _ScrollLoopAutoScrollState of(BuildContext context,
      {bool nullOk = false}) {
    final _ScrollLoopAutoScrollState? result =
        context.findAncestorStateOfType<_ScrollLoopAutoScrollState>();

    if (result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
          'ScrollLoopAutoScroll.of() called with a context that does not contain a ScrollLoopAutoScroll.'),
    ]);
  }
}

class _ScrollLoopAutoScrollState extends State<ScrollLoopAutoScroll>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<Offset> offset;
  int beginOffset = 0;
  late Timer timePlay;
  ValueNotifier<bool> shouldScroll = ValueNotifier<bool>(false);
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (widget.enableScrollInput) {
        if (animationController.isAnimating) {
          animationController.stop();
          print('1----2');
        } else {
          await Future.delayed(widget.delayAfterScrollInput);
          if (widget.play) {
            animationHandler();
          }
          print('1----3');
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(widget.delay);
      print('1----4');
    });
    animationOffset();
    super.initState();
  }

  void animationOffset() {
    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    offset = Tween<Offset>(
      begin: const Offset(0, 0),
      end: widget.reverseScroll ? const Offset(0, .8) : const Offset(0, -.8),
    ).animate(animationController);
  }

  void animationHandler() async {
    if (scrollController.position.maxScrollExtent > 0) {
      shouldScroll.value = true;
      if (shouldScroll.value && mounted) {
        scrollController.jumpTo(0);
        animationController.forward().then((_) async {
          animationController.reset();
          animationController.stop();
          print('1----6');
          widget.onEnd?.call(true);
        });
      }
    }
  }

  @override
  void didUpdateWidget(ScrollLoopAutoScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.play != oldWidget.play) {
      if (widget.play) {
        animationHandler();
        print('1----8');
      } else {
        print('1----9');
        animationController.stop();
      }
    }
    if (widget.reset != oldWidget.reset) {
      if (widget.reset) {
        print('1----10');
        animationController.reset();
        animationController.stop();
        // 需要延时处理
        timePlay = Timer(Duration(milliseconds: 100), () {
          widget.onEnd?.call(true);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: widget.enableScrollInput
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      controller: scrollController,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverseScroll,
      child: SlideTransition(
        position: offset,
        child: ValueListenableBuilder<bool>(
          valueListenable: shouldScroll,
          builder: (BuildContext context, bool shouldScroll, _) {
            return widget.child;
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    timePlay.cancel();
  }
}
