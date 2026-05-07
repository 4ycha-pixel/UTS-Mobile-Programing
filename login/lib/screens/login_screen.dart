import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  String errorMessage = '';

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (emailController.text == 'aisyah@test.com' &&
        passwordController.text == 'Admin123') {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login berhasil')));

      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      setState(() {
        errorMessage = 'Email atau password salah';
      });

      showDialog(
        context: context,

        builder: (context) {
          return AlertDialog(
            title: const Text('Login Gagal'),

            content: Text(errorMessage),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECEFF4),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,

              margin: const EdgeInsets.all(20),

              padding: const EdgeInsets.all(30),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),

                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    /// ICON
                    Container(
                      width: 90,
                      height: 90,

                      decoration: BoxDecoration(
                        color: const Color(0xff111827),

                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// TITLE
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Masuk ke akun Anda untuk melanjutkan",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 35),

                    /// EMAIL
                    CustomTextField(
                      hint: 'Email',

                      icon: Icons.email_outlined,

                      obscureText: false,

                      controller: emailController,

                      validator: Validators.validateEmail,
                    ),

                    const SizedBox(height: 20),

                    /// PASSWORD
                    CustomTextField(
                      hint: 'Password',

                      icon: Icons.lock_outline,

                      obscureText: !isPasswordVisible,

                      controller: passwordController,

                      validator: Validators.validatePassword,

                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),

                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,

                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },

                        child: const Text(
                          'Lupa Password?',
                          style: TextStyle(color: Color(0xff111827)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff111827),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: isLoading ? null : login,

                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
