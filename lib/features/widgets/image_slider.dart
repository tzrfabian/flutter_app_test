import 'package:flutter/material.dart';
import '../../sample/img_carousel_data.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  int _currentImage = 0;

  // Image list
  final List<SlideItem> _slides = imgCarousel.map((item) => SlideItem(
    image: item['image'] as String,
    title: item['title'] as String,
    desc: item['desc'] as String,
  )).toList();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Auto-slide every 3 seconds
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 5), () {
      if(mounted) {
        setState(() {
          _currentImage = (_currentImage + 1) % _slides.length;
        });
        _pageController.animateToPage(
          _currentImage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentImage = index;
                });
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return _buildSlide(_slides[index]);
              }
            ),

            // Page Indicators
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_slides.length, (index) => _buildIndicator(index)),
              ),
            ),

            // Navigation arrows button
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back, 
                    color: Colors.white
                  ),
                  onPressed: _previousSlide,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.3)
                  ),
                )
              )
            ),

            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward, 
                    color: Colors.white
                  ),
                  onPressed: _nextSlide,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.3)
                  ),
                )
              )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(SlideItem slide) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // BG Image
        Image.network(
          slide.image,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if(loadingProgress == null) return child;
            return Container(
              color: Colors.grey[300],
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.red[300],
              child: const Icon(Icons.error, size: 50),
            );
          },
        ),

        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),

        // Slide content
        Positioned(
          bottom: 22,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          // Title
          Text(
            slide.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          // Description
          Text(
            slide.desc,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
              ],
            ),
          ),
        )
      ]
    );
  }

  // Build the indicator for the current slide
  Widget _buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentImage == index ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentImage == index ? Colors.lightBlue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  void _previousSlide() {
    if(_currentImage > 0) {
      _currentImage--;
    } else {
      _currentImage = _slides.length - 1;
    }
    _pageController.animateToPage(
      _currentImage, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }

  void _nextSlide() {
    if(_currentImage < _slides.length - 1) {
      _currentImage++;
    } else {
      _currentImage = 0;
    }
    _pageController.animateToPage(
      _currentImage, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }
}

// Slide item model
class SlideItem {
  final String image;
  final String title;
  final String desc;

  SlideItem({
    required this.image,
    required this.title,
    required this.desc,
  });
}