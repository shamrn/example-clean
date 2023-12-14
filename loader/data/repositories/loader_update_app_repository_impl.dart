import 'package:either_dart/either.dart';
import 'package:finance_mobile/common/exceptions/unknown_error_exception.dart';
import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';
import 'package:finance_mobile/features/initial/loader/data/data_sources/loader_update_app_data_source.dart';
import 'package:finance_mobile/features/initial/loader/data/models/loader_update_app_request.dart';
import 'package:finance_mobile/features/initial/loader/domain/repositories/loader_update_app_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoaderUpdateAppRepository)
class LoaderUpdateAppRepositoryImpl implements LoaderUpdateAppRepository {
  const LoaderUpdateAppRepositoryImpl(this._updateAppDataSource);

  final LoaderUpdateAppDataSource _updateAppDataSource;

  @override
  Future<Either<UnknownErrorException, UpdateAppType>> getUpdateAppType({
    required String appVersion,
  }) async {
    try {
      final response = await _updateAppDataSource.fetchUpdateApp(
        LoaderUpdateAppRequest(version: appVersion),
      );

      return Right(response.updateAppType);
    } on Exception catch (_) {
      return Left(UnknownErrorException());
    }
  }
}
