import '../../core/utils/result.dart';
import '../../domain/models/user.dart';

abstract class UserRepository {
  Future<Result<bool>> addUser({required User user});
  Future<Result<String>> getUser({
    required String name,
    required String password,
  });
}
