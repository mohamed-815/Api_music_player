class SongsModel {
  String? status;
  String? message;
  List<AlbumSongs>? albumSongs;

  SongsModel({this.status, this.message, this.albumSongs});

  SongsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['album_songs'] != null) {
      albumSongs = <AlbumSongs>[];
      json['album_songs'].forEach((v) {
        albumSongs!.add(AlbumSongs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.albumSongs != null) {
      data['album_songs'] = this.albumSongs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AlbumSongs {
  String? id;
  String? type;
  String? album;
  String? year;
  String? duration;
  String? language;
  String? genre;
  String? s320kbps;
  String? hasLyrics;
  String? lyricsSnippet;
  String? releaseDate;
  String? albumId;
  String? subtitle;
  String? title;
  String? artist;
  String? albumArtist;
  String? image;
  String? permaUrl;
  String? url;

  AlbumSongs(
      {this.id,
      this.type,
      this.album,
      this.year,
      this.duration,
      this.language,
      this.genre,
      this.s320kbps,
      this.hasLyrics,
      this.lyricsSnippet,
      this.releaseDate,
      this.albumId,
      this.subtitle,
      this.title,
      this.artist,
      this.albumArtist,
      this.image,
      this.permaUrl,
      this.url});

  AlbumSongs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    album = json['album'];
    year = json['year'];
    duration = json['duration'];
    language = json['language'];
    genre = json['genre'];
    s320kbps = json['320kbps'];
    hasLyrics = json['has_lyrics'];
    lyricsSnippet = json['lyrics_snippet'];
    releaseDate = json['release_date'];
    albumId = json['album_id'];
    subtitle = json['subtitle'];
    title = json['title'];
    artist = json['artist'];
    albumArtist = json['album_artist'];
    image = json['image'];
    permaUrl = json['perma_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['album'] = this.album;
    data['year'] = this.year;
    data['duration'] = this.duration;
    data['language'] = this.language;
    data['genre'] = this.genre;
    data['320kbps'] = this.s320kbps;
    data['has_lyrics'] = this.hasLyrics;
    data['lyrics_snippet'] = this.lyricsSnippet;
    data['release_date'] = this.releaseDate;
    data['album_id'] = this.albumId;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['artist'] = this.artist;
    data['album_artist'] = this.albumArtist;
    data['image'] = this.image;
    data['perma_url'] = this.permaUrl;
    data['url'] = this.url;
    return data;
  }
}
