import 'package:freezed_annotation/freezed_annotation.dart';

part 'loader_update_app_request.freezed.dart';
part 'loader_update_app_request.g.dart';

@freezed
class LoaderUpdateAppRequest with _$LoaderUpdateAppRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LoaderUpdateAppRequest({
    required String version,
  }) = _LoaderUpdateApp;

  factory LoaderUpdateAppRequest.fromJson(Map<String, dynamic> json) =>
      _$LoaderUpdateAppRequestFromJson(json);
}
