import 'package:dio/dio.dart';

import 'failure.dart';

class ServicesFailure extends Failure {
  @override
  final String message;
  ServicesFailure(this.message) : super(message);

  factory ServicesFailure.fromDioErro(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServicesFailure('Connection time out Apiservives ');
      case DioErrorType.sendTimeout:
        return ServicesFailure('Send time out Apiservives');
      case DioErrorType.receiveTimeout:
        return ServicesFailure('Receive time out Apiservives');
      case DioErrorType.badCertificate:
        return ServicesFailure('Receive time out Apiservives');
      case DioErrorType.badResponse:
        return ServicesFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.statusMessage);
      case DioErrorType.cancel:
        return ServicesFailure('Canceld Request Error');
      case DioErrorType.connectionError:
        return ServicesFailure(' Internet Connection Error ');
      case DioErrorType.unknown:
        return ServicesFailure('Oops Error please try again!');

      default:
        return ServicesFailure('Oops Error please try again!');
    }
  }

  factory ServicesFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServicesFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServicesFailure('Request not found ');
    }
    if (statusCode == 500) {
      return ServicesFailure('Server Failure please try again!');
    }
    return ServicesFailure('oops there was an error, please try again!');
  }
}
