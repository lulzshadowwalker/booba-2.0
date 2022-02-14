# booba 2.0

This project is meant is a learning experience, and not for production by anymeans. However, it is open-source so feel free to use it however you like.

I'm still not settled on a certain folder structure, I will also be learning other stuff as I work on this project so if I learn something new I may or may not replace a previous approach or simply just start using the new approach from that point onwards, and that might cause some inconsistencies in the code, but for now it's okay.

## Table of contents

- [GetX](#getx)

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
  Navigator.of(context).push( MaterialPageRoute(builder: (context) => Page()));
  ```
  
- `Get.off(Page());`
  
  ```dart
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page()));
  /// or
  Navigator.of(context).pushReplacement(context, MaterialPageRoute(builder: (context) => Page()));
  ```
  
- `Get.ofAll(Page());`
  
  ```dart
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Page()), (route) => false);
  /// or
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Page()), (route) => false);
  ```
  
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
  final CountController countController = Get.put(CounterController());
  ```
  

or alternatively, instead of initializing the controller yourself, you can do that within the `GetBuilder` and to refer to it later in the co de you can, simply use `Get.find<countController>.(increment())`

> ? but what if we had multiple controllers of the same type

```dart
GetBuilder(
    init: CountController(),
    builder: (_) => Text('current count value: ${_.count}')
)
```