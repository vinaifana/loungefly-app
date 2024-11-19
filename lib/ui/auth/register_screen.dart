import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  // const LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final  _passwordController = TextEditingController();
  final FToast fToast = FToast();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    fToast.init(context); 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Jadi, secara keseluruhan, _formKey membantu dalam mengelola dan memvalidasi form dengan cara yang lebih terstruktur dan efisien.
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder()
                ),
                // untuk validasi apakah value yang dimasukan user valid atau tidak (ini juga berguna untuk menampilkan bahwa form ini mandatory atau wajib di isi)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                  return null;
                }
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder()
                ),
                // untuk validasi apakah value yang dimasukan user valid atau tidak (ini juga berguna untuk menampilkan bahwa form ini mandatory atau wajib di isi)
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is Required";
                  }
                  return null;
                }
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder()
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is Required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //if the validation succes it will show the toast
                    fToast.showToast(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "Successfully created an account!",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      gravity: ToastGravity.BOTTOM,
                      toastDuration: const Duration(seconds: 2),
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      '/catalogue'
                    );
                  }
                }, 
                child: const Text("Register")
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/login'
                  );
                }, 
                child: const Text("Already have an account?")
              )
            ],
          )
        ),
      ),
    );
  }
}