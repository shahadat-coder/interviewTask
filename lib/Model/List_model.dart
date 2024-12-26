class ListModel {
  int? id;
  String? title;
  String? description;
  String? companyName;
  String? applyUrl;
  String? deadline;
  String? createDate;
  int? salary;

  ListModel(
      {this.id,
        this.title,
        this.description,
        this.companyName,
        this.applyUrl,
        this.deadline,
        this.createDate,
        this.salary});

  ListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    companyName = json['companyName'];
    applyUrl = json['applyUrl'];
    deadline = json['deadline'];
    createDate = json['createDate'];
    salary = json['salary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['companyName'] = this.companyName;
    data['applyUrl'] = this.applyUrl;
    data['deadline'] = this.deadline;
    data['createDate'] = this.createDate;
    data['salary'] = this.salary;
    return data;
  }
}
