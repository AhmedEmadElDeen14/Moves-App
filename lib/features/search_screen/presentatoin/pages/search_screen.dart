import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/search_film_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              keyboardType: TextInputType.text,
              controller: searchController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  size: 18,
                  IconlyLight.search,
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          searchController.text.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: size.height * .3,
                    ),
                    Image.asset(
                      "assets/images/no_movies_icon.png",
                      width: 105,
                      height: 115,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "No movies found",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              : Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) => const SearchFilmItem(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 1,
                  ),
                ),
        ],
      ),
    );
  }
}
