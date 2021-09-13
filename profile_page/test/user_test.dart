import 'package:test/test.dart';
import 'package:profile_page/models/user.dart';

void main() {
  test('Test1: User created with named parameters should have appropriate property values', () {
    final firstName = 'Donald';
    const lastName = 'Taylor';
    const phoneNumber = '(555) 555-555';
    const email = 'DonaldMurdockTaylor@gmail.com';
    const bio = 'Hello my name is Don.';

    final testUser = User(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      bio: bio
    );

    expect(testUser.firstName, firstName);
    expect(testUser.lastName, lastName);
    expect(testUser.phoneNumber, phoneNumber);
    expect(testUser.email, email);
    expect(testUser.bio, bio);
    expect(testUser.photo, null);

  });

  test('Test2: User created with named parameters should have appropriate property values', () {
    final firstName = 'test';
    const lastName = 'name';
    const phoneNumber = '(123) 456-7890';
    const email = 'emailaddress@email.com';
    const bio = 'This is a test bio.';

    final testUser = User(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      bio: bio
    );

    expect(testUser.firstName, firstName);
    expect(testUser.lastName, lastName);
    expect(testUser.phoneNumber, phoneNumber);
    expect(testUser.email, email);
    expect(testUser.bio, bio);
    expect(testUser.photo, null);

  });

}