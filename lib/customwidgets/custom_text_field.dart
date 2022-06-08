import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hint;
  final String? validText;
  final double? width;
  final int? textLen;
  final onChangedFunc;
  const CustomTextField({Key? key,this.textLen, this.width, this.validText, this.controller, this.inputType, this.hint, required this.onChangedFunc}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  dynamic h,w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      // height: 50,
      width: widget.width,
      padding: EdgeInsets.symmetric(vertical: h * 0.01),
      child: TextFormField(
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            )
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.textLen),
        ],
        onChanged: widget.onChangedFunc,
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.validText}';
          }
          return null;
        },
        keyboardType:widget.inputType,
      ),
    );
  }
}
