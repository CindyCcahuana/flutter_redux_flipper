import 'package:mnsolutions/src/common/services/firestore.service.dart';

class AddressService {
  Future<String> postAddress(String body) {
    return FirestoreService().post('address', body);
  }
}
