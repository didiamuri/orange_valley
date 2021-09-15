import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_valley/models/video.dart';
import 'package:orange_valley/services/video.api.dart';
import 'package:orange_valley/utils/constants.dart';
import 'package:orange_valley/utils/helper.dart';
import 'package:orange_valley/widgets/videos_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = VideoSort.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orage Valley CAA'),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(value: VideoSort.id, child: Text('Par défaut')),
              PopupMenuItem(value: VideoSort.name, child: Text('Par nom')),
              PopupMenuItem(value: VideoSort.duration, child: Text('Par durée'))
            ],
          )
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
          future: getVideoFromApi(filter: _selectedFilter),
          builder: (ctx, snapshot) {
            final videos;
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasError)
              return Center(child: Text('$snapshot.error'));
            else
              videos = snapshot.data as List<Video>;
            return VideosGrid(videos: videos);
          },
        ),
      ),
    );
  }

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}
