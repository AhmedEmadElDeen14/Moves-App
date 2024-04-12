import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/enum/screen_state.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/data/data_sources/home_remote_ds_impl.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/data/repositories/home_repo_impl.dart';
import 'package:movies_app/features/home_screen/domain/use_cases/get_movies_use_case.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_event.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_state.dart';
import 'package:movies_app/features/home_screen/presentation/widgets/movies_list.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Results>? movies;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
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
          )..add(HomeGetPopularMovie()),
        ),
      ],
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.type == ScreenType.failures) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.failures?.message ?? ""),
              ),
            );
          } else if (state.type == ScreenType.success) {
            movies = state.movies;
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 310.h,
                    child: Stack(
                      children: [
                        state.type == ScreenType.loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Image(
                                image:
                                NetworkImage(
                                    "${Constants.imgUrl}${movies?[4].backdropPath ?? ''}"),
                                width: MediaQuery.of(context).size.width*1,
                              ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.bottomLeft,
                              // child: MovieImage(
                              //   result: movies?[0],
                              // ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      movies?[0].title ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "2019  PG-13  2h 7m",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  state.type == ScreenType.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : MoviesList(
                          listTitle: "New Releases",
                        ),
                  state.type == ScreenType.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : MoviesList(
                          listTitle: "Recommended",
                        ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
