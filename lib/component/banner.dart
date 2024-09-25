import 'package:flutter/material.dart';

class SlidePictureBanner extends StatefulWidget {
  final String title;
  final List<String> images;
  final double height;
  final double width;

  const SlidePictureBanner({
    Key? key,
    required this.title,
    required this.images,
    this.height = 200.0,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  _SlidePictureBannerState createState() => _SlidePictureBannerState();
}

class _SlidePictureBannerState extends State<SlidePictureBanner> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              _pageController
                  .jumpTo(_pageController.position.pixels - details.delta.dx);
            },
            onHorizontalDragEnd: (details) {
              double velocity = details.primaryVelocity!;
              if (velocity > 0) {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              } else if (velocity < 0) {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            widget.images.length,
            (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                width: _currentIndex == index ? 16.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? Colors.black : Colors.grey[400],
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
