import 'package:flutter/material.dart';


class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
     TextEditingController controller,
     FocusNode focusNode,
     TextInputType keyboardType,
     TextInputAction inputAction,
     String label,
     String hint,
     Function(String value) validator,
    this.isObscure = false,
    this.isCapitalized = false,
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final bool isObscure;
  final bool isCapitalized;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      textCapitalization:
          isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: Color(0xFFFFCA28),
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: TextStyle(color: Color(0xFFFFCA28)),
        hintText: _hint,
        hintStyle: TextStyle(
          color: Color(0xFFECEFF1).withOpacity(0.5),
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Color(0xFFFFA000),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:  Color(0xFF030303).withOpacity(0.5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}