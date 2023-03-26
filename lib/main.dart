import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      ChatScreen.id: (context) => ChatScreen(),
    });
  }
}


/*


 * We gonna be building Chat App,Not only It looks beautiful but also going to be super powerful because we are going to power our messanger using Firebase FireStore
 
 ? What We'll Make :
   It has got some beautiful animations that we can look at by building this app 

   ! How we can implement animations in flutter?
    
    ? We are able to create beautiful messanger UI and able to set up group-chats

    ? Implement authentication & Registration so that new users can register & existing users can login into app where they can chat with other users
 
    ?  We had whole bunch of screens such as welcome,login,registration screen,chat screen

     * in order to  able to view screens,first we need to set-up some routes

     * Inside our main.dart file, we are going to add a routes property to our MaterialApp
     
     ! How we can use Named Routes  in our Flutter App to be able to create a map of 4 different routes
       
        1. Welcome
        2. Login
        3. Registration
        4. Chat

        we can set initialRoute as Welcome-Screen,thereby you can see the WelcomeScreen

        ! How to create Named-Routes
    
     * It accepts Map object that has string as key & route-builder object as value
     
    ? To build a route,we create an anonymous function that takes current context as input and returns screen that we want

    ? We have defined all of our routes as key-value pairs in map

    If we use initialRoute,you can't use home property because they do the same & conflict with each other


     ! Welcome-Screen

      * We have  2 buttons ,one for login & other for register

      ? Instead of matching routes with string-names,so why don't we associate these names of the routes with actual screen that's going to point to

      This can be done by creating a property 'id' of type string in their respective screens,so we can avoid providing text by simply refering to it's properties


      We are creating whole new screen just to grab id property everytime but that's not efficient way of doing so


   ! static-keyword

   This can be called only once,so we just modify property to static property

   So,we can access static variables without creating an instance ,simply by using classname

  Static-variables are associated with class

   static modifier can be used to methods as well as variable

 ? There are actually quite a few keywords in Dart that treats special


  * Static keyword allows us to implement class-wide variables & methods

   * Static Variables are also known as Class Variables
   
    The properties which can be shared among all instances of class,then we change those properties to static instead of initializing object,accessing through it

    In order to access class-variables,we don't need to create an instance of it

    *- class_name.property_name

    only static fields can be declared as const if we want to create a constant inside the class,otherwise we usually create global constants (i.e outside the class)

  ? Static methods can't be accessed through an instance
   ? We store an object inside a variable,we use it again & again for various tasks

   * We can by-pass the much of the heavy-lifting
  
  * We create a string at only one place,everywhere else we refer to it 

  ? Refactor routes with static consts similar to how we done with Welcome_Screen


 ? when user presses the button,so that they navigate to the responding screen

  !  Modified hard-coded strings with property id (static modifier attached to it)

 ? If we take a close look at Welcome_Screen.dart file,you can see we got two buttons

 Now,we use Named-Routes & static-consts to implement the navigation functionality for our two buttons on welcome_screen

 * We use static-consts to make our code bit safer
 
?  We can't define the routes in url-format,if you want to do,then you need to specify one of the routes to '/'



 ! Flutter Animations

  It seems like every single app is taking advantage of improved resources of mobile-phones

  Animation makes you pop,jump or rotate & It looks so much flashy & more engaging when we add animations to our app

  * How to create Animations in Flutter ?
 

  We can create delightful experience for the users by incorporating animations


  Android and ios didn't have resources to animate things with ease
  Flutter knows how important animations are in modern apps

 ? It's incredibly easy to add animations

  ! Hero Animations

   It usually takes place around screen-transition

    When we go from screen-1 to screen-2 if they have shared-element,then that element will transition between


    ! What We'll Make
    Login_Screen-Smooth transition of Logo(lightening)


  Create hero animation using Flutter's Hero widget
  Animate the transformation of widget,fly the widget

  Hero-Widget implements style of animation commonly known as shared element transition

  ! To implement Hero-animation,all we need 3 ingredients :
    ?  2X Hero widgets
    ?  A Shared Tag property
    ? Navigator-based Screen Transitions


    * Hero Widget has only one required property-tag,without the tag hero widget won't be able to figure out which other widget for it to animate

    ? Make sure the tag matches with previous tag of hero-widget

     There is no limit to how many hero widgets should have same tag property-value


  !  How to Create Custom Animations

  * AnimatedController to be able to define more complex animations
  
   We looked at really simple out-of-box animation(Hero-Animation)
  
   Things we wanted to happen on the screen

   What we actually wanted to happen with those animations

   ! How Custom-Animation works in Flutter
   Most of the animations that we can be building using Flutter requires 3 things

    ? Ticker - It's bit like ticking of clock

    We need something to able to count and tick our animation along
    For each tick,it changes it's animation value

    ? Animation Controller
    ? Animation Value


 So, for Everytime  of the ticker ticks,it triggers a new set_state so we can render something different on screen

 It's just like flipping through pages of the book

 Animation-Controller is some sort of manager for animation

 It's the animation-controller class which is going  to tell the animation when to start,stop,go forward,look back,how long animation  all of these things need tom specified when we create an animation


This is the thing that actually tells animating

usually animation-value go from 0 to 1

By using these,we are able to change things such as  height,size,color,opacity,outline


In order to create animation,we need to build animation-controller

The time when we want to initialize the animation is when our state-object gets initialized

For any animation-controller,the required property we need to provide is vsync

* What exactly vsync does?

 ? This is where we provide  TickerProviders

  Usually tickerproviders is going to be our state-objects

 You can see Welcome_Screen State inherits from it's parent state widget

 To be able to tell this welcome_screen state into something that can act as Ticker


  ! with SingleTickerProviderStateMixin

   ? We're just upskilling the class with new ability that act as Single-Animation

    If we have mulltiple animations,we mention it as TickerProviderStateMixin
  
   Depending on number of things ,we animate we specify


 * We're essentially using the concept of mixins
 

 ? A mixin enables your class with different types of capabilities

When we want to reference object made from the class in it's own code,we use this keywords
  
  controller.forward()- This is going to proceed our animation forwards
  To able to see what controller is doing,we need to add listeners and listeners which takes a call-back as input


 ! How flutter is able to react to values such as controller.value,we gonna need setState()

 we need to specify what's going to act as ticker to vsync

  There are some other properties in animation-controller like upper_bound,lower_bound

 Instead of having text,we can have loading indicator


 ! Curved-Animation Class
 
  An animation that applies curve to  another animation
   In order to use Curved-Animation,we are going to create a variable of type animation

   ? CurvedAnimation constructor requires  2 properties,one is parent other one is curve
    
    - Parent has to be animation-controller
    - we can specify what type of curve we want to apply

    ! make sure  when you are applying Curved-Animation to your controller  that can't actually have upper_bound >1

    To exaggerate the effect,we multiply it by 100

     What if we want my animation to go in other way from large to small,we can use reverse()

    It's a good idea to specify from property to reverse()

      We can attach methods such as addStatusListener() to our animation,which takes a callback by using this,we can detect when it's going to complete

       ? End of animation-forward-complete
       ? End of animation-reverse-dismissed

       It's really important to tap into dispose() whenever you're using animations to distroy the controller 

   
    ! Tween Animations
     
   It's basically a set of pre-defined tween animations that go in between the values
   Tween-goes from start to end in  a smooth transition
   Any tween takes only two properties,begin & end
   Once we define tween,we are going call animate() ,which returns  an animation which uses these tween

  
*/



/*
    
     ! Dart Mixins

    We need to understand exactly what these mixins are and why do we need them?

   ? Mixins are a way of reusing a class's code in multiple class hierarchies

   ? To use a mixin,use the with keyword followed by one or more mixin names

   In order to understand how mixins works,we can dive into it

   Because we are able to inherit from parent-class

   we can override the methods in sub-class by using @override annotation

   To call the parent-class method,we use super keyword

   ! Dart supports only single-inheritance pattern

    In order to achieve multiple-inheritance feature,we can create a mixin just like how we define interfaces

  *  We incorporate mixins into class using with keyword followed by mixin-name

  ? It doesn't really matter who you inherit from ,even you don't have to inherit from anybody

   You keep the implementation of methods inside mixin

   We add features to class using Mixins

   We can split-out the shared-capability across mixins



    ! Dart Streams


    Everytime,we get a new piece of data when we tap into messages collection,whenever new data going in,we'll get notified in our app


    * What's exactly  these Dart Streams we're using ?


  ? Let's start with an analogy

  Let's imagine that you're in japanese restaurant and you decide you are really fancy of having cuisine

   There are 2 ways of waiting-
   1. Hear all the things that you would like to eat & you make an order & you get the receipt,Once it's ready you are able to collect
   2.Instead of requesting everyting in one go,

As he makes them they get down the belt & you sitting at downstream of conveyor belt will be able to pick pieces of cuisine
 
 You're able to get the data as they come in & as they get added to the stream

We're subscribing our messages to stream,that code lives inside the snapshot

   There are some things that are alredy available & things which you need to wait for
 
  * Streams allow us to listen the data that might get updated at any moment in time,so we can subscribe to the stream by using async..await

 !  We can actually turn stream into Widgets in Flutter using StreamBuilder
   
   ? StreamBuilder is a Widget that builds itself on the latest snapshot of interaction with a Stream

    Widget rebuilding sis cheduled by each inteaction using setState()

  We can use StreamBuilder as we use like any other widget so it goes into our Column

   It has 2 properties that are really important :-
    stream-where's the data it comes from
    builder- We actually need to provide the logic for what the streambuilder actually does(Build Strategy) so it takes snapshot & context as input for the callback
    
    * AsyncSnapshot 
    we can access both data & hasData property that we are using to check whether the snapshot contains a non null data value 
    data: latest data recieved to the asynchronous computation






    
    ! PrePackaged Flutter Animations

    
    If you tap into Flutter packages related to animations,you can seen whole bunch of things that you can use and add instant animation into your app.

     - Sequence
     - Rubber
     - Sprung
     - animated_text_kit

      It has series  of beautiful text animations,we can instantly get these really cool effects

       * How we can use these in our code
        We can change normal text-widget to animated-text widget,we can replace it so easily


    
     We refactor the code again ,learn how to extract widgets & how to work with constants file

      We can separate out the padding widget into Stateless Widget

       * Locate the widget that you want to refactor
       * Make a note of values of the properties that you have set
       * Extract the widget into separate  Stateless Widget called RoundedButton
       * Add three properties to the RoundedButton: a Color variable,string variable for button title,Function variable for thye button's onPressed callback ,we modify it in constructor
       * create a new directory inside lib called components,inside that we create a separate file called round_button.dart
       * We can also extract the widget which is heavily styled let's say in case of InputDecoration and add it to constants
       
       We take part of the styling which is repeated and put it outside the class

       We vary the hintText by using copywith()

    ! Get started by adding Firebase to Flutter Apps

   * Consider our messaging-app like WhatsApp,when user types a message into the app,when you hit send,that message has to be saved somewhere like database

   * So later-on,when user revisit the chat again,we're able to see that message was show up

   ? We're essentially getting data out from database
  
    ? Now,in terms of database we have 2 options
      - We can either save data locally onto user's phone
      - We could put that data into the cloud and save it onto the internet- This is where firebase comes in to make it super easy to save our messaging data & our user details in cloud by using their pre-built methods & classes.

We can actually do whole bunch of things usin g firebase
    
    * Firebase
    * Cloud FireStore
    * Cloud Functions for Firebase
    * Cloud Storage
    * Firebase Authentication
    * Firebase Hosting
    * Firebase Ml kit
    * Firebase Real Time Database
    * App Indexing
    * A/B Testing
    * Firebase cloud messaging
    * firebase dynamic links
    * Firebase In-app messaging
    * Firebase Invites & Predictions,data analytics

    Now,we just leave the project-id & locations

    First,we need to add firebase project into our app

    applicationId is unique across android app store
      
    One of the things that we have to supply,company-name
    Copy the application-id & paste in firebase android-package name
    Firebase is going to look for google-services.json

    * We add firebase sdk in project level build gradle,inside android folder

    ? We just set-up the android & ios firebase project set up

    Ios-Macos + Xcode
    We will modify it inside this folder,we gonna change the bundle identifier & paste it in ios bundler,we add plist file

    * Finally we  are adding Firebase flutter packages to our project set up
    After-all,the reason why we are using firebase is because of we're using their classes & code as starting point

  For ios,in order to set-up firebase flutter packages first we need to install cocoapods

 ! Flutter List-View

  A scrollable list of widgets that arranged linearly

  * ListView is the most commonly used scrolling widget

  It displays it's children one after another in scroll-direction

   Intead of using Column Widgets ,we can use ListView & we are going to wrap ListView inside Expanded widget

    We can improve it's styling & user experiences on the chat-screen by making some changes in ListView & Customized Message Widget
    Instead of just returning box-standard text-widget,we can wrap it inside material widget

    We Register users by using FireBase Auth
    We Authenticate users using FireBase Auth when they login
     
     ? Authorization + Authentication
     
   



*/