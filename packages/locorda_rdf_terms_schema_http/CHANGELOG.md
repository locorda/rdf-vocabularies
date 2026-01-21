## 0.11.4

 - Synchronized with locorda_rdf_core version number

 - **DOCS**: fixed links to locorda.dev homepage(s).

## 0.11.0

**Stable Release** - Graduate package to production-ready status.

### Changed
- Migrate to latest generator with simplified lib/src/vocabularies.json configuration (removed build.yaml)
- Standardize prefix naming convention (schema-http properties now use camelCase, e.g., schemaHttpAdditionalType)
- Improve prefix handling for Schema.org HTTP variant
- Regenerate all Schema.org HTTP vocabulary classes with latest generator improvements
- Add new Schema.org classes (AuthenticateAction, LoginAction, etc.)

### Documentation
- Add 'Why Not Just Use Strings?' section highlighting type-safety benefits
- Comprehensive documentation overhaul for locorda organization migration
- Professional README improvements with corrected package information
- Document Cross-Vocabulary Properties feature with practical examples

### Project
- Migrate from github.com/kkalass/rdf_vocabularies to locorda/rdf-vocabularies ecosystem
- Update all repository URLs and documentation links to locorda.dev domain
- Copyright updated to 2025-2026

## [0.4.5] - 2025-09-23

### Changed
- **Dependency updates**: Updated locorda_rdf_core to ^0.9.15 and locorda_rdf_terms_generator to ^0.9.2
- **Vocabulary regeneration**: Regenerated all Schema.org HTTP vocabulary files with latest code generation improvements
  - Enhanced code generation with improved type safety and documentation
  - Updated all Schema.org class definitions with latest specifications (HTTP variant)
  - Refreshed vocabulary structure for better performance and maintainability
- **Code quality improvements**: Applied latest linting rules and formatting standards

## [0.4.4] - 2025-08-11

### Fixed
- **Version alignment**: Updated version to maintain consistency with core packages for PIM vocabulary export fix
  - No functional changes to Schema.org HTTP vocabulary classes

## [0.4.3] - 2025-07-30

### Added
- Enhanced Person and Patient classes with PIM vocabulary properties  
  - `pimMasterWorkspace`: References to master workspace for personal information management
  - `pimPreferencesFile`: Links to user preference configuration files
- Cross-vocabulary integration with W3C PIM namespace for workspace management

### Changed
- Updated vocabulary source configurations to include PIM namespace support
- Improved semantic interoperability between Schema.org and PIM vocabularies

## [0.4.2] - 2025-07-24

### Changed
- Updated README documentation with improved formatting and clarity
- Removed codecov reporting from CI pipeline (not applicable for vocabulary constants)

### Fixed
- Corrected documentation formatting errors and inconsistencies

## [0.4.1] - 2025-07-24

### Added
- Release automation and improved publishing workflow
- Enhanced CI/CD integration with comprehensive testing

### Fixed
- Dependency management and version synchronization
- Publishing order for multi-package releases

## [0.4.0] - 2025-07-24

### Added
- **Initial release** as separate Schema.org (HTTP) package
- Complete Schema.org vocabulary with HTTP URIs
- Optimized for projects specifically requiring Schema.org vocabularies with HTTP URIs
- Package size ~36MB (Schema.org vocabularies only)
- Comprehensive test suite for Schema.org classes and properties

### Migration
- **New package** - use `dart pub add locorda_rdf_terms_schema_http` to install
- Compatible with `locorda_rdf_terms_common` for combined usage
- All Schema.org classes and properties available with HTTP URIs

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
