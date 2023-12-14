import 'package:dio/dio.dart';
import 'package:finance_mobile/features/initial/loader/data/models/loader_update_app_request.dart';
import 'package:finance_mobile/features/initial/loader/data/models/loader_update_app_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'loader_update_app_data_source.g.dart';

@RestApi()
@injectable
abstract class LoaderUpdateAppDataSource {
  @factoryMethod
  factory LoaderUpdateAppDataSource(Dio dio) => _LoaderUpdateAppDataSource(dio);

  @POST('/api/config/update-app/')
  Future<LoaderUpdateAppResponse> fetchUpdateApp(
    @Body() LoaderUpdateAppRequest body,
  );
}
