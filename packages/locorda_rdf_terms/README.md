# locorda_rdf_terms (Meta-Package) - All RDF Vocabularies

[![pub package](https://img.shields.io/pub/v/locorda_rdf_terms.svg)](https://pub.dev/packages/locorda_rdf_terms)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/locorda/rdf-vocabularies/blob/main/LICENSE)

## Overview

[🌐 **Official Homepage**](https://locorda.dev/rdf/vocabularies/)

**Meta-package** that includes all RDF vocabularies for maximum convenience and backward compatibility. This package automatically includes:

- **Essential vocabularies** (`locorda_rdf_terms_common`): FOAF, Dublin Core, SKOS, VCard, and more
- **Schema.org HTTPS** (`locorda_rdf_terms_schema`): Modern Schema.org vocabulary
- **Schema.org HTTP** (`locorda_rdf_terms_schema_http`): Legacy Schema.org vocabulary

> **⚠️ Size Note**: This meta-package downloads **~12MB compressed** as it includes all vocabularies. For size optimization, consider using individual packages instead.

## 📦 Package Selection Guide

For an overview of all available packages and guidance on which to choose, see the [Package Selection Guide](https://github.com/locorda/rdf-vocabularies#-package-architecture) in the main repository README.

The library is designed for both RDF newcomers and experts, offering structured ways to work with semantic data while maintaining compilation-time safety.

---

## Related Projects

Part of the Locorda RDF ecosystem:

* **[locorda/rdf-vocabularies](https://github.com/locorda/rdf-vocabularies)** - This repository with all vocabulary packages
* **[locorda/rdf](https://github.com/locorda/rdf)** - Core RDF functionality: graph classes, codecs (Turtle, JSON-LD, N-Triples, RDF/XML), vocabulary generator, and object mapping

---

## Getting Started

### Installation

Add the package to your project:

```sh
# Install the meta-package (includes all vocabularies - ~12MB compressed)
dart pub add locorda_rdf_terms

# Or for size optimization, use individual packages instead:
# dart pub add locorda_rdf_terms_common  # Only ~800KB
```

> **💡 Size Optimization**: Consider using `locorda_rdf_terms_common` instead for most use cases to reduce download size from ~12MB to ~800KB.

## Usage

### For RDF Newcomers: Class-Specific Approach

If you're new to RDF, the class-specific approach guides you to use the correct properties for each type of resource:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms/foaf.dart';

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // Create a graph using class-specific constants
  final graph = RdfGraph.fromTriples([
    // Use FoafPerson class for type-safe property access
    Triple(personIri, FoafPerson.rdfType, FoafPerson.classIri),
    Triple(personIri, FoafPerson.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, FoafPerson.givenName, LiteralTerm.string('Jane')),
    Triple(personIri, FoafPerson.familyName, LiteralTerm.string('Doe')),
    Triple(personIri, FoafPerson.age, LiteralTerm.integer(42)),
    Triple(personIri, FoafPerson.mbox, IriTerm('mailto:jane.doe@example.com')),
  ]);
  
  print(RdfCore.withStandardCodecs().encode(graph));
```

**Benefits**: IDE autocompletion, compile-time validation, guided vocabulary discovery.

### Cross-Vocabulary Properties

Class-specific constants include commonly used properties from related vocabularies, enabling seamless vocabulary mixing:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms/schema.dart';

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // SchemaPerson includes common FOAF properties - discover them via IDE autocompletion!
  final graph = RdfGraph.fromTriples([
    Triple(personIri, SchemaPerson.rdfType, SchemaPerson.classIri),
    Triple(personIri, SchemaPerson.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, SchemaPerson.email, LiteralTerm.string('jane@example.com')),
    Triple(personIri, SchemaPerson.foafAge, LiteralTerm.integer(42)),  // FOAF property!
    Triple(personIri, SchemaPerson.foafKnows, otherPersonIri),  // FOAF relationship!
  ]);
}
```

**Benefits**: Discover related properties via IDE autocompletion, natural vocabulary mixing, no need to learn all vocabularies upfront.

### For RDF Experts: Direct Vocabulary Approach

Use vocabulary classes directly for maximum flexibility:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms/foaf.dart';
import 'package:locorda_rdf_terms/rdf.dart';
import 'package:locorda_rdf_terms/dc.dart';

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // Create a graph with direct vocabulary access
  final graph = RdfGraph.fromTriples([
    Triple(personIri, Rdf.type, Foaf.Person),
    Triple(personIri, Foaf.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, Foaf.age, LiteralTerm.integer(42)),
    Triple(personIri, Dc.creator, LiteralTerm.string('System')),
  ]);
  
  print(RdfCore.withStandardCodecs().encode(graph));
}
```

**Benefits**: Maximum flexibility, concise syntax, mix vocabularies freely.

## Included Vocabularies

This meta-package includes all available RDF vocabularies:

### Core Vocabularies (~27KB compressed)
- **RDF**: Resource Description Framework base vocabulary
- **RDFS**: RDF Schema vocabulary
- **OWL**: Web Ontology Language
- **XSD**: XML Schema Datatypes

### Essential Vocabularies (~800KB compressed)
- **FOAF**: Friend of a Friend vocabulary
- **DC/DCTerms/DCMIType**: Dublin Core metadata vocabularies
- **DCAT**: Data Catalog Vocabulary
- **SKOS**: Simple Knowledge Organization System
- **VCard**: vCard ontology for contacts
- **ACL**: Web Access Control vocabulary
- **Contact**: Contact information vocabulary
- **Event**: Event ontology
- **GEO**: WGS84 Geospatial vocabulary
- **LDP**: Linked Data Platform vocabulary
- **PIM**: Personal Information Management
- **Solid**: Solid platform vocabulary
- **VS**: Vocabulary Status ontology

### Schema.org Vocabularies (~11MB compressed)
- **Schema.org HTTPS** (~5MB): Modern Schema.org vocabulary with HTTPS URIs
- **Schema.org HTTP** (~5MB): Legacy Schema.org vocabulary with HTTP URIs

## Performance Characteristics

- **Zero Runtime Overhead**: All vocabulary terms are compile-time constants
- **Type Safety**: Catch vocabulary usage errors at compile time
- **IDE Integration**: Full autocompletion and inline documentation
- **Download Size**: ~12MB compressed (includes all vocabularies)
- **Tree Shaking**: Unused vocabularies are eliminated from production builds

## Alternative Packages

For size optimization, consider these individual packages:

```sh
# Essential vocabularies only (~800KB) - recommended for most apps
dart pub add locorda_rdf_terms_common

# Add Schema.org HTTPS if needed (+5MB)
dart pub add locorda_rdf_terms_schema

# Add Schema.org HTTP for legacy compatibility (+5MB)  
dart pub add locorda_rdf_terms_schema_http
```

## Custom Vocabulary Selection

This package was generated using [`locorda_rdf_terms_generator`](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator). If you need a different vocabulary selection or want to include vocabularies not provided here, you can use the generator to create your own custom package tailored to your specific needs.

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome!

- Fork the repo and submit a PR
- See [CONTRIBUTING.md](https://github.com/locorda/rdf-vocabularies/blob/main/CONTRIBUTING.md) for guidelines
- Join the discussion in [GitHub Issues](https://github.com/locorda/rdf-vocabularies/issues)

---

© 2025-2026 Klas Kalaß. Licensed under the MIT License.
