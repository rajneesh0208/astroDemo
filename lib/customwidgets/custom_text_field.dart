import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hint;
  final String? validText;
  final double? width;
  const CustomTextField({Key? key,this.width, this.validText, this.controller, this.inputType, this.hint}) : super(key: key);

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
      height: 50,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey,width: 1),
      ),
      alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsets.symmetric(vertical: h * 0.01),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextFormField(
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              )
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return '${widget.validText}';
            }
            return null;
          },
          keyboardType:widget.inputType,
        ),
      ),
    );
  }
}
