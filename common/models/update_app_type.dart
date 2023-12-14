import 'package:freezed_annotation/freezed_annotation.dart';

enum UpdateAppType {
  @JsonValue('not_required')
  notRequired,
  @JsonValue('required')
  required,
  @JsonValue('optional')
  optional,
}
