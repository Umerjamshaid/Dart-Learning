void main() {
  //lists

  var mylist = [1, 2, 3];
  print(mylist);
  print(mylist[0]);

  //   change item in the list
  mylist[0] = 20;
  print(mylist);

  //  create an empty lists
  var emptylist = [];
  print(emptylist);

  // add to empty list
  emptylist.add(29);
  print(emptylist);

  //   add multuple items to an empty list
  emptylist.addAll([1, 2, 3, 4, 4, 5]);
  print(emptylist);

  // insert at specific positions (positions(or index), item (the new item you wana put))
  mylist.insert(2, 200);
  print(mylist);

  //insertmany
  mylist.insertAll(2, [99, 100, 101]);
  print(mylist);

  // mix lists
  var mixedlist = [
    100,
    200,
    300,
    'umer',
    'usman',
    'ali',
    3.4,
    45.6,
    true,
    false,
  ];
  print(mixedlist);

  //   REMOVE FROM THE LIST:
  mixedlist.remove('umer');
  print(mixedlist);

  //   remove feom spesific position
  mixedlist.removeAt(4);
  print(mixedlist);
}
