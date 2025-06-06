class Person {
  const Person(this.name, this.age);
  final String name;
  final int age;
}

class User {
  User({
    required this.id,
    required this.name,
    required this.active,
  });

  final int id;
  final String name;
  final bool active;

  User copyWith({int? id, String? name, bool? active}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          active == other.active;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ active.hashCode;

  @override
  String toString() => 'User(id: $id, name: $name, active: $active)';
}

class Product {
  final String name;
  final double price;
  final String category;

  Product(this.name, this.price, this.category);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          category == other.category;

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ category.hashCode;

  @override
  String toString() => 'Product($name, \$$price, $category)';
}
