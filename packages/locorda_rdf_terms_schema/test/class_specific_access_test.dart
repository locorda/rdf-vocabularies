// Copyright (c) 2025, Klas Kalaß <habbatical@gmail.com>
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:locorda_rdf_terms_schema/schema.dart';
import 'package:test/test.dart';

void main() {
  group('Class-Specific Vocabulary Access Tests', () {
    test('Class-specific IRIs are correct', () {
      expect(SchemaPerson.classIri.value, equals('https://schema.org/Person'));
      expect(
        SchemaPostalAddress.classIri.value,
        equals('https://schema.org/PostalAddress'),
      );
    });

    test('Class-specific properties are correct', () {
      // Test SchemaPerson properties
      expect(SchemaPerson.name.value, equals('https://schema.org/name'));
      expect(
        SchemaPerson.givenName.value,
        equals('https://schema.org/givenName'),
      );
      expect(
        SchemaPerson.familyName.value,
        equals('https://schema.org/familyName'),
      );
      expect(SchemaPerson.email.value, equals('https://schema.org/email'));
      expect(
        SchemaPerson.birthDate.value,
        equals('https://schema.org/birthDate'),
      );
      expect(SchemaPerson.address.value, equals('https://schema.org/address'));

      // Test SchemaPostalAddress properties
      expect(
        SchemaPostalAddress.streetAddress.value,
        equals('https://schema.org/streetAddress'),
      );
      expect(
        SchemaPostalAddress.addressLocality.value,
        equals('https://schema.org/addressLocality'),
      );
      expect(
        SchemaPostalAddress.postalCode.value,
        equals('https://schema.org/postalCode'),
      );
      expect(
        SchemaPostalAddress.addressCountry.value,
        equals('https://schema.org/addressCountry'),
      );
    });

    test('Class-specific RDF type property is available', () {
      // Every class should have a rdfType property
      expect(
        SchemaPerson.rdfType.value,
        equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
      );
      expect(
        SchemaPostalAddress.rdfType.value,
        equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
      );
    });

    test(
      'Cross-vocabulary references are available in class-specific access',
      () {
        // Test that SchemaPerson has access to FOAF terms that can be used with Person
        expect(
          SchemaPerson.foafName.value,
          equals('http://xmlns.com/foaf/0.1/name'),
        );
        expect(
          SchemaPerson.foafAge.value,
          equals('http://xmlns.com/foaf/0.1/age'),
        );
      },
    );
  });
}
