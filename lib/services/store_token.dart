import 'package:get_storage/get_storage.dart';

class StoreToken {
  final _storeToken = GetStorage();
  Future<void> createToken(String token)async{
   await _storeToken.write('token', token);
  }
  Future<String?> storeToken()async{
    return _storeToken.read('token') ?? ''; 
  }
  void removeToken()async{
    _storeToken.remove('token');
  }
}