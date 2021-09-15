import 'package:flutter/material.dart';
import 'package:orange_valley/models/video.dart';
import 'package:orange_valley/pages/details_page.dart';

class VideosGrid extends StatelessWidget {
  final List<Video> videos;

  VideosGrid({required this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var video in videos)
          GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsPage(video))),
              child: _VideoTile(imageUrl: video.thumbnail, title: video.name))
      ],
    );
  }
}

class _VideoTile extends StatelessWidget {
  _VideoTile({required this.title, required this.imageUrl});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Hero(
            tag: imageUrl,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.6),
              height: 35,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
