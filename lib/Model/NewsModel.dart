class NewsModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  NewsModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      source = json["source"] != null ? Source.fromJson(json["source"]) : null;
      author = json["author"] as String?;
      title = json["title"] as String?;
      description = json["description"] as String?;
      url = json["url"] as String?;
      urlToImage = json["urlToImage"] as String?;
      publishedAt = json["publishedAt"] as String?;
      content = json["content"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (source != null) {
      _data["source"] = source?.toJson();
    }
    _data["author"] = author;
    _data["title"] = title;
    _data["description"] = description;
    _data["url"] = url;
    _data["urlToImage"] = urlToImage;
    _data["publishedAt"] = publishedAt;
    _data["content"] = content;
    return _data;
  }
}

class Source {
  dynamic id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json["id"];
      name = json["name"] as String?;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}
