import 'package:dartz/dartz.dart' show Left, Right, Either;
import 'package:mobile_app/core/api/api_consumer.dart';
import 'package:mobile_app/core/api/end_ponits.dart';
import 'package:mobile_app/core/errors/exceptions.dart';
import 'package:mobile_app/helpers/cache/cache_helper.dart';
import '../models/user_models/sign_in_model.dart' show SignInModel;

class UserRepository {
  final ApiConsumer apiConsumer;

  UserRepository(this.apiConsumer);
  Future<Either<String, SignInModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.login,
        data: {ApiKey.email: email, ApiKey.password: password},
      );
      final SignInModel user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignInModel>> signUp(
    String email,
    String name,
    String password,
  ) async {
    try {
      await apiConsumer.post(
        EndPoint.register,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final response = await apiConsumer.post(
        EndPoint.login,
        data: {ApiKey.email: email, ApiKey.password: password},
      );
      final SignInModel user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  void logOut() {
    CacheHelper().clearData(key: ApiKey.token);
  }
}
