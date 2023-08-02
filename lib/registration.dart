import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import 'package:auto_size_text/auto_size_text.dart';

//import 'Login.dart';
class TeacherDetails extends StatefulWidget {
  const TeacherDetails({Key? key}) : super(key: key);

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
   final TextEditingController rollno=TextEditingController();

  final TextEditingController universityController = TextEditingController();
  final FocusNode univf = FocusNode();
  List<dynamic> university = [ ];

  final TextEditingController collegeController = TextEditingController();
  final FocusNode colf = FocusNode();
  List<dynamic>  college= [ ];
  final TextEditingController courseController = TextEditingController();
  final FocusNode corsef = FocusNode();
  List<dynamic> course = [ ];

  final TextEditingController yearController = TextEditingController();
  final FocusNode yearf = FocusNode();
  List<String> year = ['1', '2', '3', '4','5'];


  final TextEditingController branchController = TextEditingController();
  final FocusNode branchf = FocusNode();
  List<dynamic> branch = [];



  final TextEditingController sectionController = TextEditingController();
  final FocusNode sectionf = FocusNode();
  List<String> section = ['A', 'B', 'C', 'D','E'];

 List <TextEditingController> subjectlist=[TextEditingController()] ;
   List <FocusNode> subjectf = [FocusNode()];
   List<dynamic> subjects = [];

   List<String> subject=[];


@override
  void initState() {
    // TODO: implement initState
  fetchuniversity();
    super.initState();
  }
//ar firebaseDB= FirebaseFirstore.instance.collection("").doc("").Snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 20,
      //   automaticallyImplyLeading: true,
      //   centerTitle: true,
      //   title:AnimatedTextKit(
      //     animatedTexts: [
      //       WavyAnimatedText(
      //         "Student Details",
      //
      //         textStyle:GoogleFonts.openSans(
      //           color: Colors.amber,
      //           fontSize: 25,
      //           fontWeight: FontWeight.w900,
      //           shadows: [
      //             const Shadow(
      //               color:Colors.black,
      //               offset:Offset(1, 1),
      //               blurRadius: 5,
      //
      //             ),
      //           ],
      //         ),
      //
      //       ),
      //
      //     ],
      //     repeatForever: true,
      //     isRepeatingAnimation: true,
      //   ),
      //   backgroundColor: Colors.black87,
      // ),
      body: Container(
        height: size.height * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(

            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      "Student Details",

                      textStyle:GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          const Shadow(
                            color:Colors.black,
                            offset:Offset(1, 1),
                            blurRadius: 5,

                          ),
                        ],
                      ),

                    ),

                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),

                SizedBox(height: size.height * 0.02),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: rollno,
                    decoration: const InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        hintText: "Enter Roll No.",
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide(color: Colors.amber, width: 3),
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            borderSide:
                                BorderSide(width: 2, color: Colors.amber)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        )),
                    style: const TextStyle(color: Colors.amber),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: universityController,
                    focusNode: univf,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        university.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "University",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {
                      print(value.searchKey);
                      print(universityController.text.toString());

                      setState(() {
                        fetchcollege(universityController.text.toString());
                      });
                      FocusScope.of(context).requestFocus(colf);

                    },
                    enabled: true,
                    hint: "University",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: collegeController,
                    focusNode: colf,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        college.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "College",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {

                      print(value.searchKey);
                      print(courseController.text.toString());
                      setState(() {
                        fetchcourse(collegeController.text.toString());
                      });

                      FocusScope.of(context).requestFocus(corsef);

                    },
                    enabled: true,
                    hint: "College",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: courseController,
                    focusNode: corsef,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        course.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "Course",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {

                      print(value.searchKey);
                      print(courseController.text.toString());
                      setState(() {
                        fetchbranch(courseController.text.toString());
                      });

                      FocusScope.of(context).requestFocus(yearf);

                    },
                    enabled: true,
                    hint: "Course",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: yearController,
                    focusNode: yearf,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        year.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "Year",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {
                      print(value.searchKey);
                      print(universityController.text.toString());


                      FocusScope.of(context).requestFocus(branchf);

                    },
                    enabled: true,
                    hint: "Year",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: branchController,
                    focusNode: branchf,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        branch.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "Branch",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {
                      print(value.searchKey);

                      setState(() {
                        fetchsubject(branchController.text.toString());
                      });
                      FocusScope.of(context).requestFocus(sectionf);
                    },
                    enabled: true,
                    hint: "Branch",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchField(
                    controller: sectionController,
                    focusNode: sectionf,
                    suggestionItemDecoration: SuggestionDecoration(),
                    key: const Key("Search key"),
                    suggestions:
                        section.map((e) => SearchFieldListItem(e)).toList(),
                    searchStyle: GoogleFonts.openSans(
                        color: Colors.amber,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                    suggestionStyle: GoogleFonts.openSans(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    marginColor: Colors.amber,
                    suggestionsDecoration: SuggestionDecoration(
                        color: const Color.fromRGBO(3, 74, 140, 1),
                        //shape: BoxShape.rectangle,
                        padding: const EdgeInsets.all(10),
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.circular(0)),
                    searchInputDecoration: InputDecoration(
                        hintText: "Section",
                        fillColor: Colors.black,
                        filled: true,
                        hintStyle: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusColor: Colors.amber,
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onSuggestionTap: (value) {
                      print(value.searchKey);
                      print(universityController.text.toString());

                      //FocusScope.of(context).requestFocus(subjectf);


                    },
                    enabled: true,
                    hint: "Section",
                    itemHeight: 50,
                    maxSuggestionsInViewPort: 3,
                  ),
                ),

                Container(
                  height: size.height*0.13*subjectlist.length,
                  width: size.width*1,
                  color: Colors.transparent,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subjectlist.length,
                          shrinkWrap: true,
                      itemBuilder:(context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(
                                child:  SearchField(
                                 //focusNode:subjectf[index],
                                  controller: subjectlist[index],


                                  suggestionItemDecoration: SuggestionDecoration(),
                                  key: const Key("Search key"),
                                  suggestions:
                                  subjects.map((e) => SearchFieldListItem(e)).toList(),
                                  searchStyle: GoogleFonts.openSans(

                                      color: Colors.amber,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800),
                                  suggestionStyle: GoogleFonts.openSans(
                                    color: Colors.amber,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  marginColor: Colors.amber,
                                  suggestionsDecoration: SuggestionDecoration(
                                      color: const Color.fromRGBO(3, 74, 140, 1),
                                      //shape: BoxShape.rectangle,
                                      padding: const EdgeInsets.all(10),
                                      border: Border.all(width: 2, color: Colors.amber),
                                      borderRadius: BorderRadius.circular(0)),
                                  searchInputDecoration: InputDecoration(
                                      suffixIcon: SizedBox(
                                        width: size.width*0.25,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(onPressed: (){
                                              setState(() {
                                                //print(subjectlist[index].text.toString());
                                                subjectlist.add(TextEditingController());

                                              });
                                              FocusScope.of(context).requestFocus(subjectf[index]);
                                            },
                                              icon: const Icon(Icons.add),
                                              color: Colors.amber,
                                              iconSize: size.height*0.04,
                                            ),
                                            IconButton(onPressed: (){
                                              setState(() {
                                                if(index!=0){
                                                  subjectlist.removeAt(index);
                                                }
                                              }
                                              );
                                            },
                                              icon: const Icon(Icons.delete),
                                              color: Colors.amber,
                                              iconSize: size.height*0.04,
                                            )
                                          ],
                                        ),
                                      ),
                                      hintText: "Enter Subject Name",
                                      fillColor: Colors.black,
                                      filled: true,
                                      hintStyle: GoogleFonts.openSans(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.amber,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusColor: Colors.amber,
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.amber,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.amber,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      )),
                                  onSuggestionTap: (value) {
                                    print(value.searchKey);
                                FocusScope.of(context).removeListener;


                                  },
                                  enabled: true,
                                  hint: "Enter subject Name",
                                  itemHeight: 50,
                                  maxSuggestionsInViewPort: 3,


                                ),
                                // TextFormField(
                                //   controller:subjectlist[index],
                                //   decoration:  InputDecoration(
                                //
                                //     fillColor: Colors.black,
                                //     filled: true,
                                //     hintText: "Enter Subject Name",
                                //     hintStyle: const TextStyle(color: Colors.grey),
                                //     enabledBorder: const OutlineInputBorder(
                                //       borderRadius: BorderRadius.all(
                                //         Radius.circular(30),
                                //       ),
                                //       borderSide: BorderSide(color: Colors.amber, width: 3),
                                //     ),
                                //     disabledBorder: const OutlineInputBorder(
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(30),
                                //         ),
                                //         borderSide:
                                //         BorderSide(width: 2, color: Colors.amber)),
                                //     focusedBorder: const OutlineInputBorder(
                                //       borderSide: BorderSide(color: Colors.amber, width: 3),
                                //       borderRadius: BorderRadius.all(
                                //         Radius.circular(30),
                                //       ),
                                //     ),
                                //     suffixIcon: SizedBox(
                                //     width: size.width*0.25,
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       children: [
                                //         IconButton(onPressed: (){
                                //           setState(() {
                                //             //print(subjectlist[index].text.toString());
                                //             //subjectlist.add(TextEditingController());
                                //           });
                                //         },
                                //           icon: const Icon(Icons.add),
                                //           color: Colors.amber,
                                //           iconSize: size.height*0.04,
                                //         ),
                                //         IconButton(onPressed: (){
                                //           setState(() {
                                //             if(index!=0){
                                //               //subjectlist.removeAt(index);
                                //             }
                                //           }
                                //           );
                                //         },
                                //           icon: const Icon(Icons.delete),
                                //           color: Colors.amber,
                                //           iconSize: size.height*0.04,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                //   ),
                                //   style: const TextStyle(color: Colors.amber),
                                //
                                // ),
                              ),
                              // suffixIcon: SizedBox(
                              //   width: size.width*0.25,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       IconButton(onPressed: (){
                              //         setState(() {
                              //           //print(subjectlist[index].text.toString());
                              //           //subjectlist.add(TextEditingController());
                              //         });
                              //       },
                              //         icon: const Icon(Icons.add),
                              //         color: Colors.amber,
                              //         iconSize: size.height*0.04,
                              //       ),
                              //       IconButton(onPressed: (){
                              //         setState(() {
                              //           if(index!=0){
                              //             //subjectlist.removeAt(index);
                              //           }
                              //         }
                              //         );
                              //       },
                              //         icon: const Icon(Icons.delete),
                              //         color: Colors.amber,
                              //         iconSize: size.height*0.04,
                              //       )
                              //     ],
                              //   ),
                              // ),

                            ],
                          ),
                        );
                      },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SizedBox(
                  width: size.width*0.9,
                  height: size.height*0.065,

                  child: ElevatedButton(
                    onPressed: ()
                    async {
                    for(int i=0;i< subjects.length;i++){

                      subject.add(subjects[i].toString());
                }

                    try {

                      await FirebaseFirestore.instance.collection("Demo").doc(
                          "xyz").set(

                          {
                            "Rollnumber": rollno.text.trim().toString(),
                            "University": universityController.text.trim().toString(),
                            "College": courseController.text.trim().toString(),
                            "Course": courseController.text.trim().toString(),
                            "Year": yearController.text.trim().toString(),
                            "Branch": branchController.text.trim().toString(),
                            "Section": sectionController.text.trim().toString(),
                            "Subject": subject,


                          }
                      );
                    } on FirebaseException catch (e) {
                      print("\n\n" + e.toString() + "\n \n\n");
                    }
                    print("Successfully Submitted");
                  },


                    style: ElevatedButton.styleFrom(
                        shape:const StadiumBorder(),
                      backgroundColor: Colors.amber,

                    ),
                      child: AutoSizeText("Submit",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            color: Colors.black,
                            shadows:[
                              const Shadow(color: Colors.red,
                                  blurRadius: 5,
                                  offset: Offset(1,1),
                              ),
                            ] ,


                        ),


                      ),

                  ),
                ),
                SizedBox(height: size.height * 0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }

fetchuniversity() async {
  final ref= await  FirebaseFirestore.instance.collection("University").doc("University").get();
  university=ref.data()!["University"];
}


fetchcollege(String uni) async {
  final ref= await  FirebaseFirestore.instance.collection("Colleges").doc(uni).get();
  setState(() {
    college= ref.data()!["Colleges"];
    print(college);
  });
}
  fetchcourse(String coll) async {
    final ref= await  FirebaseFirestore.instance.collection("Course").doc(coll).get();
   setState(() {
     course= ref.data()!["Course"];
   });
  }

  fetchbranch(String cou) async {
    final ref= await  FirebaseFirestore.instance.collection("Branch").doc(cou).get();
    setState(() {
      branch= ref.data()!["Branch"];
    });
  }

  fetchsubject(String branch) async {
    final ref= await  FirebaseFirestore.instance.collection("Subject").doc(branch).get();
    setState(() {
      subjects= ref.data()!["Subject"];
    });
  }



}

