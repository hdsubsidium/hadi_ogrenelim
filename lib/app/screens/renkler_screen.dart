import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../constant.dart';
import '../controllers/renkler_controller.dart';
import '../widgets/page_header.dart';
import '../widgets/tile_card.dart';

class RenklerScreen extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const RenklerScreen({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<RenklerScreen> createState() => _RenklerScreenState();
}

class _RenklerScreenState extends State<RenklerScreen> {
  final _scrollController = ScrollController();
  final _audioPlayer = AudioPlayer();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (_scrollController.hasClients) ? _scrollController.offset : 0;
    });
  }

  void _playAudio(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath);
      _audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: PageHeader(
              title: widget.title,
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              offset: offset,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: RenklerList.length,
              (context, index) {
                return Padding(
                  padding: index % 2 == 0
                      ? const EdgeInsets.only(bottom: 20, left: 20)
                      : const EdgeInsets.only(bottom: 20, right: 20),
                  child: TileCard(
                    title: '${RenklerList[index].name}\n${RenklerList[index].ename}',
                                        textColor: RenklerList[index].name == 'White'
                        ? kTitleTextColor
                        : Colors.white,
                    backgroundColor: Color(int.parse(RenklerList[index].code)),
                    fontSizeBase: 30,
                    fontSizeActive: 40,
                    onTap: () => _playAudio(RenklerList[index].audio),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
