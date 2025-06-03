import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.onPress,
    required this.title,
    this.isLoading = false,
  });

  final Function onPress;
  final String title;
  final bool isLoading;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ResColors().primary,
              foregroundColor: ResColors().white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => widget.onPress(),
            child: widget.isLoading
                ? Center(
                    child: CupertinoActivityIndicator(
                      color: ResColors().white,
                      radius: 10.0,
                    ),
                  )
                : Center(
                    child: Text(
                      widget.title,
                      style: ResTextStyles().medium16.copyWith(
                            color: ResColors().white,
                          ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
