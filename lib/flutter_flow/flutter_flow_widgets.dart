import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FFButtonOptions {
  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
  });

  final TextStyle textStyle;
  final double elevation;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color splashColor;
  final double iconSize;
  final Color iconColor;
  final EdgeInsetsGeometry iconPadding;
  final double borderRadius;
  final BorderSide borderSide;
}

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.icon,
    this.iconData,
    @required this.options,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final IconData iconData;
  final VoidCallback onPressed;
  final FFButtonOptions options;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = AutoSizeText(
      text,
      style: options.textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (icon != null || iconData != null) {
      textWidget = Flexible(child: textWidget);
      return Container(
        height: options.height,
        width: options.width,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: options.iconPadding ?? EdgeInsets.zero,
            child: icon ??
                FaIcon(
                  iconData,
                  size: options.iconSize,
                  color: options.iconColor ?? options.textStyle.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(options.borderRadius),
              side: options.borderSide ?? BorderSide.none,
            ),
            backgroundColor: options.color,
          ),
        ),
      );
    }

    return Container(
      height: options.height,
      width: options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(options.borderRadius ?? 28),
            side: options.borderSide ?? BorderSide.none,
          ),
          backgroundColor: options.color,
          padding: options.padding,
          elevation: options.elevation,
        ),
        child: textWidget,
      ),
    );
  }
}
