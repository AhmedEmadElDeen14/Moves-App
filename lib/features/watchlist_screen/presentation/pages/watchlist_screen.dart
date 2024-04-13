import 'package:flutter/material.dart';
import 'package:movies_app/features/search_screen/presentatoin/widgets/search_film_item.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Watchlist",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Flexible(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => const SearchFilmItem(),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
