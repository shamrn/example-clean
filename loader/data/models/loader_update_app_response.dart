import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loader_update_app_response.freezed.dart';
part 'loader_update_app_response.g.dart';

@freezed
class LoaderUpdateAppResponse with _$LoaderUpdateAppResponse {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoaderUpdateAppResponse({
    required UpdateAppType updateAppType,
  }) = _LoaderUpdateAppResponse;

  factory LoaderUpdateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$LoaderUpdateAppResponseFromJson(json);
}
