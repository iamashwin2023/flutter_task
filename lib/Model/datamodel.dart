class DataModel {
  List<Dailyactivity>? dailyactivity;

  DataModel({this.dailyactivity});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['dailyactivity'] != null) {
      dailyactivity = <Dailyactivity>[];
      json['dailyactivity'].forEach((v) {
        dailyactivity!.add(new Dailyactivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyactivity != null) {
      data['dailyactivity'] =
          this.dailyactivity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dailyactivity {
  String? section;
  List<Activity>? activity;

  Dailyactivity({this.section, this.activity});

  Dailyactivity.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    if (json['activity'] != null) {
      activity = <Activity>[];
      json['activity'].forEach((v) {
        activity!.add(new Activity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    if (this.activity != null) {
      data['activity'] = this.activity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  String? image;
  String? header;
  String? subheader;

  Activity({this.image, this.header, this.subheader});

  Activity.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    header = json['header'];
    subheader = json['subheader'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['header'] = this.header;
    data['subheader'] = this.subheader;
    return data;
  }
}