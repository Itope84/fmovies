import 'package:fmovies/src/features/popular/data/models/movie.dart';

class PopularMoviesState {
  PopularMoviesState();
}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  PopularMoviesLoaded(this.movies);
}

class PopularMoviesNoInternet extends PopularMoviesState {}

class PopularMoviesServerError extends PopularMoviesState {}