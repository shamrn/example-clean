import 'package:either_dart/either.dart';
import 'package:finance_mobile/common/exceptions/unknown_error_exception.dart';
import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';
import 'package:finance_mobile/features/initial/loader/domain/repositories/loader_update_app_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoaderUpdateAppUseCase {
  const LoaderUpdateAppUseCase({
    required LoaderUpdateAppRepository loaderUpdateAppRepository,
  }) : _loaderUpdateAppRepository = loaderUpdateAppRepository;

  final LoaderUpdateAppRepository _loaderUpdateAppRepository;

  Future<Either<UnknownErrorException, UpdateAppType>> getUpdateAppType({
    required String appVersion,
  }) {
    return _loaderUpdateAppRepository.getUpdateAppType(appVersion: appVersion);
  }
}
