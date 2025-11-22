
class Intermediatedata {
    String? id;
    String? level;
    String? name;
    String? description;

    Intermediatedata({this.id, this.level, this.name, this.description});

    Intermediatedata.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        level = json["level"];
        name = json["name"];
        description = json["description"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["level"] = level;
        _data["name"] = name;
        _data["description"] = description;
        return _data;
    }
     static List<Intermediatedata> ofdata(List data) {
    return data.map((e) => Intermediatedata.fromJson(e)).toList();
  }
}