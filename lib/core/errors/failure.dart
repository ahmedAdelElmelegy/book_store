import 'package:dio/dio.dart';

abstract class Failure {
  final String erorrMassage;

  Failure(this.erorrMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.erorrMassage);

  factory ServerFailure.fromDioExeption(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(' Sendtimeout ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponce(
          dioError.response!.statusCode!,
          dioError.response!.data,
        ); //
      case DioExceptionType.cancel:
        return ServerFailure('Cancel ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Erorr,Please Try again');
    }
  }
  factory ServerFailure.fromResponce(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['erorr']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request  not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server erorr , Please try later');
    } else {
      return ServerFailure('Opps  There  was  an erorr ,Please try again');
    }
  }
}
