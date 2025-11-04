import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool _secureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Email', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 32, 10, 61),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    hintText: 'Mobile number',
                    labelText: 'Mobile Number',
                    suffixIcon: Icon(Icons.mobile_friendly),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 14),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _emailController.clear();
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                    hintText: 'Email address',
                    border: OutlineInputBorder(),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: _secureText,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                      icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),

                    border: OutlineInputBorder(),
                  ),
                  // keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Name: ${_nameController.text}');
                    print('Mobile: ${_mobileController.text}');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                  },
                  child: Text('Click Here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
