import 'dart:io';

class Products {
  late List<String> names = [];
  late List<int> prices = [];
  late List<int> counts = [];

  List<String> get newName => names;

  List<int> get newPrice => prices;

  List<int> get newCount => counts;

  set newName(List<String> newName) {
    names = newName;
  }

  set newPrice(List<int> newPrice) {
    prices = newPrice;
  }

  set newCount(List<int> newCount) {
    counts = newCount;
  }

  void addProduct() {
    print("Name mahsool ra vared konid :( press 0 -> Cancel)");
    String? temp = stdin.readLineSync();

    if (temp != "0") {
      while (int.tryParse(temp!) != null) {
        print(
            "esm mahsool nemitavanad faghat addad bashad dobare esm ra begirid");
        temp = stdin.readLineSync();
      }
      while (newName.contains(temp)) {
        print(
            "mahsool shoma az ghabl vojood darad!dobare name mahsool ra vared konid :");
        temp = stdin.readLineSync();
      }
      newName.add(temp!);

      print("gheymat mahsool ra vared konid : ");
      String? input = stdin.readLineSync();

      while ((int.tryParse(input.toString()) == null)) {
        print("gheymat eshtebah ast. dobare vared konid : ");
        input = stdin.readLineSync();
      }
      int userInput = int.parse(input!);
      while (userInput <= 0) {
        print("gheymat motabar nemibashad . dobare gheymat ra vared konid");
        String? input = stdin.readLineSync();
        if (input == null || input.isEmpty) {
          print("Error");
          return addProduct();
        }
        if (int.tryParse(input) == null) {
          print("Error");
          addProduct();
        }
        if (input == "0") {
          main();
        }

        userInput = int.parse(input);
      }
      newPrice.add(userInput);

      print("tedad mahsool ra vared konid : ");
      String? input2 = stdin.readLineSync();

      while ((int.tryParse(input2.toString()) == null)) {
        print("tedad eshtebah ast. dobare vared konid : ");
        input2 = stdin.readLineSync();
      }
      int userInput2 = int.parse(input2!);
      while (userInput2 <= 0) {
        print("tedad motabar nemibashad . dobare tedad ra vared konid");
        input2 = stdin.readLineSync();
        userInput2 = int.parse(input2!);
      }
      newCount.add(userInput2);

      print("mahsool ba movafaghiat ezafe shod");
    }
  }

  void soloDisplay(int i) {
    stdout.write("${i + 1}-${newName[i]}   ${newPrice[i]}tooman    tedad : ${newCount[i]} \n");
  }

  void display() {
    for (int i = 0; i < newName.length; i++) {
      stdout.write("${i + 1}-${newName[i]}   ${newPrice[i]}tooman    tedad : ${newCount[i]}\n");
    }
  }

  void removeProducts() {
    int len = newName.length;
    print("adad mahsoole morede nazar khod ra jahate hazf vared konid : ");
    String? userInput = stdin.readLineSync();
    int num = int.parse(userInput!);
    while (num < 0 || num > len) {
      print("adad vared shode eshtebah ast dobare vared konid : ");
      String? userInput = stdin.readLineSync();
      num = int.parse(userInput!);
    }
    newName.removeAt(num - 1);
    newPrice.removeAt(num - 1);
    newCount.removeAt(num - 1);
    print("\n mahsool ba movafaghiat hazf shod");
  }

  void editProduct() {
    int len = newName.length;
    print("adade mahsoole morede nazar ra jahate virayesh entekhab konid ");
    String? userInput = stdin.readLineSync();
    int num = int.parse(userInput!);
    while (num < 0 || num > len) {
      print("adad vared shode eshtebah ast dobare entekhab konid ");
      String? userInput = stdin.readLineSync();
      num = int.parse(userInput!);
    }
    print("name jadid mahsool : ");
    String? input = stdin.readLineSync();
    newName[num - 1] = input!;

    print("gheymate jadid mahsool : ");
    String? input1 = stdin.readLineSync();

    while ((int.tryParse(input1.toString()) == null)) {
      print("gheymat eshtebah ast. dobare vared konid : ");
          input1 = stdin.readLineSync();
    }
    int user = int.parse(input1!);

    while (user <= 0) {
      print("gheymat eshtebah ast. dobare vared konid : ");
      String? input1 = stdin.readLineSync();
      user = int.parse(input1!);
    }
    newPrice[num - 1] = user;

    print("tedad jadid mahsool : ");
    String? input2 = stdin.readLineSync();

    while ((int.tryParse(input2.toString()) == null)) {
      print("tedad eshtebah ast. dobare vared konid : ");
      input2 = stdin.readLineSync();
    }
    int user2 = int.parse(input2!);
    while (user2 <= 0) {
      print("tedad eshtebah ast. dobare vared konid : ");
      String? input2 = stdin.readLineSync();
      user2 = int.parse(input2!);
    }
    newCount[num - 1] = user2;

    print(" \n mahsool ba movafaghiat virayesh shod");
  }
}

void main() {
  Products product = Products();
  while (true) {
    stdout.write(
        "\n 1:sabte mahsool  2: namayesh fehreste mahsoolat  3: hazfe mahsool    4: virayeshe mahsool    5: mahsoolate ba tedad kam    6: Exit \n");
    String? op = stdin.readLineSync();
    if (op == "1") {
      product.addProduct();
    } else if (op == "2") {
      product.display();
    } else if (op == "3") {
      product.display();

      product.removeProducts();
    } else if (op == "4") {
      product.display();

      product.editProduct();
    } else if (op == "5") {
      for (int i = 0; i < product.newName.length; i++) {
        if (product.counts[i] < 5) {
          product.soloDisplay(i);
        }
      }
    } else if (op == "6") {
      break;
    } else {
      print("addad eshtebah vared kardid");
    }
  }
}
