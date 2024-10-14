import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Container(
        width: 64,
        height: 124,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text("Movie Title"),
        Text("Lançamento: 01/01/2022"),
        Row(children: <Widget>[
          InkWell(child: Icon(Icons.favorite)),
          Text("Favoritar")
        ],)
      ],)
    ],);
  }
}
