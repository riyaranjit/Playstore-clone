class ListTileData {
  String? title;

  ListTileData({ this.title});

  ListTileData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }
}
