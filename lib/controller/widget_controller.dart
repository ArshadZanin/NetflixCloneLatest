import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetController extends GetxController{

  Widget whiteText(String text, double size){
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
      ),
    );
  }

  Widget greyButton(IconData icon, Function onPress) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      onPressed: onPress(),
    );
  }

  Widget textButton(String name, Function onPress) {
    return TextButton(
      onPressed: onPress(),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget iconTextButton(IconData icon, String text, Function onPress){
    return FlatButton(
        onPressed: onPress(),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),);
  }

  Widget iconTextButtonWhite(IconData icon, String text, Function onPress){
    return FlatButton(
      onPressed: onPress(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),);
  }

  Widget headingText({required String text}){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}