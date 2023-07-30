import 'package:mnsolutions/src/common/services/firestore.service.dart';
import 'package:mnsolutions/src/features/core/services/mock/service_request_mock.dart';

class CoreService {
  Future<List<Map<String, dynamic>>> getBanner() {
    return FirestoreService().get('home_banner');
  }

  Future<List<Map<String, dynamic>>> getServices() {
    return FirestoreService().get('service');
  }

  Future<List<Map<String, dynamic>>> getServiceRequests(String userId) {
    return FirestoreService().get(
      'request_service',
      params: {"user.id": userId},
    );
  }

  Future<Map<String, dynamic>> getServiceRequest(String id) {
    return Future.delayed(
      const Duration(seconds: 3),
      () => serviceRequestMock,
    );
  }
}
