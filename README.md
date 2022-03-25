# booba 2.0

This project is meant as a learning experience, and not for production by any means. However, it is open-source so feel free to use it however you like.

I'm still not settled on a certain folder structure, I will also be learning other stuff as I work on this project so if I learn something new I may or may not replace a previous approach or simply just start using the new approach from that point onwards, and that might cause some inconsistencies in the code, but for now it's okay.

## Table of contents
- [What I learned](#what-i-learned)
- [GetX](#getx)
  - [Navigation](#navigation)
  - [State Management](#state-management)
    - [on update](#on-update)
    - [Reactive](#reactive)
  - [More GetX features](#more-getX-features)

# what I learned
  - [incorrect use of parent widget](https://bit.ly/3iP4Pv7)

# GetX

GetX is a state management solution, it also offers navigation methods that avoid the redundant boilerplate code of the built-in navigation system in flutter

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
  >WARNING, consider using: "Get.offAll(() => Page())" instead of "Get.offAll(Page())".
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

> This is kind of similar to `ChangeNotifier` from the `Provider` package which essentially allows you to notify listeners whenever you call the `notifyListeners()` method or in this case `update()`

> similar to `Provider` where you have to extend the class with `ChangeNotifier` you have to make it extend `GetXController`

- When instantiating an object from some class that extends `GetXController` you have to "inject" it using the `Get.put()` method
  
  
  
  ```dart
  /// example
  final CountController countController = Get.put(CountController());
  ```

or alternatively, instead of initializing the controller yourself, you can do that within the `GetBuilder` and to refer to it later in the co de you can, simply use `Get.find<countController>.(increment())`

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

if you had some screen or widget where you inject some controller, you can simple make another class that extends `Bindings` and use `Get.lazyPut<SomeController>(() => SomeController());` within the `dependancies` method override to automatically inject it whenever the widget is built. now, to bind the binding that you've defined you have to bind it to the actual route ( assuming you're working with named routes ). /// "Bind bind bind bind" 🙃
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