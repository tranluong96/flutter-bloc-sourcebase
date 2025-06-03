import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/generated/assets.gen.dart';
import 'package:my_app/pages/onboarding/widgets/onboarding_item.widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<Widget> _buildListItem() {
    return List.generate(
      4,
      (index) => OnBoardingItemWidget(
        image: Assets.images.imgOnboarding.image(
          height: 300,
          width: 300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          GFCarousel(
            items: _buildListItem(),
            autoPlay: true,
            height: 500,
            pagerSize: 16,
            passiveIndicator: const Color(0xff92E3A9).withOpacity(0.3),
            activeIndicator: const Color(0xff92E3A9),
            hasPagination: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Get fast & safe delivery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Get good quality products for your plants ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () {
              context.router.replace(const LoginRoute());
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff92E3A9),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
