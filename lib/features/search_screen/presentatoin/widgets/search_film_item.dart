import 'package:flutter/material.dart';

class SearchFilmItem extends StatelessWidget {
  const SearchFilmItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/film_banner.png"),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Alita Battle Angel",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                ),
              ),
              Text(
                "2019",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,

                  fontSize: 13.0,
                ),
              ),
              Text(
                "Rosa Salazar, Christoph Waltz",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,

                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
