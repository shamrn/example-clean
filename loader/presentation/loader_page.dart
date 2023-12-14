import 'package:auto_route/auto_route.dart';
import 'package:finance_mobile/common/widgets/bottom_flash_bars/bottom_flash_bar_unknown_error.dart';
import 'package:finance_mobile/core/routing/app_router.gr.dart';
import 'package:finance_mobile/features/initial/loader/presentation/bloc/loader_cubit.dart';
import 'package:finance_mobile/features/initial/loader/presentation/bloc/loader_state.dart';
import 'package:finance_mobile/features/initial/loader/presentation/models/loader_redirect_type.dart';
import 'package:finance_mobile/features/initial/loader/presentation/widgets/loader_calculator_animation_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  void _errorListener(BuildContext context, LoaderState state) {
    if (state.errors?.isUnknownError ?? false) {
      context.read<LoaderCubit>().resetErrors();
      showBottomFlashBarUnknownError(context);
    }
  }

  void _redirectListener(BuildContext context, LoaderState state) {
    if (state.loaderRedirectType != null) {
      switch (state.loaderRedirectType!) {
        case LoaderRedirectType.updateApp:
          context.router.replace(
            UpdateAppRoute(
              updateAppType: context.read<LoaderCubit>().state.updateAppType,
            ),
          );
        case LoaderRedirectType.auth:
          context.router.replace(const SignUpRoute());
      }
    }
  }

  void _blocListener(BuildContext context, LoaderState state) {
    _errorListener(context, state);
    _redirectListener(context, state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoaderCubit, LoaderState>(
      bloc: context.read<LoaderCubit>(),
      listener: _blocListener,
      child: const Scaffold(
        body: SafeArea(
          child: Center(
            child: LoaderCalculatorAnimationLogo(),
          ),
        ),
      ),
    );
  }
}
