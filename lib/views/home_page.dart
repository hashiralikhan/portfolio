import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/globals/app_colors.dart';
import 'package:portfolio/globals/app_text_styles.dart';
import 'package:portfolio/globals/constants.dart';
import 'package:portfolio/helper_class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/widgets/profile_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class SocialButton {
  final String path;
  final String url;

  SocialButton({required this.path, required this.url});
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
   void _launchURL(String link) async {
  debugPrint('Launching URL: $link');
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('Could not launch $link');
  }
}




  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // Initialize your animation here
    const ProfileAnimation();
  }
   @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

var socialButtons = <SocialButton>[
  SocialButton(path: AppAssets.facebook, url: 'https://www.facebook.com/profile.php?id=100012012520860&mibextid=ZbWKwL'),
  SocialButton(path: AppAssets.twitter, url: 'https://www.fiverr.com/hashir_nasir?up_rollout=true'),
  SocialButton(path: AppAssets.github, url: 'https://github.com/hashiralikhan'),
  SocialButton(path: AppAssets.insta, url: 'https://www.linkedin.com/in/rana-hashir-ba7a51263'),
  SocialButton(path: AppAssets.linkedIn, url: 'https://www.linkedin.com/in/rana-hashir-ba7a51263'),
];


  int? socialBI;

  @override
  
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
  mobile: SingleChildScrollView(
    child: Column(
      children: [
        buildHomePersonalInfo(size),
        const SizedBox(height: 25.0),
        const ProfileAnimation(),
      ],
    ),
  ),
  tablet: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(child: buildHomePersonalInfo(size)),
      const ProfileAnimation(),
    ],
  ),
  desktop: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Expanded(
      flex: 2, // Adjust the flex value as needed
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: buildHomePersonalInfo(size),
      ),
    ),
    const ProfileAnimation(),
  ],
),



  paddingWidth: size.width * 0.1,
  bgColor: Colors.transparent,
);

  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0, width: 0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Hashir Ali Khan',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0, width: 0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'App Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText('Freelancer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                  TyperAnimatedText('Flutter Developer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue))
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0, width: 0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'I am Software Engineer having good experience in' 
            'Hybrid web development and Mobile Application using Flutter '
            ' I can create websites fully responsive, user-friendly, and mobile-friendly'
            'What you think, I can develop it for you I\'m expert in'
          'HTML5, Bootstrap, CSS3, JavaScript '
            'I can also fix bugs, errors and repair the design of your website',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0, width: 0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
  itemCount: socialButtons.length,
  shrinkWrap: true,
  scrollDirection: Axis.horizontal,
  separatorBuilder: (context, child) =>
      Constants.sizedBox(width: 8.0, height: 0),
  itemBuilder: (context, index) {
    final socialButton = socialButtons[index];
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          if (value) {
            socialBI = index;
          } else {
            socialBI = null;
          }
        });
      },
      borderRadius: BorderRadius.circular(550.0),
      hoverColor: AppColors.themeColor,
      
      splashColor: AppColors.lawGreen,
      child: buildSocialButton(
        
        socialButton: socialButton,
        hover: socialBI == index ? true : false,
      ),
    );
  },
),

          ),
        ),
        Constants.sizedBox(height: 18.0, width: 0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {}, buttonName: 'Download CV'),
        ),
      ],
    );
  }

 CircleAvatar buildSocialButton({required SocialButton socialButton, required bool hover}) {
  return CircleAvatar(
    maxRadius: 22,
    backgroundColor: AppColors.themeColor,
    child: InkWell(
      onTap: () {
        _launchURL(socialButton.url); // Launch the URL when the button is tapped
      },
      onHover: (value) {
        setState(() {
          hover ? socialBI = socialButtons.indexOf(socialButton) : socialBI = null;
        });
      },
      borderRadius: BorderRadius.circular(550.0),
      hoverColor: AppColors.themeColor,
      splashColor: AppColors.lawGreen,
      child: Image.asset(
        socialButton.path,
        width: 40,
        height: 40,
      ),
    ),
  );
}


}
