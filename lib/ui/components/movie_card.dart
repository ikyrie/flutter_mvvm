import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 90,
          height: 120,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(8)),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Movie Title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Lançamento: 01/01/2022",
                style: TextStyle(color: Color(0xFFA5A5A5)),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {},
                      child: const Icon(
                    Icons.favorite,
                    color: Color(0xFFB370FF),
                    size: 15,
                  ),),
                ),
                const Text("Favoritar")
              ],
            )
          ],
        )
      ],
    );
  }
}
