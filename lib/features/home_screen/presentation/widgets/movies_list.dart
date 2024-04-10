import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/routes.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/home_screen/data/data_sources/home_remote_ds_impl.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/data/repositories/home_repo_impl.dart';
import 'package:movies_app/features/home_screen/domain/use_cases/get_movies_use_case.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_event.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_state.dart';
import 'package:movies_app/features/home_screen/presentation/widgets/movie_cover.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_remote_ds_impl.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repo_impl.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_event.dart';

class MoviesList extends StatelessWidget {
  String listTitle;
  List<Results>? movies;
  String? movieId;

  MoviesList({super.key, required this.listTitle,this.movieId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        listTitle == "New Releases"
            ? BlocProvider(
          create: (context) =>
          HomeBloc(
            GetPopularMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
            GetNewReleasesMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
            GetRecommendedMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
          )
            ..add(HomeGetNewReleasesMovie()),
        )
            : listTitle == "Recommended" ?

        BlocProvider(
          create: (context) =>
          HomeBloc(
            GetPopularMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
            GetNewReleasesMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
            GetRecommendedMovieUseCase(
              HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              ),
            ),
          )
            ..add(HomeGetRecommendedMovie()),
        )
        :BlocProvider(create: (context) => MovieDetailsBloc(
          GetMovieDetailsUseCase(
            MovieDetailsRepoImpl(
              MovieDetailsRemoteDSImpl(
                ApiManager(),
              ),
            ),
          ),
          GetSimilarMoviesUseCase(
            MovieDetailsRepoImpl(
              MovieDetailsRemoteDSImpl(
                ApiManager(),
              ),
            ),
          ),movieId!,
        )..add(MovieDetailsGetSimilarMovies()),),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.failures) {
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text("Error"),
                    content: Text(state.failures?.message ?? ""),
                  ),
            );
          } else if (state.type == ScreenType.loading) {} else
          if (state.type == ScreenType.success) {
            movies = state.movies;
            print(state.movies?[0].title);
          }
        },
        builder: (context, state) {
          return state.type == ScreenType.loading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Column(
            children: [
              Container(
                color: AppColors.rectangleBackgroundColor,
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        listTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 285.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.movieDetails,
                                    arguments: movies?[index].id.toString());
                              },
                              child: MovieCoverImage(
                                result: movies?[index],
                              ),
                            ),
                          );
                        },
                        itemCount: movies?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
