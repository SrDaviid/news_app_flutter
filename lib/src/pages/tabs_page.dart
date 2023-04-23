import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const BouncingScrollPhysics(),
      children: <Widget>[

        Container(
          color: Colors.red,
        ),

        Container(
          color: Colors.green,
        ),


      ],
    ));
  }
}
