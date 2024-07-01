import 'package:simo_personal_website/modules/core/models/framework_models/experience/experience_item_model.dart';

import '../models/framework_models/projects/project_item_model.dart';

class ProjectCardData {
  static const workSummary = "Working as a Snr. Mobile Engineer at Discovery - Vitality Global. My focus on is Android, Kotlin, Flutter, and Software Architecture";
  final work = ProjectItemModel(title: "Work", projectName: "Vitality Global", imageUrl: "assets/images/icons/WORK.png", projectSummary: workSummary, projectDetail: workDetail);

  static const pdpSummary =
      "My Personal Development Target for 2024 is to transition into a Mobile Solutions Architect. My focus is on System Design, Android, iOS, Flutter, and Web/ Backend Architecture";
  final pdp = ProjectItemModel(title: "PDP", projectName: "Road to Mobile Solutions Architect", imageUrl: "assets/images/icons/PDP2.png", projectSummary: pdpSummary, projectDetail: pdpDetail);

  static const personalSummary =
      "This is my Personal/ personal company (FideliTech) project where I build personal and client Solutions while leveraging skills gained at Work and on my PDP journey";
  final personal = ProjectItemModel(title: "FideliTech", projectName: "Simo's Website", imageUrl: "assets/images/icons/STARTUP.png", projectSummary: personalSummary, projectDetail: personalProjectDetail);

  static const workDetail = """
  My Journey with Discovery has had me wear multiple hats ranging from Android Mobile App Support, to operating as my Manager's Second in command (2iC), to running the 
  Scrum sessions as a "pseudo-Scrum Master", as well as full-time development for Android, Flutter, and a bit of Flutter. But let me share my current station: Senior Mobile Engineer. 
  
  I work as an Android Developer within a cross-skilled team in Discovery's Vitality Global Organization (VG). We work on a critical Modular component 
  of VG's suite of Applications. This Modular Library (The Health SDK) is natively written in Kotlin and it centralizes a core function of the Vitality Applications.
  
  My day is spent on working on working on new functionality for the SDK, enhancing the existing functionality, bug fixing, as well as engaging in various sessions related to the product 
  including live debug sessions, demonstrations, product training, and support calls etc. I am also involved in documenting and reviewing documentation for the features we work on. I 
  am involved in PR Reviewing as well as Architectural Design discussions.
  
  I have also taken up additional responsibility by adding a Flutter-based library which facilitates the communication of the Native Health SDKs (Android and iOS) with
  Flutter-built applications. This means that we now build a single App in Flutter and leverage the same native libraries without the need to rewrite them in dart. This has had me continuing 
  my work as one of the SMEs on the Native Android SDK while gaining more context on the Swift-based iOS counterpart due to the necessary exposure during the bridge-building process.
  
  My goal at work is to be open to new learning and growth opportunities, to be unafraid of exposing myself to the risks of failing at something new (iOS), and to always put my hand up to assist. 
  
  The Skills I have gained include Android, Kotlin, Flutter, Swift, Software Design, Critical Thinking, Problem Solving, Leadership, Communication, Collaboration, Accountability and Ownership""";

  static const personalProjectDetail = """
  This highlights the details of my current personal/ outside-of-work projects
  
  At this moment, my current project is centered around this website. This is an on-going project I have committed to building as I improve my skills. It is a simple showcase of
  some of my skills, my work, my progress towards some of my goals. I hope to use it as a page on-which I can silently inspire up and coming Developers, or where I can present a glimpse into who 
  I am for any potential future employers/ partners. This is going to be a bit more than just development related. I hope to use it to showcase some of my other projects and endeavours beyond tech.
  It will evolve as time goes and allows. 
  
  I am writing this using Flutter and Dart. I aim to use it as a playground through which I can play with various development tools and widgets. I aim to make it dynamic and make it open to interaction.
  
  I hope it evolves into something people might like.""";

  static const pdpDetail = """
  This portion highlights my Personal Development Plan. It highlights a plan centered mostly around my career as a software developer and the trajectory and direction I plan 
  to take it towards. I am currently a Senior Android/ Mobile Engineer and I enjoy the challenges I get to face as far as my job is concerned. There are mainly 3 designations I have identified
  for this journey, namely, Mobile, Solutions, and Enterprise Architect. 
  
  1) The Mobile Architect.
  Primarily specializes in designing and developing mobile applications using various Mobile Application Development Frameworks with an emphasized responsibility to Develop the architecture
  design for mobile platforms, mainly, iOS and Android while making sure apps meet performance, security, and scalability requirements.
  
  2) The Solutions Architect.
  Involved in the architecting of solutions for business-related problems by analyzing business requirements and translating them into technical solutions. They use their 
  skills to come up with architecturally sound solutions that integrate well with existing solutions.
  
  3) The Enterprise Architect.
  They develop and maintain the overall IT strategy and architecture for an entire organization. They are responsible for creating a high-level IT roadmap aligning IT strategy with business goals.
  They ensure consistency and standardization across the IT landscape as well as providing guidance on decisions on IT investments, standards, and policies.
   
  For 2024, I have set myself a goal of becoming a Competent Mobile Architect and mastering the process of designing Mobile Applications in various ways depending on the specific needs and requirements. I aim to 
  master the design principles that will allow me to build Clean, Robust, Testable, Scalable, and Maintainable Applications. I am building up the requisite fundamentals to become a 
  fully fledged Mobile Architect focussed on creating solutions for iOS and Android using Android, iOS, and Flutter development frameworks""";

}
