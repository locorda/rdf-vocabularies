// Copyright (c) 2025, Klas Kalaß <habbatical@gmail.com>
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:locorda_rdf_terms_schema_http/src/generated/schema_http/index.dart';
import 'package:test/test.dart';

void main() {
  group('Class-Specific Vocabulary Access Tests', () {
    test('Class-specific IRIs are correct', () {
      expect(
        SchemaHttpPerson.classIri.value,
        equals('http://schema.org/Person'),
      );
      expect(
        SchemaHttpPostalAddress.classIri.value,
        equals('http://schema.org/PostalAddress'),
      );
    });

    test('Class-specific properties are correct', () {
      // Test SchemaPerson properties
      expect(SchemaHttpPerson.name.value, equals('http://schema.org/name'));
      expect(
        SchemaHttpPerson.givenName.value,
        equals('http://schema.org/givenName'),
      );
      expect(
        SchemaHttpPerson.familyName.value,
        equals('http://schema.org/familyName'),
      );
      expect(SchemaHttpPerson.email.value, equals('http://schema.org/email'));
      expect(
        SchemaHttpPerson.birthDate.value,
        equals('http://schema.org/birthDate'),
      );
      expect(
        SchemaHttpPerson.address.value,
        equals('http://schema.org/address'),
      );

      // Test SchemaPostalAddress properties
      expect(
        SchemaHttpPostalAddress.streetAddress.value,
        equals('http://schema.org/streetAddress'),
      );
      expect(
        SchemaHttpPostalAddress.addressLocality.value,
        equals('http://schema.org/addressLocality'),
      );
      expect(
        SchemaHttpPostalAddress.postalCode.value,
        equals('http://schema.org/postalCode'),
      );
      expect(
        SchemaHttpPostalAddress.addressCountry.value,
        equals('http://schema.org/addressCountry'),
      );
    });

    test('Class-specific RDF type property is available', () {
      // Every class should have a rdfType property
      expect(
        SchemaHttpPerson.rdfType.value,
        equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
      );
      expect(
        SchemaHttpPostalAddress.rdfType.value,
        equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
      );
    });

    test(
      'Cross-vocabulary references are available in class-specific access',
      () {
        // Test that SchemaPerson has access to FOAF terms that can be used with Person
        expect(
          SchemaHttpPerson.foafName.value,
          equals('http://xmlns.com/foaf/0.1/name'),
        );
        expect(
          SchemaHttpPerson.foafAge.value,
          equals('http://xmlns.com/foaf/0.1/age'),
        );
      },
    );
  });
}
