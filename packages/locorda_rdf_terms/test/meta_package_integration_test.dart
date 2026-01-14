import 'package:test/test.dart';
import 'package:locorda_rdf_terms/rdf.dart';
import 'package:locorda_rdf_terms/rdfs.dart';
import 'package:locorda_rdf_terms/owl.dart';
import 'package:locorda_rdf_terms/foaf.dart';
import 'package:locorda_rdf_terms/schema.dart';
import 'package:locorda_rdf_terms/schema_http.dart';
import 'package:locorda_rdf_terms/dc.dart';
import 'package:locorda_rdf_terms/dcterms.dart';
import 'package:locorda_rdf_terms/skos.dart';
import 'package:locorda_rdf_terms/vcard.dart';

/// Tests for the meta-package integration.
///
/// This test suite verifies that the rdf_vocabularies meta-package
/// correctly exports all vocabularies from the split packages and
/// maintains backward compatibility.
void main() {
  group('Meta-package Integration Tests', () {
    group('Core Vocabularies Access', () {
      test('RDF vocabulary is accessible', () {
        expect(Rdf.prefix, equals('rdf'));
        expect(
          Rdf.type.value,
          equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
        );
        expect(
          Rdf.Property.value,
          equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#Property'),
        );
      });

      test('RDFS vocabulary is accessible', () {
        expect(Rdfs.prefix, equals('rdfs'));
        expect(
          Rdfs.label.value,
          equals('http://www.w3.org/2000/01/rdf-schema#label'),
        );
        expect(
          Rdfs.Class.value,
          equals('http://www.w3.org/2000/01/rdf-schema#Class'),
        );
      });

      test('OWL vocabulary is accessible', () {
        expect(Owl.prefix, equals('owl'));
        expect(Owl.Class.value, equals('http://www.w3.org/2002/07/owl#Class'));
        expect(
          Owl.ObjectProperty.value,
          equals('http://www.w3.org/2002/07/owl#ObjectProperty'),
        );
      });

      test('FOAF vocabulary is accessible', () {
        expect(Foaf.prefix, equals('foaf'));
        expect(Foaf.Person.value, equals('http://xmlns.com/foaf/0.1/Person'));
        expect(Foaf.name.value, equals('http://xmlns.com/foaf/0.1/name'));
      });

      test('Dublin Core vocabularies are accessible', () {
        expect(Dc.prefix, equals('dc'));
        expect(Dc.title.value, equals('http://purl.org/dc/elements/1.1/title'));

        expect(Dcterms.prefix, equals('dcterms'));
        expect(Dcterms.title.value, equals('http://purl.org/dc/terms/title'));
      });

      test('SKOS vocabulary is accessible', () {
        expect(Skos.prefix, equals('skos'));
        expect(
          Skos.Concept.value,
          equals('http://www.w3.org/2004/02/skos/core#Concept'),
        );
        expect(
          Skos.prefLabel.value,
          equals('http://www.w3.org/2004/02/skos/core#prefLabel'),
        );
      });

      test('vCard vocabulary is accessible', () {
        expect(Vcard.prefix, equals('vcard'));
        expect(
          Vcard.Kind.value,
          equals('http://www.w3.org/2006/vcard/ns#Kind'),
        );
        expect(Vcard.fn.value, equals('http://www.w3.org/2006/vcard/ns#fn'));
      });
    });

    group('Schema.org Vocabularies Access', () {
      test('Schema.org HTTPS vocabulary is accessible', () {
        expect(Schema.prefix, equals('schema'));
        expect(Schema.Person.value, equals('https://schema.org/Person'));
        expect(Schema.name.value, equals('https://schema.org/name'));
        expect(Schema.address.value, equals('https://schema.org/address'));
      });

      test('Schema.org HTTP vocabulary is accessible', () {
        expect(SchemaHttp.prefix, equals('schemahttp'));
        expect(SchemaHttp.Person.value, equals('http://schema.org/Person'));
        expect(SchemaHttp.name.value, equals('http://schema.org/name'));
        expect(SchemaHttp.address.value, equals('http://schema.org/address'));
      });

      test('Schema.org variants have equivalent properties', () {
        // Verify that HTTPS and HTTP variants have the same property names
        // but different IRIs
        expect(Schema.Person.toString().contains('https://'), isTrue);
        expect(SchemaHttp.Person.toString().contains('http://'), isTrue);
        expect(SchemaHttp.Person.toString().contains('https://'), isFalse);
      });
    });

    group('Cross-vocabulary Integration', () {
      test('Can use vocabularies together in RDF graphs', () {
        // This test verifies that vocabularies from different packages
        // can be used together without conflicts

        // Core vocabularies
        final personType = Rdf.type;
        final personClass = Foaf.Person;
        final nameProperty = Foaf.name;

        // Schema.org vocabularies
        final schemaPersonClass = Schema.Person;
        final schemaNameProperty = Schema.name;

        expect(
          personType.value,
          equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
        );
        expect(personClass.value, equals('http://xmlns.com/foaf/0.1/Person'));
        expect(nameProperty.value, equals('http://xmlns.com/foaf/0.1/name'));
        expect(schemaPersonClass.value, equals('https://schema.org/Person'));
        expect(schemaNameProperty.value, equals('https://schema.org/name'));
      });

      test('Universal properties are available across vocabularies', () {
        // Test that RDF type property is consistently accessible
        expect(
          Rdf.type.value,
          equals('http://www.w3.org/1999/02/22-rdf-syntax-ns#type'),
        );

        // Verify that different vocabulary classes are properly typed
        expect(Foaf.Person.value, contains('foaf'));
        expect(Schema.Person.value, contains('schema.org'));
        expect(SchemaHttp.Person.value, contains('schema.org'));
        expect(Rdfs.Class.value, contains('rdf-schema'));
      });
    });

    group('Backward Compatibility', () {
      test('All original vocabulary exports are preserved', () {
        // Test that importing the meta-package provides access to all
        // vocabularies that were available in the original monolithic package

        // Test core vocabularies
        expect(Rdf.prefix, isNotEmpty);
        expect(Rdfs.prefix, isNotEmpty);
        expect(Owl.prefix, isNotEmpty);
        expect(Foaf.prefix, isNotEmpty);
        expect(Dc.prefix, isNotEmpty);
        expect(Dcterms.prefix, isNotEmpty);
        expect(Skos.prefix, isNotEmpty);
        expect(Vcard.prefix, isNotEmpty);

        // Test Schema.org vocabularies
        expect(Schema.prefix, isNotEmpty);
        expect(SchemaHttp.prefix, isNotEmpty);
      });

      test('Package structure maintains original import patterns', () {
        // Users should be able to import individual vocabularies
        // using the same import statements as before

        // These imports should work exactly as in the original package:
        // import 'package:locorda_rdf_terms/rdf.dart';
        // import 'package:locorda_rdf_terms/schema.dart';
        // etc.

        expect(Rdf.prefix, equals('rdf'));
        expect(Schema.prefix, equals('schema'));
        expect(SchemaHttp.prefix, equals('schemahttp'));
      });
    });

    group('Package Size Optimization', () {
      test('Core vocabularies are separated from Schema.org', () {
        // This is a logical test to ensure the separation is working
        // The actual size reduction is verified by the package split

        // Core vocabularies should not depend on Schema.org
        expect(Rdf.prefix, isNot(contains('schema')));
        expect(Foaf.prefix, isNot(contains('schema')));
        expect(Owl.prefix, isNot(contains('schema')));

        // Schema vocabularies should be clearly identified
        expect(Schema.prefix, equals('schema'));
        expect(SchemaHttp.prefix, equals('schemahttp'));
      });
    });
  });

  group('Error Handling and Edge Cases', () {
    test('Vocabularies handle null/empty access gracefully', () {
      // Test that vocabulary classes are properly initialized
      expect(Rdf.prefix, isNotNull);
      expect(Schema.prefix, isNotNull);
      expect(SchemaHttp.prefix, isNotNull);
    });

    test('IRI generation is consistent', () {
      // Test that IRI generation follows expected patterns
      expect(Rdf.type.value, startsWith('http://'));
      expect(Schema.Person.value, startsWith('https://schema.org/'));
      expect(SchemaHttp.Person.value, startsWith('http://schema.org/'));
    });
  });
}
