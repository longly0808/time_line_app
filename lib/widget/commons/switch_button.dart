

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../style/style.dart';


class SwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final bool isEditable;
  final bool isRequired;
  final String? title;
  final bool isShowStatus;

  const SwitchButton({
    Key? key,
    this.value = false,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.activeText = Constants.emptyString,
    this.inactiveText = Constants.emptyString,
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    this.isEditable = true,
    this.isRequired = false,
    this.title,
    this.isShowStatus = true,
  }) : super(key: key);

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  late bool _isSwitch;

  Color? _activeColor;
  Color? _inactiveColor;

  @override
  void initState() {
    super.initState();

    _isSwitch = widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));

    if (widget.activeColor != null) {
      _activeColor = widget.activeColor!;
    }

    if (widget.inactiveColor != null) {
      _inactiveColor = widget.inactiveColor!;
    }
  }

  @override
  void didUpdateWidget(covariant SwitchButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.value != _isSwitch) {
      _isSwitch = widget.value;
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _activeColor ??= MyColors.toggleActiveColor;
    _inactiveColor ??= theme.colorScheme.onBackground.withOpacity(0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createLabel(),
        Row(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    if (widget.isEditable) {
                      if (_animationController.isCompleted) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }
                      setState(() {
                        _isSwitch = !_isSwitch;
                      });
                      widget.onChanged!(_isSwitch);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimens.size4,
                      vertical: Dimens.size8,
                    ),
                    width: Dimens.size56,
                    height: Dimens.size32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.size52),
                      color: _circleAnimation.value == Alignment.centerLeft
                          ? _inactiveColor
                          : _activeColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.size6),
                      child: Align(
                        alignment: _circleAnimation.value,
                        child: Container(
                          width: Dimens.size24,
                          height: Dimens.size24,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: Dimens.size16),
            Visibility(
              child: Text(
                widget.activeText,
                style: Theme.of(context).primaryTextTheme.subtitle2,
              ),
              visible: widget.isShowStatus && _isSwitch,
            ),
            Visibility(
              child: Text(
                widget.inactiveText,
                style: Theme.of(context).primaryTextTheme.subtitle2,
              ),
              visible: widget.isShowStatus && !_isSwitch,
            )
          ],
        )
      ],
    );
  }

  Widget createLabel() {
    return widget.title != null
        ? Padding(
      padding: const EdgeInsets.only(
        bottom: Dimens.size12,
      ),
      child: RichText(
        text: TextSpan(
          text: widget.isRequired ? Constants.redAsterisk : '',
          style: Theme.of(context).primaryTextTheme.subtitle1,
          children: [
            TextSpan(
              text: widget.title,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    )
        : const SizedBox();
  }
}
