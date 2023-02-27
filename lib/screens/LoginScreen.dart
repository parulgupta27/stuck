import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/utils/auth_methods.dart';
import 'package:stuck/widgets/RoundedButton.dart';
import 'package:stuck/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool isLoading=false;
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
Size screensize=Utils().getScreenSize();
    return Scaffold(
      body: SafeArea(
         child: Center(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 SizedBox(height: 10,),
                 CircleAvatar(
                   backgroundColor: Colors.grey,
                   radius: 35,
                   child: CircleAvatar(
                     backgroundImage: AssetImage('assets/Images/boy1.png'),
                     radius: 32,
                   ),
                 ),
                 SizedBox(height: 40,),
                 Container(
                   height: screensize.height*0.42,
                   width: screensize.width*0.8,
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.black,width: 1),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       children: [
                         CustomTextField(
                             emailController,
                             "Enter Your Email",
                             Icons.email_outlined,
                             false,
                         ),
                         SizedBox(height: 20,),
                         CustomTextField(
                           passwordController,
                           "Enter Your Password",
                           Icons.security,
                           true,
                         ),
                         SizedBox(height: 20,),

                         SizedBox(
                           width: screensize.width*0.6,
                           child: RoundedButton(
                             label:isLoading? CircularProgressIndicator(color: Colors.white,):Text("Login"),
                             callback: ()async{

                               isLoading=true;
                               setState(() {

                               });
                               String res=await AuthMethod().signInUser(emailController.text, passwordController.text);
                               Utils().showSnackBar(context: context, content: res);
                               if(res=="Success")
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomTabScreen()));
                               setState(() {
                                 isLoading=false;
                               });
                             },
                           ),
                         ),
                         TextButton(onPressed: (){}, child:Text("Forgot Password")),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 40,),
                 Row(
                   children: [
                     Expanded(child: Container(height: 1,color: Colors.grey,)),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("Don't Have An Account?"),
                     ),
                     Expanded(child: Container(height: 1,color: Colors.grey,)),
                   ],
                 ),
                 SizedBox(height: 20,),

                 SizedBox(
                   width: screensize.width*0.6,
                     child: RoundedButton(
                         label: Text(" Sign Up"), callback:(){})),
                 SizedBox(height: 20,),


               ],
             ),
           ),
         ),
      ),
    );
  }
}
