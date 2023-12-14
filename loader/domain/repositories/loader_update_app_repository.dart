import 'package:either_dart/either.dart';
import 'package:finance_mobile/common/exceptions/unknown_error_exception.dart';
import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';

abstract interface class LoaderUpdateAppRepository {
  Future<Either<UnknownErrorException, UpdateAppType>> getUpdateAppType({
    required String appVersion,
  });
}
