import 'package:get_storage/get_storage.dart';

class StoreToken {
  final _storeToken = GetStorage();
  void createToken(String token)async{
    _storeToken.write('token', token);
  }
  void storeToken()async{
    _storeToken.read('token');
  }
  void removeToken()async{
    _storeToken.remove('token');
  }
}