## 0.11.0

**Stable Release** - Graduate package to production-ready status.

### Documentation
- Add 'Why Not Just Use Strings?' section highlighting type-safety benefits and cross-vocabulary property discovery
- Comprehensive documentation overhaul for locorda organization migration
- Improve vocabulary generator guide in CONTRIBUTING.md with step-by-step instructions
- Professional README improvements with corrected package information and better structure
- Document Cross-Vocabulary Properties feature with practical examples

### Project
- Migrate from github.com/kkalass/rdf_vocabularies to locorda/rdf-vocabularies ecosystem
- Update all repository URLs and documentation links to locorda.dev domain
- Copyright updated to 2025-2026
- Rename melos script 'build' to 'generate' for clarity

## [0.4.5] - 2025-09-23

### Changed
- **Dependency updates**: Updated all underlying packages with locorda_rdf_core ^0.9.15 and locorda_rdf_terms_generator ^0.9.2
- **Vocabulary regeneration**: All vocabulary files regenerated with latest code generation improvements
  - Enhanced code generation with improved type safety and documentation
  - Updated all core and Schema.org vocabulary class definitions
  - Refreshed vocabulary structure across all packages for better performance
- **Package dependencies**: Updated to locorda_rdf_terms_common 0.4.5, locorda_rdf_terms_schema 0.4.5, and locorda_rdf_terms_schema_http 0.4.5
- **Code quality improvements**: Applied latest linting rules and formatting standards across all packages

## [0.4.4] - 2025-08-11

### Fixed
- **PIM vocabulary export**: Added missing PIM (Personal Information Management) vocabulary export to public API
  - PIM vocabulary is now accessible via `import 'package:locorda_rdf_terms/pim.dart'`
  - Includes all PIM workspace and storage management classes

### Changed
- Updated dependencies to locorda_rdf_terms_common 0.4.4 with fixed PIM exports

## [0.4.3] - 2025-07-30

### Added
- **PIM vocabulary support**: Added complete W3C Personal Information Management (PIM) vocabulary integration through updated dependencies
- Enhanced agent classes across all vocabularies with PIM properties (masterWorkspace, preferencesFile)

### Changed
- Updated dependencies to locorda_rdf_terms_common 0.4.3 with PIM vocabulary support
- Updated dependencies to locorda_rdf_terms_schema 0.4.3 with enhanced agent classes
- Updated dependencies to locorda_rdf_terms_schema_http 0.4.3 with enhanced agent classes

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
- Streamlined dependency management for multi-package releases

### Fixed
- Meta-package dependency synchronization
- Publishing order to ensure core packages are available before meta-package updates

## [0.4.0] - 2025-07-24

### Added
- **Multi-package architecture** support as meta-package
- Re-exports all vocabularies from specialized packages:
  - `locorda_rdf_terms_common` - Core RDF vocabularies (~5MB)
  - `locorda_rdf_terms_schema` - Schema.org HTTPS vocabularies (~35MB)
  - `locorda_rdf_terms_schema_http` - Schema.org HTTP vocabularies (~36MB)
- Comprehensive test suites across all packages
- Class-specific examples and documentation

### Changed
- **Package structure**: Now acts as meta-package that re-exports all vocabularies
- **Dependencies**: Uses path dependencies to specialized packages
- **Size optimization**: Users can choose individual packages for smaller footprint

### Migration
- **100% API compatibility maintained** - no code changes required for existing users
- All import statements remain unchanged
- Users can optionally switch to individual packages (`locorda_rdf_terms_common`, etc.) for size optimization

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
