import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/views/about_me.dart';
import 'package:portfolio/views/my_portfolio.dart';
import 'package:portfolio/views/my_service.dart';
import 'package:portfolio/widgets/profile_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 100,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Portfolio',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
              const Spacer(),
              Text(
                'Home',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'About',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Services',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Portfolio',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Contact',
                style: AppTextStyles.headerTextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: size.height * 0.1,
            left: size.width * 0.1,
            right: size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 1200),
                      child: Text(
                        'Hello, It\'s Me',
                        style:
                            AppTextStyles.montserratStyle(color: Colors.white),
                      ),
                    ),
                    Constants.sizedBox(height: 10, width: 0),
                    FadeInRight(
                      duration: const Duration(milliseconds: 1400),
                      child: Text(
                        'Hashir Ali Khan',
                        style: AppTextStyles.headingStyles(color: Colors.white),
                      ),
                    ),
                    Constants.sizedBox(height: 10, width: 0),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1400),
                      child: Row(
                        children: [
                          Text(
                            'I am a ',
                            style: AppTextStyles.montserratStyle(
                                color: Colors.white),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Flutter Developer',
                                textStyle: AppTextStyles.montserratStyle(
                                    color: Colors.amber),
                              ),
                              TyperAnimatedText('Freelancer',
                                  textStyle: AppTextStyles.montserratStyle(
                                      color: Colors.amber)),
                              TyperAnimatedText('YouTuber',
                                  textStyle: AppTextStyles.montserratStyle(
                                      color: Colors.amber))
                            ],
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          )
                        ],
                      ),
                    ),
                    Constants.sizedBox(height: 10, width: 0),
                    FadeInDown(
                      duration: const Duration(milliseconds: 1600),
                      child: SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          'In publishing and graphic design, Lorem ipsum is a placeholder '
                          'text commonly used to demonstrate the visual form of a document'
                          ' or a typeface without relying on meaningful content.',
                          style: AppTextStyles.normalStyle(),
                        ),
                      ),
                    ),
                    Constants.sizedBox(height: 10, width: 0),
                    Row(
                      children: [
                        buildSocialButton(path: AppAssets.facebook),
                        Constants.sizedBox(height: 0, width: 10),
                        buildSocialButton(path: AppAssets.insta),
                        Constants.sizedBox(height: 0, width: 10),
                        buildSocialButton(path: AppAssets.twitter),
                        Constants.sizedBox(height: 0, width: 10),
                        buildSocialButton(path: AppAssets.github),
                        Constants.sizedBox(height: 0, width: 10),
                        buildSocialButton(path: AppAssets.linkedIn),
                      ],
                    ),
                    Constants.sizedBox(height: 20, width: 0),
                    builtMaterialButton(onTap: () {})
                  ],
                ),
                const SizedBox(width: 20),
                const ProfileAnimation()
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const AboutMe(),
            const MyService(),
            const MyPortfolio()

          ],
        ),
      ),
    );
  }
}

MaterialButton builtMaterialButton({
  required VoidCallback onTap,
}) {
  return MaterialButton(
    onPressed: onTap,
    color: AppColors.robinEdgeBlue,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    hoverColor: AppColors.aqua,
    height: 55,
    elevation: 6,
    minWidth: 130,
    child: Text('Download CV',
        style: AppTextStyles.headerTextStyle(color: Colors.white)),
  );
}

CircleAvatar buildSocialButton({required String path}) {
  return CircleAvatar(
    maxRadius: 22,
    backgroundColor: AppColors.themeColor,
    backgroundImage: AssetImage(path),
  );
}
