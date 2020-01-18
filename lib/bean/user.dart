/**
 * 用户信息
 * {
    "code": 0,
    "data": {
    "avatar": "http://thirdwx.qlogo.cn/mmopen/dticvkSLXFuuJdC6IDEdhl7QqycDz9D7hvdwniazUTXRCfb7hAWMOZU3fYJibUwNRNibibGicg99Y5ZjfTD4fBeiafPsIicBbBMvdMbs/132",
    "user_id": 40154,
    "wx_name": "Bliss",
    "open_id": "oVxDywE0KCNk3jgjM4IeUL-xaiV8",
    "name": "杨天福",
    "phone": "15938702026",
    "age": 8,
    "grade": 3,
    "gold": 32,
    "study_remind_time": null,
    "carrot": 63,
    "bind_phone": "15938702026",
    "has_password": 1,
    "is_promoter": 1,
    "promoter_type": "promoter"
    },
    "message": "操作成功"
    }
 */
class User {
  String message;
  int code;
  DataBean data;

  User({this.message, this.code, this.data});

  User.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.code = json['code'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'User{message: $message, code: $code, data: $data}';
  }


}

class DataBean {
  String avatar;
  String wxName;
  String openId;
  String name;
  String phone;
  String studyRemindTime;
  String bindPhone;
  String promoterType;
  int userId;
  int age;
  int grade;
  int gold;
  int carrot;
  int hasPassword;
  int isPromoter;

  DataBean({this.avatar, this.wxName, this.openId, this.name, this.phone, this.studyRemindTime, this.bindPhone, this.promoterType, this.userId, this.age, this.grade, this.gold, this.carrot, this.hasPassword, this.isPromoter});

  DataBean.fromJson(Map<String, dynamic> json) {
    this.avatar = json['avatar'];
    this.wxName = json['wx_name'];
    this.openId = json['open_id'];
    this.name = json['name'];
    this.phone = json['phone'];
    this.studyRemindTime = json['study_remind_time'];
    this.bindPhone = json['bind_phone'];
    this.promoterType = json['promoter_type'];
    this.userId = json['user_id'];
    this.age = json['age'];
    this.grade = json['grade'];
    this.gold = json['gold'];
    this.carrot = json['carrot'];
    this.hasPassword = json['has_password'];
    this.isPromoter = json['is_promoter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['wx_name'] = this.wxName;
    data['open_id'] = this.openId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['study_remind_time'] = this.studyRemindTime;
    data['bind_phone'] = this.bindPhone;
    data['promoter_type'] = this.promoterType;
    data['user_id'] = this.userId;
    data['age'] = this.age;
    data['grade'] = this.grade;
    data['gold'] = this.gold;
    data['carrot'] = this.carrot;
    data['has_password'] = this.hasPassword;
    data['is_promoter'] = this.isPromoter;
    return data;
  }

  @override
  String toString() {
    return 'DataBean{avatar: $avatar, wxName: $wxName, openId: $openId, name: $name, phone: $phone, studyRemindTime: $studyRemindTime, bindPhone: $bindPhone, promoterType: $promoterType, userId: $userId, age: $age, grade: $grade, gold: $gold, carrot: $carrot, hasPassword: $hasPassword, isPromoter: $isPromoter}';
  }

}