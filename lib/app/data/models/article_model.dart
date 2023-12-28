class Article {
  Article({
    required this.name,
    required this.descriptions,
    required this.image,
    required this.url,
  });

  final String name;
  final String descriptions;
  final String image;
  final String url;

  Article.fromJson(Map<String, Object?> json)
      : this(
          name: json['name'] == null ? '' : json['name'] as String,
          descriptions: json['descriptions'] == null
              ? ''
              : json['descriptions'] as String,
          image: json['image'] == null ? '' : json['image'] as String,
          url: json['url'] == null ? '' : json['url'] as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'descriptions': descriptions,
      'image': image,
      'url': url,
    };
  }
}
