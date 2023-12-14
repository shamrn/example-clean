import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';
import 'package:finance_mobile/features/initial/loader/presentation/models/loader_errors.dart';
import 'package:finance_mobile/features/initial/loader/presentation/models/loader_redirect_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loader_state.freezed.dart';

@freezed
class LoaderState with _$LoaderState {
  const factory LoaderState({
    @Default(UpdateAppType.required) UpdateAppType updateAppType,
    LoaderRedirectType? loaderRedirectType,
    LoaderErrors? errors,
  }) = _LoaderState;
}
