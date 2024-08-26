import 'package:fb_auth_riverpod/repositories/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signin_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  @override
  FutureOr<void> build() {}

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading<void>();

    state = await AsyncValue.guard<void>(() => ref
        .read(authRepositoryProvider)
        .signup(name: name, email: email, password: password));
  }
}
