import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,size: 40, color:Colors.indigoAccent.shade400,),
                SizedBox(height: 15,),
                Text('Create An Account', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (name) {
                    if(name!.isEmpty){
                      return 'Enter Your Name';
                    }else if(name.length < 3){
                      return "Name should be at least 3 characters long";
                    }
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (email) {
                        if(email!.isEmpty){
                          return 'Enter Your Email';
                        }
                        // if (!RegExp(r'^[\w\._]+@[\w\]+\.\w+$').hasMatch(email)){
                        //   return "Enter a valid email";
                        // }
                        return null;
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obscureText = !obscureText;
                          });
                        }, icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (password) {
                        if(password!.isEmpty || password.length < 6 ){
                          return 'Minimum 6 characters';
                        }
                        return null;
                      }
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your registration is successful")));
                    }
                  }, child: Text("Register", style: TextStyle(fontSize: 18, color: Colors.black),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
