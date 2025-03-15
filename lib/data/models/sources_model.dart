import 'dart:math';
class SourcesModel {
  final String status;
  final List<Source> sources;

  SourcesModel({required this.status, required this.sources});

  factory SourcesModel.fromjson(Map<String,dynamic> json){
    return SourcesModel(
      status: json["status"],
      sources:List.from(json["sources"]).map(
      (e) => Source.fromjson(e),
    ).toList(),
    );
  }
}

class Source{
  final String id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromjson(Map<String,dynamic> json){
    return Source(
        id: json["id"],
        name: json["name"],
    );
  }
}
