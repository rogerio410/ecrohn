import 'package:flutter/material.dart';
import 'carousel_slider.dart';
import 'package:video_player/video_player.dart';

final imgList = <String>[
  'assets/images/t0.jpg',
  // 'assets/images/t1.jpg',
  'assets/images/t11.jpg',
  'assets/images/t12.jpg',
  'assets/images/t13.jpg',
  'assets/images/t14.jpg',
  'assets/images/t15.jpg',
];

class PresetantionFadeTab extends StatefulWidget {
  PresetantionFadeTab({Key key}) : super(key: key);

  @override
  _PresetantionFadeTabState createState() => _PresetantionFadeTabState();
}

class _PresetantionFadeTabState extends State<PresetantionFadeTab>
    with TickerProviderStateMixin {
  final Container img1 = Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/images/t0.jpg',
      fit: BoxFit.fill,
    ),
  );

  final Container img2 = Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(
      'assets/images/t15.jpg',
      fit: BoxFit.fill,
    ),
  );

  Widget img;
  Stack stack;
  bool isImg1;

  @override
  void initState() {
    stack = Stack(
      children: <Widget>[
        img1,
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 45,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[200].withOpacity(0.4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Tap here',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 46,
                      color: Colors.redAccent,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    img = stack;
    isImg1 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: img,
        onTap: () {
          setState(() {
            img = isImg1 ? img2 : stack;
            isImg1 = !isImg1;
          });
        },
      ),
    );
  }
}

class PresentationTab extends StatelessWidget {
  const PresentationTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlay: true,
        enableInfiniteScroll: false,
        reverse: true,
        autoPlayInterval: Duration(milliseconds: 1800),
        autoPlayAnimationDuration: Duration(milliseconds: 400),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        pauseAutoPlayInFiniteScroll: true,
        pauseAutoPlayOnTouch: true,
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.fill,
                    height: height,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class PresentationVideoTab extends StatefulWidget {
  PresentationVideoTab({Key key}) : super(key: key);

  @override
  _PresentationVideoTabState createState() => _PresentationVideoTabState();
}

class _PresentationVideoTabState extends State<PresentationVideoTab> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset("assets/videos/cronh.mp4")
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize()
        ..play();
    } else {
      if (playerController.value.isPlaying) {
        playerController.pause();
      } else {
        playerController.initialize();
        playerController.play();
      }
    }
  }

  @override
  void deactivate() {
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Example'),
      ),
      body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: (playerController != null
                    ? VideoPlayer(
                        playerController,
                      )
                    : Container()),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createVideo();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class PresetantionAnimatedTab extends StatefulWidget {
  PresetantionAnimatedTab({Key key}) : super(key: key);

  @override
  _PresetantionAnimatedTabState createState() =>
      _PresetantionAnimatedTabState();
}

class _PresetantionAnimatedTabState extends State<PresetantionAnimatedTab> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 1500),
      child: InkWell(
        key: ValueKey(first),
        child: Image.asset(
          first ? 'assets/images/t0.jpg' : 'assets/images/t15.jpg',
          fit: BoxFit.cover,
        ),
        onTap: () {
          setState(() {
            first = !first;
          });
        },
      ),
    );
  }
}
