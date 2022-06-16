import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:rick_and_morty_app/screens/widgets/custom_bottom_bar.dart';
import 'package:rick_and_morty_app/screens/widgets/custom_textfield.dart';
import 'package:rick_and_morty_app/screens/widgets/sign_in_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController patronyMicController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(
              context,
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0A1B28),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Создать аккаунт',
                style: TextStyle(
                  color: Color(0xff0A1B28),
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                text: 'Имя',
                text2: 'Имя',
                textController: nameController,
              ),
              CustomTextfield(
                text: 'Фамилия',
                text2: "Фамилия",
                textController: surNameController,
              ),
              CustomTextfield(
                text: 'Отчество',
                text2: "Отчество",
                textController: patronyMicController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Text(
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
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return SignInButton(
                          onTap: () {
                            authBloc.add(AuthSignUpEvent(
                              name: nameController.text,
                              surname: surNameController.text,
                              patronyMic: patronyMicController.text,
                              login: loginController.text,
                              password: passwordController.text,
                            ));
                          },
                          text: 'Создать',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
