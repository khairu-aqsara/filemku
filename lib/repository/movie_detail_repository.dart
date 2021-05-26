import 'package:info_filem/apiKey.dart';
import 'package:info_filem/models/movie_response.dart';
import 'package:info_filem/networking/api_base_helper.dart';

class MovieDetailRepository {
  final String _apiKey = apiKey;
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Movie> fetchMovieDetail(int selectedMovie) async {
    final response = await _helper.get("movie/$selectedMovie?api_key=$_apiKey");
    return Movie.fromJson(response);
  }
}
