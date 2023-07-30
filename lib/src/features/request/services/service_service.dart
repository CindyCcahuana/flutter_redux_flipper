import 'dart:io';
import 'package:mnsolutions/src/common/services/firestore.service.dart';

class ServiceService {
  Future<String> putFileVideo(File object) {
    return FirestoreService()
        .putFile('request_service/', object)
        .then((value) => '$value');
  }

  Future<String> postServiceRequest(String body) {
    return FirestoreService().post('request_service', body);
  }
}
