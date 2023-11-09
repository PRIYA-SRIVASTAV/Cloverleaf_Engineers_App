const String KEYENGTOKEN = "KEY_ENG_TOKEN";
const String KEYSETOKEN = "KEY_SE_TOKEN";
const String KEYUNIQUEID = "KEY_UNIQUE_ID";
const String KEYUSERNAME = "KEY_USER_NAME";
const String KEYPROFILEPIC = "KEY_PROFILEPIC";
const String KEYID = "KEY_ID";
const String KEYWORKID = "KEY_WORK_ID";





/// zegocloud  key
class UserInfo {
  String id = '';
  String name = '';

  UserInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
const String cacheUserIDKey = 'cache_user_id_key';