class ResponseModal {
  final String type;
  dynamic data;
  dynamic statuscode;
  dynamic error;

  ResponseModal({required this.type, this.data, this.statuscode, this.error});

  ResponseModal.responseResult(result, this.type) {
    if (result != null) {
      if (result is String) {
        data = result;
        statuscode = null;
        error = result;
      } else if (result) {
        if (result.statusCode == 200) {
          data = result.data;
          statuscode = result.statusCode;
          error = false;
        } else {
          data = result.data['error_msg'].toString();
          statuscode = result.statusCode;
          error = result.statusMessage;
        }
      }
    } else {
      data = null;
      statuscode = null;
      error = null;
    }
  }
}
