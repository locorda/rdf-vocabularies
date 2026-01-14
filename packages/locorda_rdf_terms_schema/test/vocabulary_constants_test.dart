// Copyright (c) 2025, Klas Kalaß <habbatical@gmail.com>
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:locorda_rdf_terms_schema/schema.dart';
import 'package:test/test.dart';
import 'package:locorda_rdf_core/core.dart';

void main() {
  group('Namespace URI Tests', () {
    test('Vocabulary namespaces are correct', () {
      // Test namespace values
      expect(Schema.namespace, equals('https://schema.org/'));
    });

    test('Vocabulary prefixes are correct', () {
      // Test prefix values
      expect(Schema.prefix, equals('schema'));
    });
  });

  group('IriTerm Tests', () {
    test('All vocabulary constants are IriTerm instances', () {
      // Check that constants are IriTerm instances
      expect(Schema.Person, isA<IriTerm>());
    });

    test('IriTerm objects have correct string representation', () {
      expect(Schema.Person.toString(), equals('<https://schema.org/Person>'));
    });
  });
}
