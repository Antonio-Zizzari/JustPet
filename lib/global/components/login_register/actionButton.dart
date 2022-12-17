import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';

Widget actionButton(BuildContext context, String text, Widget redirect, Color color) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => redirect
        ));
      },
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              // Change your radius here
              borderRadius: BorderRadius.circular(16),
            ),
          )
      ),
    ),
  );
}