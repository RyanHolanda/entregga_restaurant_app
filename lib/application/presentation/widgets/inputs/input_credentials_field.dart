import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.hintText,
    required this.isPassword,
    required this.controller,
    required this.onSubmited,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final bool isPassword;
  final onSubmited;

  final TextEditingController controller;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool invisiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextField(
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          onSubmitted: widget.onSubmited,
          controller: widget.controller,
          obscureText: widget.isPassword ? invisiblePassword : false,
          decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          invisiblePassword = !invisiblePassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye))
                  : null,
              hintText: widget.hintText,
              border: const UnderlineInputBorder(borderSide: BorderSide())),
        ));
  }
}
