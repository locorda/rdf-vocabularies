# locorda_rdf_terms_schema - Schema.org HTTPS Vocabulary

[![pub package](https://img.shields.io/pub/v/locorda_rdf_terms_schema.svg)](https://pub.dev/packages/locorda_rdf_terms_schema)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/locorda/rdf-vocabularies/blob/main/LICENSE)

## Overview

[🌐 **Official Homepage**](https://locorda.dev/rdf/vocabularies/schema/)

`locorda_rdf_terms_schema` provides type-safe access to the **Schema.org vocabulary with HTTPS URIs** as Dart constants for use with [`locorda_rdf_core`](https://pub.dev/packages/locorda_rdf_core).

This package contains the complete modern Schema.org vocabulary (~5MB compressed) using HTTPS URIs (`https://schema.org/...`), which is the current standard.

## 📦 Package Selection Guide

For an overview of all available packages and guidance on which to choose, see the [Package Selection Guide](https://github.com/locorda/rdf-vocabularies#-package-architecture) in the main repository README.

> **💡 Recommendation**: Use this package with `locorda_rdf_terms_common` for comprehensive RDF + Schema.org support (~6MB compressed total).

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
# Install Schema.org HTTPS vocabulary (~5MB compressed)
dart pub add locorda_rdf_terms_schema

# Recommended: Also add essential vocabularies (FOAF, Dublin Core, etc.)
dart pub add locorda_rdf_terms_common
```

### Why Choose Schema.org HTTPS?

- **Modern Standard**: Uses current HTTPS URIs (`https://schema.org/...`)
- **Comprehensive**: Complete Schema.org vocabulary for structured data
- **Web-Ready**: Perfect for JSON-LD and modern web applications
- **SEO-Friendly**: Ideal for structured data markup

## Usage

### For RDF Newcomers: Class-Specific Approach

If you're new to RDF, the class-specific approach guides you to use the correct properties for each type of resource:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_schema/schema.dart';
import 'package:locorda_rdf_terms_core/rdf.dart';  // Optional: for RDF.type

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // Create a graph using Schema.org class-specific constants
  final graph = RdfGraph.fromTriples([
    // Use SchemaPerson class for type-safe property access
    Triple(personIri, Rdf.type, SchemaPerson.classIri),
    Triple(personIri, SchemaPerson.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, SchemaPerson.email, LiteralTerm.string('jane.doe@example.com')),
    Triple(personIri, SchemaPerson.jobTitle, LiteralTerm.string('Software Developer')),
    Triple(personIri, SchemaPerson.birthDate, LiteralTerm('1990-01-01')),
  ]);
  
  print(RdfCore.withStandardCodecs().encode(graph));
```

**Benefits**: IDE autocompletion, compile-time validation, guided Schema.org discovery.

### Cross-Vocabulary Properties

Class-specific constants include commonly used properties from related vocabularies, enabling seamless vocabulary mixing:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_schema/schema.dart';

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

### For RDF Experts: Direct Schema.org Access

Use Schema.org vocabulary classes directly:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_schema/schema.dart';
import 'package:locorda_rdf_terms_core/rdf.dart';

void main() {
  final productIri = IriTerm('http://example.org/product/123');
  
  // Create structured data for a product
  final graph = RdfGraph.fromTriples([
    Triple(productIri, Rdf.type, Schema.Product),
    Triple(productIri, Schema.name, LiteralTerm.string('Amazing Widget')),
    Triple(productIri, Schema.description, LiteralTerm.string('The best widget you can buy')),
    Triple(productIri, Schema.price, LiteralTerm.string('29.99')),
    Triple(productIri, Schema.priceCurrency, LiteralTerm.string('USD')),
  ]);
  
  print(RdfCore.withStandardCodecs().encode(graph));
}
```

**Benefits**: Maximum flexibility, perfect for JSON-LD, SEO-optimized structured data.

## Schema.org HTTPS Vocabulary

This package provides the complete Schema.org vocabulary using modern HTTPS URIs:

- **All Schema.org Types**: Person, Organization, Product, Event, Place, etc.
- **All Properties**: name, description, url, image, and thousands more
- **HTTPS URIs**: Uses `https://schema.org/...` (current standard)
- **Type Safety**: Class-specific constants for better development experience
- **Rich Documentation**: Each term includes Schema.org descriptions

### Popular Schema.org Types

Some commonly used Schema.org types included:

- **Person**: Individual people
- **Organization**: Companies, institutions, etc.  
- **Product**: Items for sale
- **Event**: Concerts, conferences, etc.
- **Place**: Locations, addresses
- **Article**: Blog posts, news articles
- **Recipe**: Cooking instructions
- **Review**: Product/service reviews
- **WebPage**: Web pages and sites
- **VideoObject**: Video content

## Combining with Essential Vocabularies

For comprehensive RDF support, combine with essential vocabularies:

```sh
# Add both packages for complete coverage
dart pub add locorda_rdf_terms_common locorda_rdf_terms_schema
```

```dart
import 'package:locorda_rdf_terms_common/foaf.dart';  // FOAF vocabulary
import 'package:locorda_rdf_terms_schema/schema.dart';  // Schema.org

// Mix vocabularies as needed
final graph = RdfGraph.fromTriples([
  Triple(personIri, Rdf.type, Schema.Person),
  Triple(personIri, Schema.name, LiteralTerm.string('Jane Doe')),
  Triple(personIri, Foaf.age, LiteralTerm.integer(42)),  // FOAF property
]);
```

## Performance Characteristics

- **Zero Runtime Overhead**: All vocabulary terms are compile-time constants
- **Large but Focused**: ~5MB compressed download for complete Schema.org coverage
- **Type Safety**: Catch vocabulary usage errors at compile time
- **IDE Integration**: Full autocompletion and inline documentation
- **Tree Shaking**: Unused vocabulary terms are eliminated from production builds

## HTTP vs HTTPS Schema.org

Schema.org is available in two URI variants:

- **HTTPS** (this package): `https://schema.org/Person` - **modern standard**
- **HTTP** (`locorda_rdf_terms_schema_http`): `http://schema.org/Person` - legacy compatibility

Choose HTTPS unless you specifically need HTTP URIs for compatibility with existing data.

## Custom Vocabulary Selection

This package was generated using [`locorda_rdf_terms_generator`](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator). If you need a different vocabulary selection or want to include vocabularies not provided here, you can use the generator to create your own custom package tailored to your specific needs.

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome!

- Fork the repo and submit a PR
- See [CONTRIBUTING.md](https://github.com/locorda/rdf-vocabularies/blob/main/CONTRIBUTING.md) for guidelines
- Join the discussion in [GitHub Issues](https://github.com/locorda/rdf-vocabularies/issues)

---

© 2025-2026 Klas Kalaß. Licensed under the MIT License.
