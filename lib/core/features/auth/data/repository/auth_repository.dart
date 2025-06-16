import 'package:keja_hunt/core/features/auth/data/mixins/auth_mixin.dart';
import 'package:keja_hunt/core/features/auth/data/mixins/login_mixin.dart';
import 'package:keja_hunt/core/features/auth/data/mixins/signup_mixin.dart';

class AuthRepository with AuthMixin, LoginMixin, SignUpMixin {}

