class BannerModel {
  String? id;
  int? createdOn;
  int? modifiedOn;
  String? name;
  String? desc;
  int? updateTime;
  String? director;
  String? actor;
  String? quality;
  int? year;
  String? cover;
  String? area;
  String? category;
  String? viewCount;
  String? score;
  Null? movieUrl;
  Null? tag;

  BannerModel(
      {this.id,
      this.createdOn,
      this.modifiedOn,
      this.name,
      this.desc,
      this.updateTime,
      this.director,
      this.actor,
      this.quality,
      this.year,
      this.cover,
      this.area,
      this.category,
      this.viewCount,
      this.score,
      this.movieUrl,
      this.tag});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdOn = json['created_on'];
    modifiedOn = json['modified_on'];
    name = json['name'];
    desc = json['desc'];
    updateTime = json['update_time'];
    director = json['director'];
    actor = json['actor'];
    quality = json['quality'];
    year = json['year'];
    cover = json['cover'];
    area = json['area'];
    category = json['category'];
    viewCount = json['view_count'];
    score = json['score'];
    movieUrl = json['MovieUrl'];
    tag = json['Tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_on'] = this.createdOn;
    data['modified_on'] = this.modifiedOn;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['update_time'] = this.updateTime;
    data['director'] = this.director;
    data['actor'] = this.actor;
    data['quality'] = this.quality;
    data['year'] = this.year;
    data['cover'] = this.cover;
    data['area'] = this.area;
    data['category'] = this.category;
    data['view_count'] = this.viewCount;
    data['score'] = this.score;
    data['MovieUrl'] = this.movieUrl;
    data['Tag'] = this.tag;
    return data;
  }
}
