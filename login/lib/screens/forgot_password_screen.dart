import 'package:flutter/material.dart';
import '../utils/validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  bool isLoading = false;

  Future<void> sendResetLink() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Link reset telah dikirim')));
  }

  @override
  void dispose() {
    emailController.dispose();
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
                        Icons.lock_reset,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// TITLE
                    const Text(
                      "Lupa Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Masukkan email Anda",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 35),

                    /// EMAIL
                    TextFormField(
                      controller: emailController,

                      validator: Validators.validateEmail,

                      decoration: InputDecoration(
                        hintText: 'Masukkan Email',

                        prefixIcon: const Icon(Icons.email_outlined),

                        filled: true,

                        fillColor: const Color(0xffF3F4F6),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),

                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),

                          borderSide: BorderSide.none,
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),

                          borderSide: const BorderSide(
                            color: Color(0xff111827),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// RESET BUTTON
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

                        onPressed: isLoading ? null : sendResetLink,

                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Kirim Link Reset',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BACK BUTTON
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        'Kembali ke Login',

                        style: TextStyle(color: Color(0xff111827)),
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
