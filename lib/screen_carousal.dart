import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SCreenCarousal extends StatefulWidget {
  const SCreenCarousal({super.key});

  @override
  State<SCreenCarousal> createState() => _SCreenCarousalState();
}

class _SCreenCarousalState extends State<SCreenCarousal> {
  var urlimages = [
    "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ];

  int icontroller = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 400,
          child: CarouselSlider.builder(
            itemCount: urlimages.length,
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: 300,
                height: 30,
                child: Image(
                  height: 100,
                  fit: BoxFit.fill,
                  image: NetworkImage(urlimages[index]),
                ),
              );
            },
            options: CarouselOptions(
              height: 350,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                log(index.toString());
                icontroller = index;
                setState(() {});
              },
            ),
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: icontroller,
          count: urlimages.length,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.grey,
            activeDotColor: Colors.black,
          ),
        ),
      ]),
    );
  }
}
