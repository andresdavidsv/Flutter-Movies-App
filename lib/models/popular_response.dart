// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromJson(jsonString);

import 'dart:convert';

import 'package:movies/models/models.dart';

class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
