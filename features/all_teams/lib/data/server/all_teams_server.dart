import 'package:all_teams/data/model/all_teams_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'all_teams_server.g.dart';

const String baseUrl = 'https://api.sportmonks.com';

@RestApi(baseUrl: baseUrl)
abstract class AllTeamsServer {
  factory AllTeamsServer(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AllTeamsServer;

  @GET("/:version/:sport/teams")
  Future<HttpResponse<AllTeamsResponseModel>> getAllTeams({
    @Path("version") required String version,
    @Path("sport") required String sport,
    @Query("page") required int page,
  });
}
