import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/presentation/widgets/movies_list.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_remote_ds_impl.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repo_impl.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_event.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_state.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/genres_button.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_image.dart';

class MovieDetails extends StatelessWidget {
  String? movieId;
  MovieModel? movie;

  MovieDetails({super.key, this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(
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
      )..add(MovieDetailsGetMovie()),
      child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
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
            movie = state.movie;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: AppColors.backgroundColor,
              title: Text(
                movie?.title ?? "",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                        "${Constants.imgUrl}${movie?.backdropPath}"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            movie?.title ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "${movie?.releaseDate.toString().substring(0, 4)} ${movie?.runtime} m",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            MovieImage(
                              result: movie,
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 2,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: List.generate(
                                                3,
                                                (buttonIndex) {
                                                  return GenresButton(
                                                    Genre: 'Action',
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            """${movie?.overview}""",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors
                                                  .selectedBookmarkColor,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              "7.7",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  MoviesList(
                    listTitle: "More Like This",
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
