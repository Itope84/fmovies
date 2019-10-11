import 'package:dio/dio.dart';
import 'package:fmovies/src/core/api/movies_api_service.dart';

class MoviesApiServiceFactory implements MoviesApiService {
  @override
  buildClient() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://api.themoviedb.org",
    );

    return Dio(baseOptions);
  }

  @override
  getPopularMovies(int page) {
    Dio client = buildClient();
    return client.request(
      "/3/movie/now_playing",
      queryParameters: {
        "sort_by": "popularity.desc",
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
        "page": "$page",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }

  @override
  getMovieDetails(int movieId) {
    Dio client = buildClient();
    return client.request(
      "/3/movie/$movieId",
      queryParameters: {
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
        "append_to_response": "credits,videos,images",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }

  @override
  getMovieCredits(int movieId) {
    Dio client = buildClient();
    return client.request(
      "/3/movie/$movieId/credits",
      queryParameters: {
        "api_key": "c1d17945fca15cf2153ab77f065ff55c",
      },
      options: Options(
        method: "GET",
        responseType: ResponseType.plain,
      ),
    );
  }
}
