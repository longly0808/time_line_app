import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.colors,
    this.borderRadius,
    this.textColors,
    required this.onclick,
    this.text,
    this.colorBorder,
  }) : super(key: key);
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? colors;
  final VoidCallback onclick;
  final String? text;
  final Color? textColors;
  final Color? colorBorder;

  @override
  State<StatefulWidget> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool? isHover;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return MouseRegion(
      child: GestureDetector(
        onTap: widget.onclick,
        child: Container(
          width: widget.width ?? media.size.width,
          height: widget.height ?? Dimens.size40,
          decoration: BoxDecoration(
            color: (isHover == false
                ? (widget.colors ?? theme.colorScheme.primary)
                : (widget.colors ?? theme.colorScheme.primary)
                    .withOpacity(0.9)),
            border: Border.all(color:widget.colorBorder?? Colors.transparent, width: Dimens.size2 ),
            borderRadius:
                BorderRadius.circular(widget.borderRadius ?? Dimens.size5),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text ?? tr('button'),
            style:theme.textTheme.button!.copyWith(color:widget.textColors ?? theme.colorScheme.onSurface),
          ),
        ),
      ),
      onEnter: (event) => isHoverFunction(true),
      onExit: (event) => isHoverFunction(false),
    );
  }

  void isHoverFunction(bool status) => setState(() {
        // if ((widget.noHover ?? false) == true) {
        //   isHover = false;
        //   return;
        // }
        isHover = status;
      });
}

class CustomButtonRichText extends StatefulWidget {
  const CustomButtonRichText({
    Key? key,
    this.height,
    this.width,
    this.colors,
    this.borderRadius,
    this.textColors,
    required this.onclick,
    this.text,
    this.colorBorder,
    this.richText,
  }) : super(key: key);
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? colors;
  final VoidCallback onclick;
  final String? text;
  final Color? textColors;
  final Color? colorBorder;
  final RichText? richText;

  @override
  State<StatefulWidget> createState() => _CustomButtonRichTextState();
}

class _CustomButtonRichTextState extends State<CustomButtonRichText> {
  bool? isHover;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context);
    return MouseRegion(
      child: GestureDetector(
        onTap: widget.onclick,
        child: Container(
          width: widget.width ?? media.size.width,
          height: widget.height ?? Dimens.size40,
          decoration: BoxDecoration(
            color: (isHover == false
                ? (widget.colors ?? theme.colorScheme.primary)
                : (widget.colors ?? theme.colorScheme.primary)
                .withOpacity(0.9)),
            border: Border.all(color:widget.colorBorder?? Colors.transparent, width: Dimens.size2 ),
            borderRadius:
            BorderRadius.circular(widget.borderRadius ?? Dimens.size5),
          ),
          alignment: Alignment.center,
          child: widget.richText?? Text(
            widget.text ?? tr('button'),
            style:theme.textTheme.button!.copyWith(color:widget.textColors ?? theme.colorScheme.onSurface),
          ),
        ),
      ),
      onEnter: (event) => isHoverFunction(true),
      onExit: (event) => isHoverFunction(false),
    );
  }

  void isHoverFunction(bool status) => setState(() {
    // if ((widget.noHover ?? false) == true) {
    //   isHover = false;
    //   return;
    // }
    isHover = status;
  });
}
