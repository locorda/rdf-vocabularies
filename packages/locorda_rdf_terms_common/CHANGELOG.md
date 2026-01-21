## 0.11.4

 - Synchronized with locorda_rdf_core version number

 - **DOCS**: fixed links to locorda.dev homepage(s).

## 0.11.0

**Stable Release** - Graduate package to production-ready status.

### Added
- Event vocabulary (http://purl.org/NET/c4dm/event.owl#) with Event, Product, and Factor classes
- DCAT vocabulary for data catalog descriptions
- Support for FIBO vocabularies (12 new vocabularies including CorporateBodies, Corporations, Addresses, etc.)
- PROV-O and Hydra vocabularies using LOV (Linked Open Vocabularies) sources

### Changed
- Migrate to latest generator with simplified lib/src/vocabularies.json configuration (removed build.yaml)
- Update vocabulary sources to use reliable cached/mirrored versions to avoid parsing issues
- Switch to Turtle (.ttl) format where possible for better reliability
- FOAF vocabulary now uses LOV cached version
- Standardize prefix naming convention (e.g., schema-http properties use camelCase)

### Documentation
- Add 'Why Not Just Use Strings?' section highlighting type-safety benefits
- Comprehensive documentation overhaul for locorda organization migration
- Improve vocabulary generator guide with step-by-step instructions
- Document Cross-Vocabulary Properties feature with practical examples

### Project
- Migrate from github.com/kkalass/rdf_vocabularies to locorda/rdf-vocabularies ecosystem
- Update all repository URLs and documentation links to locorda.dev domain
- Copyright updated to 2025-2026

## [0.4.5] - 2025-09-23

### Changed
- **Dependency updates**: Updated locorda_rdf_core to ^0.9.15 and locorda_rdf_terms_generator to ^0.9.2
- **Vocabulary regeneration**: Regenerated all vocabulary files with latest code generation improvements
  - Enhanced code generation with improved type safety and documentation
  - Updated XSD vocabulary asset (xsd.ttl) with latest specifications
  - Refreshed all vocabulary class definitions and universal property mappings
- **Code quality improvements**: Applied latest linting rules and formatting standards

## [0.4.4] - 2025-08-11

### Fixed
- **PIM vocabulary export**: Added missing export for PIM (Personal Information Management) vocabulary in public API
  - PIM vocabulary classes and properties are now properly accessible through the package interface

## [0.4.3] - 2025-07-30

### Added
- **PIM vocabulary support**: Added complete W3C Personal Information Management (PIM) vocabulary (http://www.w3.org/ns/pim/space#)
  - Workspace management classes: `Workspace`, `PrivateWorkspace`, `PublicWorkspace`, `SharedWorkspace`, `PreferencesWorkspace`, `MasterWorkspace`
  - Storage management classes: `Storage`, `PersonalStorage`, `PublicStorage`, `ControlledStorage`
  - Configuration classes: `ConfigurationFile`
  - Universal properties for workspace and storage organization
- Enhanced agent classes (FOAF Agent, Person, Group, Organization) with PIM properties (`masterWorkspace`, `preferencesFile`)
- Enhanced authenticated agent classes (ACL, Contact, DC Terms) with PIM workspace properties

### Changed
- Updated vocabulary source configurations to include PIM namespace integration
- Expanded cross-vocabulary property mappings for better RDF interoperability

## [0.4.2] - 2025-07-24

### Changed
- Updated README documentation with improved formatting and clarity
- Removed codecov reporting from CI pipeline (not applicable for vocabulary constants)

### Fixed
- Corrected documentation formatting errors and inconsistencies

## [0.4.1] - 2025-07-24

### Fixed
- Improved release automation workflow
- Enhanced documentation generation and deployment
- Streamlined publishing process with proper dependency management

## [0.4.0] - 2025-07-24

### Added
- **Initial release** as separate core vocabularies package
- Core RDF vocabularies: RDF, RDFS, OWL, XSD, SKOS, Dublin Core, FOAF, vCard, ACL, LDP, GEO, and more
- Optimized package size (~5MB) for projects not requiring Schema.org vocabularies
- Comprehensive test suite with class-specific access patterns
- Class-specific examples using `FoafPerson`, `VcardAddress`, etc.

### Migration
- **100% API compatibility** with original `rdf_vocabularies` package
- Direct replacement for projects using core vocabularies only
- All import statements remain unchanged when switching from meta-package

## [0.3.1] - 2025-07-24

### Changed
- Updated `locorda_rdf_core` dependency to ^0.9.11
- Ran `dart pub upgrade`

## [0.3.0] - 2025-05-14

### Changed
- Updated `locorda_rdf_core` dependency to ^0.9.0

## [0.2.0] - 2025-05-13

### Changed
- Updated `locorda_rdf_core` dependency from ^0.7.6 to ^0.8.1
- Updated `locorda_rdf_terms_generator` dependency from ^0.7.2 to ^0.8.0
- Improved documentation and examples

### Compatible
- Maintains compatibility with the latest version of `locorda_rdf_core`

## [0.1.0] - 2025-05-09

### Added
- Initial generation of 19 well-known vocabularies
