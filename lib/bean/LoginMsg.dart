/**
 *
 * {
    "code":0,
    "message":"",
    "data":{
    "avatar":"http://thirdwx.qlogo.cn/mmopen/dticvkSLXFuuJdC6IDEdhl7QqycDz9D7hvdwniazUTXRCfb7hAWMOZU3fYJibUwNRNibibGicg99Y5ZjfTD4fBeiafPsIicBbBMvdMbs/132",
    "student_id":40154,
    "wx_name":"Bliss",
    "bind_phone":"15938702026",
    "open_id":"oVxDywE0KCNk3jgjM4IeUL-xaiV8",
    "global_id":6040154,
    "login_token":"40154__db7a6e7b6e9c41bca6bf8f035360c15f"
    },
    "timestamp":1579139584,
    "success":true
    }
 */
class LoginMsg {
  String message;
  bool success;
  int code;
  int timestamp;
  DataBean data;

  LoginMsg({this.message, this.success, this.code, this.timestamp, this.data});

  LoginMsg.fromJson(Map<String, dynamic> json) {
    this.message = json['message'];
    this.success = json['success'];
    this.code = json['code'];
    this.timestamp = json['timestamp'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['code'] = this.code;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LoginMsg{message: $message, success: $success, code: $code, timestamp: $timestamp, data: $data}';
  }


}

class DataBean {
  String avatar;
  String wxName;
  String bindPhone;
  String openId;
  String loginToken;
  int studentId;
  int globalId;

  DataBean({this.avatar, this.wxName, this.bindPhone, this.openId, this.loginToken, this.studentId, this.globalId});

  DataBean.fromJson(Map<String, dynamic> json) {
    this.avatar = json['avatar'];
    this.wxName = json['wx_name'];
    this.bindPhone = json['bind_phone'];
    this.openId = json['open_id'];
    this.loginToken = json['login_token'];
    this.studentId = json['student_id'];
    this.globalId = json['global_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['wx_name'] = this.wxName;
    data['bind_phone'] = this.bindPhone;
    data['open_id'] = this.openId;
    data['login_token'] = this.loginToken;
    data['student_id'] = this.studentId;
    data['global_id'] = this.globalId;
    return data;
  }

  @override
  String toString() {
    return 'DataBean{avatar: $avatar, wxName: $wxName, bindPhone: $bindPhone, openId: $openId, loginToken: $loginToken, studentId: $studentId, globalId: $globalId}';
  }

}