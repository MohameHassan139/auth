
import 'package:auth/constant/endpoint.dart';
import 'package:auth/feature/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failures.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<String, Failuer>> login(
      {required String email, required String password}) async {
    try {
      var data = await ApiService.api.post(
          quray: ApiConstant.login,
          data: {
            'email': email,
            'password': password,
          });
       
      return left(data["token"].toString());
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, Failuer>> register(
      {required String email, required String password} )async {
    try {
      var data = await ApiService.api
          .post(quray: ApiConstant.register,   data: {
            'email': email,
            'password': password,
          });
      
      return left(data['token'].toString());
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }

 

 
}
