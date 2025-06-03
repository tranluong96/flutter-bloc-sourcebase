import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res.dart';

class OutlineButton extends StatefulWidget {
  const OutlineButton({
    super.key,
    required this.onPress,
    required this.title,
    this.isLoading = false,
  });

  final Function onPress;
  final String title;
  final bool isLoading;

  @override
  State<OutlineButton> createState() =>
      _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => widget.onPress(),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: ResColors().primary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ResColors().primary,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: widget.isLoading
          ? Center(
              child: CupertinoActivityIndicator(
                color: ResColors().primary,
                radius: 10.0,
              ),
            )
          : Center(
              child: Text(
                widget.title,
                style: ResTextStyles().medium16.copyWith(
                      color: ResColors().primary,
                    ),
              ),
            ),
    );
  }
}
