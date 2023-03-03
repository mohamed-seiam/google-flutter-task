import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.inputType, this.errorStyle,this.errorText , this.errorBorder, this.hintText,this.onChanged,this.label,this.preffix, this.controller,this.obscureText=false,this.suffix,this.suffixPress,this.validate});
  String ? hintText ;
  String ? label ;
  TextEditingController ? controller;
  Function (String) ? onChanged ;
  String? Function (String?) ?validate;
  bool ? obscureText;
  IconData ? suffix;
  Function() ?suffixPress;
  TextInputType ? inputType ;
  IconData ? preffix ;
  TextStyle ? errorStyle ;
  InputBorder? errorBorder ;
  String ? errorText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: inputType,
      validator:validate,
      controller: controller,
      style:const TextStyle(
        color: Colors.black,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(label!,style:const TextStyle(color: Colors.black),),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: hintText,
        suffixIcon: suffix !=null ? IconButton(
          onPressed: suffixPress,
          icon: Icon(suffix,color: Colors.purple,),
        ):null,
        prefixIcon : Icon(preffix,color: Colors.purple,) ,
        hintStyle:const TextStyle(
          color: Colors.black,
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedErrorBorder: errorBorder,
        errorStyle: errorStyle,
         // errorText: errorText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide:const BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
