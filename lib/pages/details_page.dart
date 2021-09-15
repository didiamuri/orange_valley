import 'package:flutter/material.dart';
import 'package:orange_valley/models/video.dart';
import 'package:orange_valley/pages/video_player_page.dart';
import 'package:orange_valley/utils/constants.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.video);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(video.name),
      ),
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: _VideoDetails(video),
      ),
    );
  }
}

class _VideoDetails extends StatelessWidget {
  _VideoDetails(this.video);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DetailsPoster(posterUrl: video.thumbnail, videoUrl: video.videoUrl),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getDescription(),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DetailsKeywords(keywords: video.keywords),
        )
      ],
    );
  }

  Widget _getDescription() => Text(
        video.description,
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      );
}

class _DetailsPoster extends StatelessWidget {
  _DetailsPoster({this.posterUrl, this.videoUrl});
  final posterUrl;
  final videoUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: posterUrl,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(url: videoUrl),
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  posterUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 200,
                  color: Colors.white70,
                ),
              )
            ],
          ),
        ));
  }
}

class _DetailsKeywords extends StatelessWidget {
  _DetailsKeywords({this.keywords});
  final keywords;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          for (var genre in keywords.split(','))
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Chip(
                label: Text(genre),
              ),
            )
        ],
      ),
    );
  }
}
