import 'package:employees/shared_component/text_in_app.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({
    super.key,
    required this.controller,
    required this.validatorText,
     required this.label,
     this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next ,

  });
   final TextEditingController controller;
   final String validatorText;
   final String label;
    TextInputType keyboardType;
   TextInputAction textInputAction  ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value!.isEmpty)
            {
              return '$validatorText must not be empty';
            }
        },
        style:  TextStyle(
          fontSize: 20,
          color:  Colors.blue.shade700,
          decoration: TextDecoration.none
        ),
        cursorColor: Colors.blueAccent,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          label: textInApp(text: label,color: Colors.blueGrey.shade700),
          focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.blueAccent.shade700)),
          enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.blueAccent.shade700)),
          errorBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.orange.shade900)),
          errorStyle: TextStyle(color: Colors.orange[900])
        ),
        maxLines: null,

      ),
    );
  }
}
