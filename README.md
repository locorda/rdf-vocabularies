# RDF Vocabularies for Dart - Type-safe RDF Constants

[![build](https://github.com/locorda/rdf-vocabularies/actions/workflows/ci.yml/badge.svg)](https://github.com/locorda/rdf-vocabularies/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/locorda/rdf-vocabularies/blob/main/LICENSE)


## Overview

[🌐 **Official Homepage**](https://locorda.dev/rdf/vocabularies/)

**Stop wrestling with RDF vocabulary URIs.** This workspace provides type-safe Dart constants for standard RDF vocabularies, eliminating typos, enabling IDE autocompletion, and catching vocabulary errors at compile time.

The project is organized as a **multi-package monorepo** for optimal package size – take only what you need, from 27KB to 12MB.

> **Note**: This repository contains the workspace root. The actual publishable packages are in the `packages/` directory.

---

## Why Not Just Use Strings?

**The Problem with String-based RDF:**

❌ `Triple(subject, predicate, IriTerm('http://schema.org/Person'))` - Typos detected only at runtime  
❌ `Triple(subject, IriTerm('http://xmlns.com/foaf/0.1/knows'), ...)` - No IDE assistance  
❌ **Which properties work together?** - You need to manually research that `foaf:knows` can be used with `schema:Person`  
❌ **Hidden vocabulary relationships** - Cross-vocabulary patterns remain undiscovered without deep domain knowledge

**The Type-Safe Solution:**

✅ `Triple(subject, SchemaPerson.rdfType, SchemaPerson.classIri)` - **Compile-time validation**  
✅ `SchemaPerson.` → IDE shows `foafKnows`, `foafAge`, etc. - **Discover cross-vocabulary properties through autocompletion**  
✅ **Hover documentation** - VS Code/IntelliJ shows ontology descriptions and property domains directly  
✅ **Vocabulary mixing made easy** - Common properties from related vocabularies are included in class-specific constants

**Result:** Catch errors before runtime, discover valid property combinations through IDE tooling, and learn vocabulary relationships naturally without manual research.

---

## Package Architecture

### 📦 Available Packages

| Package | Size | Content | Use Case |
|---------|------|---------|----------|
| **[`locorda_rdf_terms_core`](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_core)** | ~27KB | RDF/RDFS/OWL/XSD | Foundation for all RDF work |
| **[`locorda_rdf_terms_common`](https://github.com/locorda/rdf-vocabularies/tree/main/packages/locorda_rdf_terms_common)** | ~800KB | Essential vocabularies (FOAF, Dublin Core, SKOS, etc.) | Most applications |
| **[`locorda_rdf_terms_schema`](https://github.com/locorda/rdf-vocabularies/tree/main/packages/locorda_rdf_terms_schema)** | ~5MB | Schema.org (HTTPS) | Schema.org applications |
| **[`locorda_rdf_terms_schema_http`](https://github.com/locorda/rdf-vocabularies/tree/main/packages/locorda_rdf_terms_schema_http)** | ~5MB | Schema.org (HTTP) | Legacy compatibility |
| **[`locorda_rdf_terms`](https://github.com/locorda/rdf-vocabularies/tree/main/packages/locorda_rdf_terms)** | ~12MB | All vocabularies | Full compatibility |

> 📌 **Note**: `locorda_rdf_terms_core` is maintained in the [locorda/rdf](https://github.com/locorda/rdf) repository, while all other packages are in this repository.

> 💡 **Typical Setup**: Start with `locorda_rdf_terms_common`. Add `locorda_rdf_terms_core` if you directly use RDF/RDFS/OWL/XSD terms. Add `locorda_rdf_terms_schema` if you need Schema.org. *(Sizes are compressed download sizes)*

### 🎯 Quick Start

- **Most projects**: `locorda_rdf_terms_common` (~800KB)
- **Using RDF/RDFS/OWL/XSD terms directly?**: Add `locorda_rdf_terms_core` (~27KB)
- **With Schema.org**: Add `locorda_rdf_terms_schema` 
- **Legacy Schema.org**: Use `locorda_rdf_terms_schema_http` instead which uses `http://` instead of `https://`
- **Everything**: Use `locorda_rdf_terms` meta-package (~12MB)

---

## Related Projects

Part of the Locorda RDF ecosystem:

* **[locorda/rdf](https://github.com/locorda/rdf)** - Core RDF functionality: graph classes, codecs (Turtle, JSON-LD, N-Triples, RDF/XML), vocabulary generator, and object mapping

---

## Getting Started

### Installation

Add one or more packages to your `pubspec.yaml`:

```sh
# Option 1: Meta-package with all vocabularies (⚠️ ~12MB total compressed download)
dart pub add locorda_rdf_terms 

# Option 2: Individual packages for size optimization (recommended)

# Common vocabularies 
dart pub add locorda_rdf_terms_common         

# Add only if you need Schema.org - this is quite big
dart pub add locorda_rdf_terms_schema         
```

### Basic Usage

The library is designed for both RDF newcomers and experts, offering structured ways to work with semantic data while maintaining compilation-time safety.

#### For RDF Newcomers: Class-Specific Approach

Use class-specific constants that guide you to the correct properties:

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
}
```

**Benefits**: IDE autocompletion, compile-time validation, guided vocabulary discovery.

#### Cross-Vocabulary Properties

Class-specific constants include commonly used properties from related vocabularies, enabling seamless vocabulary mixing:

```dart
import 'package:locorda_rdf_core/core.dart';
import 'package:locorda_rdf_terms_schema/schema.dart';

void main() {
  final personIri = IriTerm('http://example.org/person/jane_doe');
  
  // SchemaPerson includes common FOAF properties - discover them via IDE autocompletion!
  final graph = RdfGraph.fromTriples([
    // Related RDF properties like rdf:type are accessible through SchemaPerson context 
    Triple(personIri, SchemaPerson.rdfType, SchemaPerson.classIri),

    // Pure schema.org properties for schema:Person
    Triple(personIri, SchemaPerson.name, LiteralTerm.string('Jane Doe')),
    Triple(personIri, SchemaPerson.email, LiteralTerm.string('jane@example.com')),

    // Related FOAF properties like foaf:age etc. are accessible through SchemaPerson context
    Triple(personIri, SchemaPerson.foafAge, LiteralTerm.integer(42)),  // FOAF property!
    Triple(personIri, SchemaPerson.foafKnows, otherPersonIri),  // FOAF relationship!
  ]);
}
```

**Benefits**: Discover related properties via IDE autocompletion, natural vocabulary mixing, no need to learn all vocabularies upfront.

#### For RDF Experts: Direct Vocabulary Approach

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

---

## Vocabulary Coverage

### `locorda_rdf_terms_core`
Foundational RDF vocabularies:
- **RDF**: Resource Description Framework
- **RDFS**: RDF Schema
- **OWL**: Web Ontology Language
- **XSD**: XML Schema Datatypes

### `locorda_rdf_terms_common`
Essential semantic web vocabularies:
- **FOAF**: Friend of a Friend
- **DC/DCTerms/DCMIType**: Dublin Core metadata
- **DCAT**: Data Catalog Vocabulary
- **SKOS**: Simple Knowledge Organization System
- **VCard**: Contact information
- **ACL**: Web Access Control
- **LDP**: Linked Data Platform
- **Solid**: Solid platform terms
- **Contact**: Contact vocabulary
- **Event**: Event ontology
- **GEO**: WGS84 Geospatial vocabulary
- **PIM**: Personal Information Management
- **VS**: Vocabulary Status

### `locorda_rdf_terms_schema`
Schema.org vocabulary with HTTPS URIs (modern standard)

### `locorda_rdf_terms_schema_http`
Schema.org vocabulary with HTTP URIs (legacy compatibility)

### `locorda_rdf_terms`
Meta-package including all of the above

---

## Custom Vocabulary Generation

**All packages in this repository are generated** using [`locorda_rdf_terms_generator`](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator). 

If you need:
- A different selection of vocabularies
- Support for vocabularies not included here
- Custom vocabulary packages for your organization

...you can generate them yourself! See the [locorda_rdf_terms_generator documentation](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator) for detailed instructions on generating custom vocabulary packages.

---

## Development

This is a [Melos](https://melos.invertase.dev/) monorepo. To work on this project:

```sh
# Install Melos globally
dart pub global activate melos

# Bootstrap the workspace (links all packages)
melos bootstrap

# Run tests across all packages
melos test

# Format all code
melos format

# Analyze all packages
melos analyze

# Re-generate all Dart constants from freshly fetched vocabulary source files. 
melos generate
```

### Key Benefits

- **Zero Runtime Overhead**: All constants are compile-time
- **Type Safety**: Catch vocabulary errors before runtime
- **Tree Shaking**: Unused vocabularies are eliminated from builds
- **IDE Integration**: Full autocompletion and inline documentation

---

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome!

- Fork the repo and submit a PR
- See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines
- Join the discussion in [GitHub Issues](https://github.com/locorda/rdf-vocabularies/issues)

## 🤖 AI Policy

This project is proudly human-led and human-controlled, with all key decisions, design, and code reviews made by people. At the same time, it stands on the shoulders of LLM giants: generative AI tools are used throughout the development process to accelerate iteration, inspire new ideas, and improve documentation quality. We believe that combining human expertise with the best of AI leads to higher-quality, more innovative open source software.

---

© 2025-2026 Klas Kalaß. Licensed under the MIT License.
