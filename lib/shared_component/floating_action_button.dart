import 'package:flutter/material.dart';

Widget floatingActionButton({
  required BuildContext context,
  required Widget page,
  required String text,
  required IconData icon,
  Color color = Colors.blueGrey
})
{
  return FloatingActionButton(
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page,));
    },
    backgroundColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 5,
    tooltip: text,
    child: Icon(icon,color: Colors.cyan.shade300,),
  );
}