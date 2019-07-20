import 'package:behivecompanion/helper/assets_utils.dart';
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
    var defaultBanners = BannerModel.defaultBanners();
    return Stack(
      children: [
        PageView.builder(
          itemBuilder: (context, position) {
            return BannerWidget(model: defaultBanners[position]);
          },
          itemCount: defaultBanners.length,
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
          child: Container(
            child: MaterialButton(
                color: Colors.white,
                height: 60,
                textTheme: ButtonTextTheme.normal,
                shape: StadiumBorder(side: BorderSide.none),
                onPressed: () => {},
                child: new Text(
                  'Vamos lá!',
                  style: Theme.of(context).textTheme.display1.copyWith(fontSize: 24.0),
                )),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(
                      model.subtitle,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
