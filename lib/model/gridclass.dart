class GridClass {
  String? status;
  String? message;
  List<MusicGenre>? musicGenre;

  GridClass({this.status, this.message, this.musicGenre});

  GridClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['music_genre'] != null) {
      musicGenre = <MusicGenre>[];
      json['music_genre'].forEach((v) {
        musicGenre!.add(new MusicGenre.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.musicGenre != null) {
      data['music_genre'] = this.musicGenre!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenre {
  String? genre;
  List<GenreAlbums>? genreAlbums;

  MusicGenre({this.genre, this.genreAlbums});

  MusicGenre.fromJson(Map<String, dynamic> json) {
    genre = json['genre'];
    if (json['genre_albums'] != null) {
      genreAlbums = <GenreAlbums>[];
      json['genre_albums'].forEach((v) {
        genreAlbums!.add(new GenreAlbums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre'] = this.genre;
    if (this.genreAlbums != null) {
      data['genre_albums'] = this.genreAlbums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenreAlbums {
  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  MoreInfo? moreInfo;
  Null? modules;

  GenreAlbums(
      {this.id,
      this.title,
      this.subtitle,
      this.headerDesc,
      this.type,
      this.permaUrl,
      this.image,
      this.language,
      this.year,
      this.playCount,
      this.explicitContent,
      this.listCount,
      this.listType,
      this.list,
      this.moreInfo,
      this.modules});

  GenreAlbums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    headerDesc = json['header_desc'];
    type = json['type'];
    permaUrl = json['perma_url'];
    image = json['image'];
    language = json['language'];
    year = json['year'];
    playCount = json['play_count'];
    explicitContent = json['explicit_content'];
    listCount = json['list_count'];
    listType = json['list_type'];
    list = json['list'];
    moreInfo = json['more_info'] != null
        ? new MoreInfo.fromJson(json['more_info'])
        : null;
    modules = json['modules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['header_desc'] = this.headerDesc;
    data['type'] = this.type;
    data['perma_url'] = this.permaUrl;
    data['image'] = this.image;
    data['language'] = this.language;
    data['year'] = this.year;
    data['play_count'] = this.playCount;
    data['explicit_content'] = this.explicitContent;
    data['list_count'] = this.listCount;
    data['list_type'] = this.listType;
    data['list'] = this.list;
    if (this.moreInfo != null) {
      data['more_info'] = this.moreInfo!.toJson();
    }
    data['modules'] = this.modules;
    return data;
  }
}

class MoreInfo {
  String? isWeekly;
  String? firstname;
  String? songCount;
  String? followerCount;
  String? fanCount;

  MoreInfo(
      {this.isWeekly,
      this.firstname,
      this.songCount,
      this.followerCount,
      this.fanCount});

  MoreInfo.fromJson(Map<String, dynamic> json) {
    isWeekly = json['isWeekly'];
    firstname = json['firstname'];
    songCount = json['song_count'];
    followerCount = json['follower_count'];
    fanCount = json['fan_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isWeekly'] = this.isWeekly;
    data['firstname'] = this.firstname;
    data['song_count'] = this.songCount;
    data['follower_count'] = this.followerCount;
    data['fan_count'] = this.fanCount;
    return data;
  }
}
