import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_up_screen.dart';
import 'package:rick_and_morty_app/screens/widgets/custom_bottom_bar.dart';
import 'package:rick_and_morty_app/screens/widgets/sign_in_button.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({Key? key}) : super(key: key);

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: SizedBox(
                  width: 267.83,
                  height: 376.22,
                  child: Image.asset('assets/images/avtorization.png'),
                ),
              ),
              Text(
                'Логин',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8507,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffF2F2F2),
                ),
                child: TextField(
                  controller: loginController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xff5B6975),
                    ),
                    border: InputBorder.none,
                    hintText: 'Логин',
                    hintStyle: TextStyle(
                      color: Color(0xff5B6975),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Пароль',
                style: TextStyle(
                  color: Color(0xff212121),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8507,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffF2F2F2),
                ),
                child: TextField(
                  controller: passwordController,
                  obscuringCharacter: '*',
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xff5B6975),
                    ),
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(
                            'assets/images/lock.png',
                            color: Color(0xff5B6975),
                          ),
                        ),
                      ],
                    ),
                    border: InputBorder.none,
                    hintText: 'Пароль',
                    hintStyle: TextStyle(
                      color: Color(0xff5B6975),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                  bloc: authBloc,
                  listener: (context, state) {
                    if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error.message!)));
                    }
                    if (state is AuthFetchedState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => CustomBottomBar())));
                      loginController.clear();
                      passwordController.clear();
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return SignInButton(
                      text: 'Войти',
                      onTap: () => authBloc.add(AuthSignInEvent(
                          login: loginController.text,
                          password: passwordController.text)),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'У вас ещё нет аккаунта?',
                    style: TextStyle(
                      color: Color(0xff5B6975),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: const Text(
                      'Создать',
                      style: TextStyle(
                        color: Color(0xff43D049),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
