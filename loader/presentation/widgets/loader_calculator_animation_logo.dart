import 'package:finance_mobile/common/ui/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoaderCalculatorAnimationLogo extends StatefulWidget {
  const LoaderCalculatorAnimationLogo({super.key});

  @override
  State<LoaderCalculatorAnimationLogo> createState() =>
      _LoaderCalculatorAnimationLogoState();
}

class _LoaderCalculatorAnimationLogoState
    extends State<LoaderCalculatorAnimationLogo> with TickerProviderStateMixin {
  late AnimationController _calculatorAnimationController;
  late AnimationController _coinAnimationController;

  @override
  void initState() {
    super.initState();

    _calculatorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _coinAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _calculatorAnimationController.dispose();
    _coinAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 245.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RotationTransition(
            turns: Tween(begin: -0.01, end: 0.01).animate(
              CurvedAnimation(
                parent: _calculatorAnimationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: SvgPicture.asset(AppAssets.calculatorLogoIcon),
          ),
          AlignTransition(
            alignment: Tween<AlignmentGeometry>(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ).animate(
              CurvedAnimation(
                parent: _coinAnimationController,
                curve: Curves.easeInOutQuart,
              ),
            ),
            child: Transform.translate(
              offset: Offset(-14.r, 0),
              child: SvgPicture.asset(AppAssets.calculatorLogoCoinIcon),
            ),
          ),
        ],
      ),
    );
  }
}
