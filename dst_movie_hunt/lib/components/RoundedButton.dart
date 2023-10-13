import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.title="",required this.onpressed});
  String title=  "";
  void Function() onpressed = (){};
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: 290.0,
        height: 50.0,

        child: ElevatedButton(
          onPressed: onpressed,
          child: Text(title,style: TextStyle(color: Colors.blue,fontSize: 20.0),),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        ),
      ),
    );
  }
}