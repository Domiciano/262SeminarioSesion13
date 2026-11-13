/// A row of the profiles table: the data of a user that Auth does not keep.
class Profile {
  final String id;
  final String name;
  final String email;

  const Profile({required this.id, required this.name, required this.email});

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  Profile copyWith({String? id, String? name, String? email}) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
