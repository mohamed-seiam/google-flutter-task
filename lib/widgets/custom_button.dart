// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text,this.onTap,this.color,this.colorText});
  String  text ;
  VoidCallback ? onTap ;
  Color ? color ;
  Color ? colorText;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14.0),
        ),
        height: 70.0,
        width: double.infinity,
        child:  Center(
          child:  Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
