class YpNetUser {
  String username;
  String password;
  int perID;

  YpNetUser(String username, String password, int perID) {
    this.username = username;
    this.password = password;
    this.perID = perID;
  }

  YpNetUser.fromJson(Map json)
      : username = json['name']['first'],
        password = json['name']['last'],
        perID = json['location']['street']['number'];

  Map toJson() {
    return {'username': username, 'password': password, 'perID': perID};
  }


 

}
