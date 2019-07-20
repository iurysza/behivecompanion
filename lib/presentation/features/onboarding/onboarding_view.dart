import 'package:behivecompanion/helper/assets_utils.dart';
import 'package:behivecompanion/helper/system_ui_utils.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:behivecompanion/presentation/custom_widgets/large_button.dart';
import 'package:behivecompanion/presentation/custom_widgets/screen_title.dart';
import 'package:behivecompanion/presentation/features/onboarding/onboarding_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatelessWidget {
  final String uri;
  final String title;
  final String subtitle;

  const OnboardingView({Key key, this.uri, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    SystemUI.setStatusBarColor(Colors.white);
    var bannerList = BannerModel.defaultBanners();
    return Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, pos) => BannerWidget(model: bannerList[pos]),
          itemCount: bannerList.length,
        ),
        Positioned(
            height: 50,
            top: 180,
            width: 200,
            left: 0,
            child: SvgPicture.asset(
              svgPath("logo.svg"),
              fit: BoxFit.contain,
            )),
        Positioned(
          bottom: 30,
          left: 50,
          right: 50,
          child: new LargeButton(
            text: "Vamos lá!",
            onPressed: () => Navigator.pushNamed(context, RoutePaths.RequestCode),
          ),
        ),
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  final BannerModel model;

  const BannerWidget({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              SvgPicture.asset(svgPath(model.svgUri),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center),
              Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
              ),
              Positioned(
                height: 200,
                top: 250,
                left: 16,
                right: 16,
                child: ScreenHeaderWidget(
                  title: model.title,
                  subtitle: model.subtitle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
