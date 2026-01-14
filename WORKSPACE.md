# RDF Vocabularies Workspace

This is the workspace root for the RDF Vocabularies multi-package project.

## Package Structure

```
packages/
├── locorda_rdf_terms/              # Meta-package (exports all vocabularies)
├── locorda_rdf_terms_common/         # Core RDF vocabularies (~5MB)
├── locorda_rdf_terms_schema/       # Schema.org HTTPS (~35MB)
└── locorda_rdf_terms_schema_http/  # Schema.org HTTP (~36MB)
```

## Quick Start

```bash
# Test all packages
./test_all.sh

# Work with individual packages
cd packages/locorda_rdf_terms_common
dart pub get
dart test
dart run example/main.dart
```

## Package Information

| Package | Purpose | Size | Use Case |
|---------|---------|------|----------|
| `locorda_rdf_terms` | Meta-package | ~1MB | Full compatibility |
| `locorda_rdf_terms_common` | Core vocabularies | ~5MB | Most applications |
| `locorda_rdf_terms_schema` | Schema.org HTTPS | ~35MB | Modern Schema.org |
| `locorda_rdf_terms_schema_http` | Schema.org HTTP | ~36MB | Legacy compatibility |

## Development

- Each package has its own `pubspec.yaml`, tests, and examples
- The meta-package (`rdf_vocabularies`) depends on all other packages
- Core package includes: RDF, RDFS, OWL, FOAF, Dublin Core, SKOS, vCard, etc.
- Schema packages contain only Schema.org vocabularies

## Documentation

See the main [README.md](README.md) for user documentation and package selection guidance.
