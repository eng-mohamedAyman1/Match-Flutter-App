import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String texts=  "try again";
  int image1Number=  3;
  int image2Number= 7 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:const  Center(
            child:Text(
              "Match pictures",
              )
            ),
          backgroundColor:  Colors.indigo[700],
        ),
        backgroundColor:  Colors.indigo,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
      
            children: [
               Text(
                texts,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300
                ),
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: FilledButton(
                        child: Image.asset('assets/images/image-$image1Number.png'),
                      onPressed: (){
                        setState(() {
                          if(check()) {
                            texts="	congratulations ";
                          }else{
                            // يرجع رقمًا صحيحًا عشوائيًا بين 0 و 9
                            image2Number =  Random().nextInt(9)+1;
                            if(check()) {
                              texts="	congratulations ";
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: FilledButton(
                        child: Image.asset('assets/images/image-$image2Number.png'),
                      onPressed: (){
                          setState(() {
                            if(check()) {
                              texts="	congratulations ";
                            }else{
                              // يرجع رقمًا صحيحًا عشوائيًا بين 0 و 9
                              image1Number =  Random().nextInt(9)+1;
                              if(check()) {
                                texts="	congratulations ";
                              }
                            }
                          });
      
                      },
                    ),
                  ),
                  // Expanded(child: Image.asset('assets/images/image-2.png')),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){
                setState(() {
                  texts=  "try again";
                   image1Number=  3;
                   image2Number= 7 ;
                });
              }, child:Container(
                padding: EdgeInsetsDirectional.symmetric( vertical: 5.0,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
      
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "   New game   ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w200
                  ),
                ),
              ))
            ]
            ),
        ),
      ),
    );
  }
   bool check (){
    if (image1Number==image2Number)return true;
    return false;
   }
}
