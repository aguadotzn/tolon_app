import '../../../services/login/LoginService.dart';
import '../../../services/login/MockLoginService.dart';
import '../page/ILoginPage.dart';
import '../repository/LoginRepository.dart';
import 'LoginPageViewModel.dart';

class LoginViewModelInjector {
  static LoginPageViewModel injectMockViewModel(ILoginPage view) =>
      LoginPageViewModel(
          repository: LoginRepository(service: MockLoginService()), view: view);
  static LoginPageViewModel injectViewModel(ILoginPage view) =>
      LoginPageViewModel(
          repository: LoginRepository(service: LoginService()), view: view);
}
