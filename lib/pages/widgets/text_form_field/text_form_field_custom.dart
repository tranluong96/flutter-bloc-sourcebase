import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/resources/res.dart';

class TextFormFieldCustom extends TextFormField {
  TextFormFieldCustom({
    String? initValue,
    super.controller,
    super.readOnly,
    super.style,
    void Function(String)? onChange,
    String? hintText,
    TextInputType? keyboardType,
    bool? isObscureText,
    Widget? iconSuffixIcon,
    Function? onActionSuffixIcon,
    FocusNode? focusNode,
    String? errorText,
    key,
  }) : super(
          key: key,
          keyboardType: keyboardType ?? TextInputType.text,
          focusNode: focusNode,
          initialValue: initValue,
          cursorColor: ResColors().primary,
          obscureText: isObscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                width: 1,
                color: ResColors().stroke,
              ),
            ),
            suffixIcon: iconSuffixIcon != null ? InkWell(
              onTap: () {
                if(onActionSuffixIcon != null){
                  onActionSuffixIcon();
                }
              },
              child: SizedBox(
                child: iconSuffixIcon,
              ),
            ) : null,
          ),
          onChanged: onChange,
          inputFormatters: [
            LengthLimitingTextInputFormatter(256),
          ],
        );
}
