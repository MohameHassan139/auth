import 'package:auth/feature/profile/data/models/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../constant/endpoint.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/errors/failures.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<UserData, Failuer>> getProfile({
    required int id,
  }) async {
    try {
      var data = await ApiService.api.post(
        quray:"${ ApiConstant.login}/$id",
      );
      UserData model = UserData.fromJson(data);
      return left(model);
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailuer.fromDioError(dioException: e));
      }
      return right(ServerFailuer(errorMessage: e.toString()));
    }
  }
}
