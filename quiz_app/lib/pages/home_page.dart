import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
     int questionIndex=0;
     bool showResultMessage=false;
     int score=0;
List<Map<String,dynamic>>questionsWithAnswers=[
{
  'question':'Which component allows us to specify the distance between widgets on the screen?',
  'answer':['SafeArea','SizedBox','table','AppBar'],
  'value':['F','T','F','F'],
},

{
  'question':'What is the key configuration file used when building a Flutter project?',
  'answer':['pubspec.yaml','pubspec.xml','config.html',' root.xml'],
  'value':['T','F','F','F'],
},

{
  'question':'How many types of widgets are there in Flutter?',
  'answer':['2','4','6','8'],
  'value':['T','F','F','F'],
},

];
 
 void ResetQuiz(){
    setState(() {
      questionIndex=0;
      score=0;
     showResultMessage=false;
    });
 }
  @override
  Widget build(BuildContext context) {
    final questionsWithAnswer=questionsWithAnswers[questionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        
      ),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(showResultMessage==false)...[
                Padding(
                  padding: const EdgeInsets.all( 20.0),
                  child: Text(
                    questionsWithAnswer['question'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                    for(int i=0;i<questionsWithAnswer['answer'].length;i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: SizedBox(
                        width:300,
                        child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if(questionIndex<questionsWithAnswers.length-1){
                                          
                            questionIndex++;
                          }else{
                              showResultMessage=true;                     
                          }
                          if(questionsWithAnswer['value'][i]=='T'){
                           score++;
                            
                          }
                          });
                          
                        },
                        
                         child:Text(questionsWithAnswer['answer'][i], style: TextStyle(fontSize: 16),)),
                         
                      ),
                    ),
                ],
                if(showResultMessage==true)...[
                  Text(
                    "The End",
                    style:TextStyle(
                       fontSize: 40,
                       fontWeight: FontWeight.bold,
                       color:Color.fromARGB(255, 24, 98, 154)
                    ),
                  ),
                  Text(
                    "Your score is ${score}/${questionsWithAnswers.length}",
                     style:TextStyle(
                       fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                  onPressed: ResetQuiz,
                   child: Text(
                    'Reset Quiz',
                    style: TextStyle(
                    fontSize: 15, 
                    color: Color.fromARGB(255, 76, 148, 202),
                    ),
                    ),
                    ),
                   
                ],
              ]
            )
      ), 
    );
  }
}
