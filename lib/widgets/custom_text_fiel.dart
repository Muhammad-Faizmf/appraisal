import 'package:Appraisal/utils/colors.dart';
import 'package:Appraisal/utils/scale_size.dart';
import 'package:Appraisal/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? initialValue;
  final double? fieldWidth;
  final String? label;
  final TextEditingController? controller;
  final String? validateMessage;
  final bool? required;
  final bool? obscureText;
  final int? maxLength;
  final bool? readonly;
  final TextAlign? textAlign;
  final void Function(String)? onchanged;
  final double? width;
  final double? height;
  final Widget? sufficIconbtn;
  final List<TextInputFormatter>? inputFormater;

  /// New flag to enable auto-capitalization
  final bool? autoCapitalizeFirstLetter;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validateMessage,
    this.fieldWidth,
    this.initialValue,
    this.inputFormater,
    this.required,
    this.obscureText,
    this.onchanged,
    this.maxLength,
    this.readonly,
    this.width,
    this.height,
    this.sufficIconbtn,
    this.textAlign,
    this.autoCapitalizeFirstLetter = true, // default off
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  void _capitalizeFirstLetterListener() {
    final text = widget.controller?.text ?? '';
    if (text.isNotEmpty && text[0] != text[0].toUpperCase()) {
      widget.controller?.value = widget.controller!.value.copyWith(
        text: text[0].toUpperCase() + text.substring(1),
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.autoCapitalizeFirstLetter == true && widget.controller != null) {
      widget.controller!.addListener(_capitalizeFirstLetterListener);
    }
  }

  @override
  void dispose() {
    if (widget.autoCapitalizeFirstLetter == true && widget.controller != null) {
      widget.controller!.removeListener(_capitalizeFirstLetterListener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScaleSize.getHorizontalWidth(
        context: context,
        width: widget.fieldWidth ?? 340.0,
      ),
      height: 92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Container(
            width: ScaleSize.getHorizontalWidth(context: context, width: 352),
            height: 15,
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.label ?? "",
              style: AppStyle.txtlabel,
            ),
          ),

          // Input Field
          SizedBox(
            width: ScaleSize.getHorizontalWidth(
              context: context,
              width: widget.width ?? 340,
            ),
            height: widget.height ?? 65,
            child: TextFormField(
              initialValue:
                  widget.controller == null ? widget.initialValue : null,
              textAlign: widget.textAlign ?? TextAlign.start,
              readOnly: widget.readonly ?? false,
              obscureText: widget.obscureText ?? false,
              maxLength: widget.maxLength,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return widget.validateMessage;
                }
                return null;
              },
              // Note: This only affects soft keyboards
              textCapitalization: TextCapitalization.sentences,
              onChanged: widget.onchanged,
              controller: widget.controller,
              inputFormatters: widget.inputFormater,
              decoration: InputDecoration(
                suffixIcon: widget.sufficIconbtn,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 16,
                ),
                hintText: widget.hint,
                hintStyle: AppStyle.txtHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: ColorConstant.fieldBorderColor,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: ColorConstant.fieldBorderColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: ColorConstant.primaryLightBlue,
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
