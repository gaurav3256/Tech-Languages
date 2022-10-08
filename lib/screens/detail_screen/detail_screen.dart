import 'package:flutter/material.dart';
import 'package:tech_languages/constants.dart';
import 'package:tech_languages/size_config.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/custom_icon_button.dart';
import 'components/custom_tab_view.dart';
import 'components/description.dart';
import 'components/enroll_bottom_sheet.dart';
import 'components/playlist.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  static String routeName = "/detail";

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  late YoutubePlayerController _controller;

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    const url = 'https://www.youtube.com/watch?v=I9ceqw5Ny-4';

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: false, // is video sound playing?
        loop: false, // is same video repeated?
        autoPlay: false, // is video played when initialized?
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Stack(
                      children: [
                        const Align(
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: CustomIconButton(
                            height: 35,
                            width: 35,
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  player,
                  const SizedBox(height: 15),
                  const Text(
                    'Flutter Zero To Hero',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Created By Mayank Jain',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/icons/star_outlined.png", height: 20),
                      const SizedBox(width: 4),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      const Text(
                        "72 Hours",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomTabView(
                    index: _selectedTag,
                    changeTab: changeTab,
                  ),
                  _selectedTag == 0 ? const Playlist() : const Description(),
                ],
              ),
            ),
          ),
          bottomSheet: BottomSheet(
            onClosing: () {},
            backgroundColor: Colors.white,
            enableDrag: false,
            builder: (context) {
              return const SizedBox(
                height: 80,
                child: EnrollBottomSheet(),
              );
            },
          ),
        );
      },
    );
  }
}
