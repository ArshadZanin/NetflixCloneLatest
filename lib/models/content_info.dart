import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.originCountry,
    this.firstAirDate,
    this.name,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  double? popularity;
  MediaType? mediaType;
  String? originalName;
  List<String>? originCountry;
  DateTime? firstAirDate;
  String? name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    popularity: json["popularity"].toDouble(),
    mediaType: mediaTypeValues.map[json["media_type"]],
    originalName: json["original_name"] == null ? null : json["original_name"],
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle == null ? null : originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title == null ? null : title,
    "video": video == null ? null : video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "popularity": popularity,
    "media_type": mediaTypeValues.reverse[mediaType],
    "original_name": originalName == null ? null : originalName,
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry!.map((x) => x)),
    "first_air_date": firstAirDate == null ? null : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
    "name": name == null ? null : name,
  };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
