# booba 2.0

![cat_draw3](https://user-images.githubusercontent.com/92385434/165200803-26d1417b-67ef-4e6d-8aa4-e31168adaa0b.png)

This project is meant as a learning experience, and not for production by any means.

I'm still not settled on a certain folder structure, I will also be learning other stuff as I work on this project so if I learn something new I may or may not replace a previous approach or simply just start using the new approach from that point onwards, and that might cause some inconsistencies in the code, but for now it's okay.

I am aware of some bugs to be fixed and some improvements to be made.

> I may or may not finish all the screens from the design draft in the next 10yrs ( https://www.figma.com/file/5q9LcASFlXNBV0YiFUhPx7/booba-v2?node-id=503%3A2097 )

## Table of contents

- [Platforms](#platforms)
- [Installation](#installation)
- [What I learned](#what-i-learned)
- [GetX](#getx)
  - [Navigation](#navigation)
  - [State Management](#state-management)
    - [on update](#on-update)
    - [Reactive](#reactive)
  - [More GetX features](#more-getX-features)
- [Attributes](#attributes)

# Platforms

- android
  
  > it can be built for IOS as well. <br>

![CODE-MOBILE](https://user-images.githubusercontent.com/92385434/166739362-c41b971f-b0ad-41c6-8677-73d967710617.png)

  > **deprecated. web version:** <br>
  > ![CODE-WEB](https://user-images.githubusercontent.com/92385434/166865254-1fe47f5a-2716-4b8c-8e6f-8af547141f5c.png)


# Installation

- Download the (.apk) file from the release section.

# what I learned

- [incorrect use of parent widget](https://bit.ly/3iP4Pv7)

- To preserve the state of a page when switching to another one from e.g. a navigation bar, an [IndexedStack]
  since the widgets don't get popped out of the stack, the state of the page is thus reserved. [read more](https://bit.ly/3J6p4PA)
  
  ```dart
  /// Example
  IndexedStack(
  index: _selectedIndex,
  children: _pages)
  ```
  
  > I'm not sure if they fixed this, but obviously it can be a performance drain because stuff in other pages that are not currently in use don't lose focus e.g. a [TextField] would still receive input and animations would still be running. But again, this may or may not have been fixed. [Github-Issue](https://github.com/flutter/flutter/issues/61659)

- [color] property has been deprecated and [backgroundColor] should be used instead

- `Get.back()` doesn't throw any errors or weird behaviors if there is no previous page in the stack, not sure how the built-in navigation would behave in that case, might have to try.

- When updating the value of a firestore list, to preserve the original data, `FieldValue.arrayUnion` can be used.

- `ShaderMask` [Widget of the week](https://youtu.be/7sUL66pTQ7Q), [Stackoverflow](https://stackoverflow.com/questions/51686868/gradient-text-in-flutter)

## As-You-Type Formatting

> [Format as You Type - Input Formatting in Flutter - YouTube](https://youtu.be/4v4l6E8Sbj8)
> 
> [TextInputFormatter class - services library - Dart API](https://api.flutter.dev/flutter/services/TextInputFormatter-class.html)

- Built-in implementations of `TextInputFormatter` :
  
  - `LengthLimitingTextInputFormatter`
  
  - `FilteringTextInputFormatter.allow`
  
  - `FilteringTextInputFormatter.deny`

- Build one yourself
  
  - Custom class that extends `TextInputFormatter` and implements the `formatEditUpdate` method
    
    <!-- TODO continue writing about this -->

# GetX

GetX is a state management solution, it also offers navigation methods that avoid the redundant boilerplate code of the built-in navigation system in flutter

> [Get life cycle](https://bit.ly/3r8WQNS)
> [really good insight about dependency injection in GetX](https://bit.ly/3jbhU1E)

## Navigation

> `GetX-Implementation`

> ```dart
> usual flutter implementation
> ```

- `Get.to(Page());`||`navigator.push(MaterialPageRoute(builder: (context) => Page()));`
  
  ```dart
  Navigator.push(context, MaterialPageRoute(builder: (context) => Page()));
  /// or 
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page()));
  ```

- `Get.off(Page());`
  
  ```dart
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page()));
  /// or
  ...
  ```

- `Get.ofAll(Page());`
  
  ```dart
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Page()), (route) => false);
  /// or
  ...
  ```
  
  > WARNING, consider using: "Get.offAll(() => Page())" instead of "Get.offAll(Page())".
  > 
  >       Using a widget function instead of a widget fully guarantees that the widget and its controllers will be removed from memory when they are no longer used.

- `Get.back(result = "some result");`
  
  ```dart
  Navigator.of(context).pop('some result');
  /// or
  ...
  ```

> [dart - Flutter Back button with return data - Stack Overflow](https://stackoverflow.com/questions/51927885/flutter-back-button-with-return-data#:~:text=To%20return%20data%20to%20the,the%20Future%20in%20the%20SelectionButton.)

- `GetPage(name: '/', page: () => Home()), --> Get.toNamed('/'); // you can also pass arguments!`
  
  ```dart
  ...
  ```

- `Get.snackbar('title', 'content');`
  
  ```dart
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(...));
  ```

- `Get.defaultDialog(title: 'title', content: Text('content'));`
  
  ```dart
  showDialog(context: context, builder:(context) => Widget);
  ```

- `Get.bottomSheet(Widget);`
  
  ```dart
  showModalBottomSheet(context: context, builder: (context) => Widget);
  ```

## State Management

### Types of State Management in GetX

- Reactive: GetX, Obx

- on update: GetBuilder ( simples + consumes less RAM than Reactive )

> There is also kind of mix of both: MixinBuilder

#### on update

> This is kind of similar to `ChangeNotifier` which essentially allows you to notify listeners whenever you call the `notifyListeners()` method or in this case `update()`

> It is also similar where you have to extend the class with `ChangeNotifier` you have to make it extend `GetXController`

- When instantiating an object from some class that extends `GetXController` you have to "inject" it using the `Get.put()` method

> **"** note : If you want multiple instances of a single Controller class, you would be able to pass a unique tag parameter in `Get.put` or `Get.lazyPut` or in the GetBuilder or GetX widget to uniquely define the Controller and then in the child widgets or anywhere you want to find it use that unique tag to identify which one do you want. **"**[source](https://bit.ly/3uAM97O)
>   ]

> what `Get.lazyput` does differently, is that it won't instantiate and allocate the memory for the instance **until** you try to access it somewhere.

```dart
/// example
final CountController countController = Get.put(CountController());
```

or alternatively, instead of initializing the controller yourself, you can do that within the `GetBuilder` and to refer to it later in the code you can, simply use `Get.find<countController>.(increment())`

> ? but what if we had multiple controllers of the same type

```dart
GetBuilder(
    init: CountController(),
    builder: (_) => Text('current count value: ${_.count}')
)
```

#### Reactive

- you can declare a variable or an object as observable using `.obs` ( given that you made the class extend `GetXController` ) and anything that listens to that observable will be rebuilt automatically on change.

- to observe a controller you can simply use
  
  ```dart
  GetX(
      init: CountController(),
      builder: (_) => Widget
  )
  ```

> **Obx**
> 
> you can think of `Obx` as  a lightweight `GetX` if you e.g. need only the builder

> **Workers**
> 
> you would declare workers in the `onInit` method of the controller. 
> 
> ```dart
> final count1 = 0.obs;
> final count2 = 0.obs;
> 
> increment1() => count1.value++;
> increment2() => count2.value++;
> 
> int get sum => count1.value + count2.value; 
> 
> 
> @override
> void onInit(){
>     super.onInit();
> 
>     /// Workers
>     ever(count1, () => print('count1 has been changed'));
> 
>     once(count1, () => print('First time count1 is changed'));
> 
>     debounce(count1, () => print('count1 hasn\'t been changed for 1sec'),
>         time: Duration(seconds: 1));
> 
>     interval(count1, () => print('every 1sec count1 is changed'),
>         time: Duration(seconds: 1));
> }
> ```

## more GetX features

### Transitions

`GetMaterialApp` => `defaultTransition` 

### [Internationalization](https://adityaajoshi.medium.com/internationalization-in-flutter-using-getx-6d715f6b1c82)

### Binding

if you had some screen or widget where you inject some controller, you can simply make another class that extends `Bindings` and use `Get.lazyPut<SomeController>(() => SomeController());` within the `dependancies` method override to automatically inject it whenever the widget is built. now, to bind the binding that you've defined you have to bind it to the actual route ( assuming you're working with named routes ). /// "Bind bind bind bind" 🙃

### Validation! 🌟 /// no more LulzValidation 🤤

e.g. `GetUtils.isEmail()`. simple as that, no regex no nothing :D

### Storage! 🌟

> Same GetX developers, [get_storage package](https://pub.dev/packages/get_storage)

I think it's similar to `SharedPreferences` ? but basically you can store or persist some data on the storage for other sessions.

1. initialize in main before running the `GetMaterialApp`, using `await GetStorage.init();` 

2. to use the storage either `read` or `write`, first of all make an instance e.g. `GetStorage myStorage = GetStorage();` and then provide the `key` and `value` simple.

### Change Theme

e.g. `Get.changeTheme(ThemeData.light);` 

### Environment Information! 🌟

instead of importing `dart:io show Platform` you can simply check for platform e.g. `GetPlatform.isIOS` 

> ? Check to see if checking e.g. `GetPlatform.isIOS` crash the app on a web platform just like `Platform.isIOS` does

Instead of using `MediaQuery.of(context).size.height` to get the current height of the screen, you can simply use `Get.height` 

YEP :D 
instead of importing `dart:io show Platform` you can simply check for platform e.g. `GetPlatform.isIOS` 

> ? Check to see if checking e.g. `GetPlatform.isIOS` crash the app on a web platform just like `Platform.isIOS` does

Instead of using `MediaQuery.of(context).size.height` to get the current height of the screen, you can simply use `Get.height` 

YEP :D 

# Attributions

- [Cloud vectors](https://www.vecteezy.com/free-vector/cloud)
- [Cartoon vectors](https://www.vecteezy.com/free-vector/cartoon)
- [Sticker Vectors](https://www.vecteezy.com/free-vector/sticker)
- [Christmas food stickers](https://www.vector4free.com/set-of-christmas-food-stickers)
- [Ball Vectors](https://www.vecteezy.com/free-vector/ball)
- [Love You Vectors](https://www.vecteezy.com/free-vector/love-you)
- Landing page 1 illustration: Illustration by **Rosina Gavrilash** from Ouch!
- Landing page illustrations: Illustration by **Icons 8** from Ouch!
- [Splash screen bongoTap](https://betterttv.com/emotes/5ba6d5ba6ee0c23989d52b10)
