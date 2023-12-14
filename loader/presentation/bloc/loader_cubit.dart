import 'dart:async';

import 'package:finance_mobile/common/bloc/base_cubit.dart';
import 'package:finance_mobile/features/initial/common/models/update_app_type.dart';
import 'package:finance_mobile/features/initial/loader/domain/use_cases/loader_update_app_use_case.dart';
import 'package:finance_mobile/features/initial/loader/presentation/bloc/loader_state.dart';
import 'package:finance_mobile/features/initial/loader/presentation/models/loader_errors.dart';
import 'package:finance_mobile/features/initial/loader/presentation/models/loader_redirect_type.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@injectable
class LoaderCubit extends BaseCubit<LoaderState> {
  LoaderCubit({
    required PackageInfo packageInfo,
    required LoaderUpdateAppUseCase loaderUseCase,
  })  : _packageInfo = packageInfo,
        _loaderUseCase = loaderUseCase,
        super(const LoaderState());

  final PackageInfo _packageInfo;
  final LoaderUpdateAppUseCase _loaderUseCase;

  final int _delayTimerStepInMillisecond = 100;
  Timer? _delayTimer;
  int _remainingDelayInMilliseconds = 1800;

  @override
  Future<void> onInit() async {
    _createDelayTimer();

    final unknownErrorOrUpdateAppType = await _loaderUseCase.getUpdateAppType(
      appVersion: _packageInfo.version,
    );

    await _delayWhenRemainingTime();

    unknownErrorOrUpdateAppType.fold(_onUnknownError, _onUpdateAppType);
  }

  @override
  Future<void> close() async {
    _closeDelayTimer();

    await super.close();
  }

  void resetErrors() {
    emit(state.copyWith(errors: null));
  }

  void _onUnknownError(_) {
    emit(state.copyWith(errors: const LoaderErrors(isUnknownError: true)));
  }

  void _onUpdateAppType(UpdateAppType updateAppType) {
    emit(
      state.copyWith(
        loaderRedirectType: updateAppType == UpdateAppType.notRequired
            ? LoaderRedirectType.auth
            : LoaderRedirectType.updateApp,
        updateAppType: updateAppType,
      ),
    );
  }

  void _createDelayTimer() {
    _delayTimer = Timer.periodic(
      Duration(milliseconds: _delayTimerStepInMillisecond),
      (timer) {
        _remainingDelayInMilliseconds -= _delayTimerStepInMillisecond;
      },
    );
  }

  Future<void> _delayWhenRemainingTime() async {
    if (_remainingDelayInMilliseconds > 0) {
      _closeDelayTimer();

      await Future<void>.delayed(
        Duration(milliseconds: _remainingDelayInMilliseconds),
      );
    }
  }

  void _closeDelayTimer() {
    if (_delayTimer?.isActive ?? false) {
      _delayTimer?.cancel();
    }
  }
}
