import 'dart-variables.dart';

void main() {
  myfunc() {
    // print(name);
    // We can use "return" to send back a value from the function:
    return "my name is $city";
  }

  // Since we're returning a value above, we need to actually use it — for example, wrap it in a print:
  // print(myfunc());

  // We can also assign the returned value to a variable, like this:
  var things = myfunc();

  // Since we just assigned it, we can now print it:
  print(things);

  // We can also create a function that takes a parameter:
  MYFUNC(String name) {
    // Inside this, we can use $name — it will substitute the provided argument when the function is called:
    return "my name is $name";
  }

  var one = MYFUNC("umer");
  print(one);

  // We can pass multiple parameters to a function as well:
  func(String name1, [name2]) {
    return "the names are $name1 and $name2";
  }

  // Note that we can’t leave one argument empty if Dart expects two.
  // However, we can make parameters optional by wrapping them in square brackets []:
  var ali = func("ali");
  print(ali);

  // Since we didn’t pass the second argument, it will print “ali and null”.
  // This is called an *optional positional parameter*.
  // You can also use curly braces {} to create *named parameters*.

  // When we use named parameters, we must specify which parameter we’re assigning when calling the function.
  // Example:
  funcn(String name1, {name2}) {
    return "the names are $name1 and $name2";
  }

  var alii = funcn("ali", name2: "bill");
  print(alii);

  // You can also leave a named parameter empty.
  // However, it will print “ali and null”.
  // To avoid “null”, you can assign a default value instead.
  umer(String name1, {name2 = "Friends"}) {
    // This assigns a default value to the parameter.
    // So if no value is provided, it will use "Friends" instead of null.
    return "the names are $name1 and $name2";
    // If you provide a value for name2, it will override the default "Friends" value.
  }

  var hamdan = umer("ali");
  print(hamdan);
}
