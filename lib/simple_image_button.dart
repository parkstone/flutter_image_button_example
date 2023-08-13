import 'package:flutter/material.dart';

class SimpleImageButton extends StatefulWidget {

  final Image upImage;
  final Image downImage;
  final Function onPressed;
  final String? buttonText;
  final Color? buttonTextColor;
  final ImageButtonFlex? imageButtonFlex;

  const SimpleImageButton({
    Key? key,
    required this.upImage,
    required this.downImage,
    required this.onPressed,
    this.buttonText,
    this.buttonTextColor,
    this.imageButtonFlex
  }) : super(key: key);

  @override
  State<SimpleImageButton> createState() => _SimpleImageButtonState();
}

class _SimpleImageButtonState extends State<SimpleImageButton> {

  late double _opacity;

  @override
  void initState() {
    super.initState();
    setState(() => _opacity = .0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(widget.upImage.image, context);
    precacheImage(widget.downImage.image, context);
  }

  @override
  Widget build(BuildContext context) {

    const duration = Duration(milliseconds: 150);
    final size = MediaQuery.of(context).size;
    final double height =size.height;
    final double width = size.width;

    final topFlex = widget.imageButtonFlex?.topFlex ?? 2;
    final textFlex = widget.imageButtonFlex?.textFlex ?? 3;
    final bottomFlex = widget.imageButtonFlex?.bottomFlex ?? 3;

    return GestureDetector(
        onTapDown: (details) => setState(() => _opacity = 1.0),
        onTapCancel: () => setState(() => _opacity = .0),
        onTapUp: (details) {
          Future.delayed(
            Duration(milliseconds: (duration.inMilliseconds / 2).round(),),
            () {
              setState(() => _opacity = .0);
              widget.onPressed();
            },
          );
        },
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: width,
              height: height,
              child: widget.upImage,
            ),
            SizedBox(
              width: width,
              height: height,
              child: AnimatedOpacity(
                duration: duration,
                opacity: _opacity,
                child: widget.downImage,
              ),
            ),
            Visibility(
              visible: widget.buttonText != null && widget.buttonText!.isNotEmpty,
              child: SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: topFlex, child: Container()),
                    Flexible(
                        flex: textFlex,
                        child: GestureDetector(
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              widget.buttonText ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: widget.buttonTextColor ?? Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2000),
                            ),
                          ),
                        )
                    ),
                    Flexible(flex: bottomFlex, child: Container())
                  ]
                ),
              ),
            )
          ],
        )
    );
  }
}

class ImageButtonFlex {
  /// button top flex
  final int topFlex;
  /// text area flex
  final int textFlex;
  // button bottom flex
  final int bottomFlex;

  ImageButtonFlex(this.topFlex, this.textFlex, this.bottomFlex);
}
