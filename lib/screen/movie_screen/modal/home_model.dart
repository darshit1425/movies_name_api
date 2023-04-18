// To parse this JSON data, do
//
//     final movieModal = movieModalFromJson(jsonString);

import 'dart:convert';

MovieModal movieModalFromJson(String str) => MovieModal.fromJson(json.decode(str));

String movieModalToJson(MovieModal data) => json.encode(data.toJson());

class MovieModal {
  MovieModal({
    required this.d,
    required this.q,
    required this.v,
  });

  List<D> d;
  String q;
  int v;

  factory MovieModal.fromJson(Map<String, dynamic> json) => MovieModal(
    d: List<D>.from(json["d"].map((x) => D.fromJson(x))),
    q: json["q"],
    v: json["v"],
  );

  Map<String, dynamic> toJson() => {
    "d": List<dynamic>.from(d.map((x) => x.toJson())),
    "q": q,
    "v": v,
  };
}

class D {
  D({
    this.i,
    required this.id,
    required this.l,
    this.q,
    this.qid,
    required this.rank,
    this.s,
    this.y,
  });

  I? i;
  String id;
  String l;
  String? q;
  String? qid;
  int rank;
  String? s;
  int? y;

  factory D.fromJson(Map<String, dynamic> json) => D(
    i: json["i"] == null ? null : I.fromJson(json["i"]),
    id: json["id"],
    l: json["l"],
    q: json["q"],
    qid: json["qid"],
    rank: json["rank"],
    s: json["s"],
    y: json["y"],
  );

  Map<String, dynamic> toJson() => {
    "i": i?.toJson(),
    "id": id,
    "l": l,
    "q": q,
    "qid": qid,
    "rank": rank,
    "s": s,
    "y": y,
  };
}

class I {
  I({
    required this.height,
    required this.imageUrl,
    required this.width,
  });

  int height;
  String imageUrl;
  int width;

  factory I.fromJson(Map<String, dynamic> json) => I(
    height: json["height"],
    imageUrl: json["imageUrl"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "imageUrl": imageUrl,
    "width": width,
  };
}
