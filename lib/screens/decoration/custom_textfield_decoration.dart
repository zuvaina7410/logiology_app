import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String label,IconData? icon){
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: Colors.grey[100],
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      
    )
  );
}