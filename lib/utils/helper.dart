import 'package:orange_valley/models/video.dart';

List<Video> getFakeVideos() {
  return [
    Video(name: "Modeling Faces in Clay with Janet Blake", description: "This workshop, lead by acclaimed sculptor, and OVCAA resident artist, Janet Blake, is a don't miss experience. Janet shares tips and tricks that have made her one of the foremost artists in modeling faces in clay. Her engaging style will have you clamoring for more.", thumbnail: "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png", keywords: "clay,face,janet blake,sculpture"),
    Video(name: "Fire Dancers Shine Bright", description: "Fire Rhythm, a Los Angeles dance team, is rising in the elite ranks of fire dancing. This video captured their astounding performance at the Orange Valley Contemporary Arts Museum.", thumbnail: "http://orangevalleycaa.org/api/media/images/thumbs/FireDancers_042981315.png", keywords: "baton,dance,fire,performer,poi"),
    Video(name: "Graphic Art Camp Draws Youth Artists in Droves", description:"Ben Woolrich, Principal Designer for Metro Design, has been teaching a Saturday graphic design camp at the Orange Valley Community Center. We filmed his recent session to share his inspiring lessons with the youth art community.  Ben's warm and open approach to education, along with his mastery of design, is a joy to behold.", thumbnail:"http://orangevalleycaa.org/api/media/images/thumbs/GraphicArtist_052214820.png", keywords: "computer,design,graphic,tablet,youth")
  ];
}

enum VideoSort {
  id, name, duration
}

extension ParseEnumName on VideoSort {
  String filterName() {
    return this.toString().split('.').last;
  }
}