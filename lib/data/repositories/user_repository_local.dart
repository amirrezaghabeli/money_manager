import 'package:injectable/injectable.dart';
import 'package:money_manager/core/utils/result.dart';
import 'package:money_manager/data/repositories/user_repository.dart';
import 'package:money_manager/data/services/database_service.dart';
import 'package:money_manager/domain/models/user.dart';

@Injectable(as: UserRepository)
class UserRepositoryLocal implements UserRepository {
  final DataBaseService _dataBaseService;

  UserRepositoryLocal({required DataBaseService dataBaseService})
    : _dataBaseService = dataBaseService;
  @override
  Future<Result<bool>> addUser({required User user}) async {
    try {
      _dataBaseService.addUser(user: user);
      return const Result.ok(true);
    } catch (e) {
      return Result.error(Exception('unkwon error'));
    }
  }

  @override
  Future<Result<User>> getUser({
    required String name,
    required String password,
  }) async {
    try {
      final result = await _dataBaseService.getUser(
        name: name,
        password: password,
      );
      return Result.ok(result!);
    } catch (e) {
      return Result.error(Exception('unknown error'));
    }
  }
}
