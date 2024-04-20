import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/search_screen/data/data_sources/movie_search_remote_ds_impl.dart';
import 'package:movies_app/features/search_screen/data/repositories/movie_search_repo_impl.dart';
import 'package:movies_app/features/search_screen/domain/use_cases/get_movie_search_use_case.dart';
import '../../../../core/enum/screen_state.dart';
import '../../data/models/MovieSearchModel.dart';
import '../bloc/search_bloc.dart';
import '../widgets/search_film_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  List<Results> moviesList = [];
  String? movieName;

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
    return BlocProvider(
      create: (context) => SearchBloc(
        getMovieSearchUseCase: GetMovieSearchUseCase(
          MovieSearchRepoImpl(
            MovieSearchRemoteDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )..add(GetSearchEvent()),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state.type == ScreenType.success) {
            print("Success!!!!");
            moviesList = state.movies ?? [];
            print("Movies!!!: $moviesList");
          }else if(state.type == ScreenType.failures){
            print("Failures!!!!");
          }else if(state.type == ScreenType.loading){
            print("loading!!!!");
          }else if(state.type == ScreenType.init){
            print("init!!!!");
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          movieName = value.toString();
                          BlocProvider.of<SearchBloc>(context).add(GetSearchEvent(movieName: movieName));
                          debugPrint("1122 ${state.movie}");
                        });
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
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  moviesList.isEmpty
                      ? Column(
                        children: [
                          SizedBox(
                            height: size.height * .3,
                          ),
                          Image.asset(
                            "assets/images/no_movies_icon.png",
                            width: 105.w,
                            height: 115.h,
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
                            itemBuilder: (context, index) =>
                                const SearchFilmItem(),
                            separatorBuilder: (context, index) => const Divider(),
                            itemCount: 1,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
