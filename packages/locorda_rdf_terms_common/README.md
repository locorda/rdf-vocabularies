# locorda_rdf_terms_common - Essential RDF Vocabularies

[![pub package](https://img.shields.io/pub/v/locorda_rdf_terms_common.svg)](https://pub.dev/packages/locorda_rdf_terms_common)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/locorda/rdf-vocabularies/blob/main/LICENSE)

## Overview

[🌐 **Official Homepage**](https://locorda.dev/rdf-vocabularies/)

`locorda_rdf_terms_common` provides type-safe access to **essential RDF vocabulary terms** as Dart constants for use with [`locorda_rdf_core`](https://pub.dev/packages/locorda_rdf_core). 

This package contains essential semantic web vocabularies (~800KB compressed) for most RDF applications, excluding the large Schema.org vocabularies.

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
# Install essential vocabularies package (~800KB compressed)
dart pub add locorda_rdf_terms_common
```

### Why Choose This Package?

- **Optimized Size**: Only ~800KB compressed download vs ~12MB for the full meta-package
- **Essential Vocabularies**: FOAF, Dublin Core, SKOS, VCard, and more for most semantic web applications
- **No Schema.org Bloat**: Excludes the large Schema.org vocabularies (~11MB) unless you need them
- **Extensible**: Easily add Schema.org or other vocabularies later if needed

## Usage

### For RDF Newcomers: Class-Specific Approach

If you're new to RDF, the class-specific approach guides you to use the correct properties for each type of resource:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_common/foaf.dart';

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
import 'package:locorda_rdf_terms_common/foaf.dart';

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // FoafPerson includes common Schema.org properties - discover them via IDE autocompletion!
  final graph = RdfGraph.fromTriples([
    Triple(personIri, FoafPerson.rdfType, FoafPerson.classIri),
    Triple(personIri, FoafPerson.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, FoafPerson.age, LiteralTerm.integer(42)),
    Triple(personIri, FoafPerson.schemaHttpEmail, LiteralTerm.string('jane@example.com')),  // Schema.org!
    Triple(personIri, FoafPerson.schemaHttpJobTitle, LiteralTerm.string('Developer')),  // Schema.org!
  ]);
}
```

**Benefits**: Discover related properties via IDE autocompletion, natural vocabulary mixing, no need to learn all vocabularies upfront.

### For RDF Experts: Direct Vocabulary Approach

Use vocabulary classes directly for maximum flexibility:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_common/foaf.dart';
import 'package:locorda_rdf_terms_core/rdf.dart';
import 'package:locorda_rdf_terms_common/dc.dart';

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

## Vocabularies Included

This package includes essential semantic web vocabularies:

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

> **Note**: Foundation vocabularies (RDF, RDFS, OWL, XSD) are in the separate [`locorda_rdf_terms_core`](https://pub.dev/packages/locorda_rdf_terms_core) package.

## Adding Schema.org Support

If you need Schema.org vocabularies, add them separately:

```sh
# Modern Schema.org with HTTPS URIs (+35MB)
dart pub add locorda_rdf_terms_schema

# Legacy Schema.org with HTTP URIs (+36MB) 
dart pub add locorda_rdf_terms_schema_http
```

## Performance Characteristics

- **Zero Runtime Overhead**: All vocabulary terms are compile-time constants
- **Optimized Size**: ~800KB compressed download (vs ~12MB for full meta-package)
- **Type Safety**: Catch vocabulary usage errors at compile time
- **IDE Integration**: Full autocompletion and inline documentation
- **Tree Shaking**: Unused vocabularies are eliminated from production builds

## Custom Vocabulary Selection

This package was generated using [`locorda_rdf_terms_generator`](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator). If you need a different vocabulary selection or want to include vocabularies not provided here, you can use the generator to create your own custom package tailored to your specific needs.

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome!

- Fork the repo and submit a PR
- See [CONTRIBUTING.md](https://github.com/locorda/rdf-vocabularies/blob/main/CONTRIBUTING.md) for guidelines
- Join the discussion in [GitHub Issues](https://github.com/locorda/rdf-vocabularies/issues)

## 🤖 AI Policy

This project is proudly human-led and human-controlled, with all key decisions, design, and code reviews made by people. At the same time, it stands on the shoulders of LLM giants: generative AI tools are used throughout the development process to accelerate iteration, inspire new ideas, and improve documentation quality. We believe that combining human expertise with the best of AI leads to higher-quality, more innovative open source software.

---

© 2025-2026 Klas Kalaß. Licensed under the MIT License.
