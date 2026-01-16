# Contributing to rdf-vocabularies

Thank you for your interest in contributing to `rdf-vocabularies`! We welcome contributions of all kinds—bug reports, feature requests, documentation improvements, and code.

## How to Contribute

1. **Fork the repository** and create your branch from `main`.
2. **Open an issue** to discuss your idea, bug, or feature request if it is significant.
3. **Write tests** for any new features or bug fixes.
4. **Run `dart analyze` and `dart test`** to ensure code quality and correctness.
5. **Submit a pull request** with a clear description of your changes and why they are needed.

## 🛠 Working with the Vocabulary Generator

Most packages in this repository are **automatically generated** from RDF ontology files. To ensure consistency and maintainability, follow these step-by-step guidelines.

### 🚫 Do Not Edit Generated Files
Never manually edit `.dart` files in `lib/src/vocab/generated/` folders. These are produced by `locorda_rdf_terms_generator` and will be overwritten on the next generation run.

### ➕ Adding a Vocabulary

#### Step 1: Choose Your Target Package

Select which package should contain the new vocabulary:
- **`locorda_rdf_terms_common`** - For widely-used semantic web vocabularies (FOAF, Dublin Core, etc.)
- **`locorda_rdf_terms_schema`** - For Schema.org vocabularies (HTTPS URIs)
- **`locorda_rdf_terms_schema_http`** - For Schema.org vocabularies (HTTP URIs)
- **Create a new package** - For domain-specific vocabularies (e.g., `locorda_rdf_terms_fibo` for financial industry)

#### Step 2: Initialize Configuration (New Packages Only)

If creating a new package, initialize it with a blueprint configuration:

```bash
cd packages/your_new_package
dart run locorda_rdf_terms_generator init
```

This creates a starter `lib/src/vocabularies.json` configuration file.

#### Step 3: Configure the Vocabulary

Edit `lib/src/vocabularies.json` in your target package.

**Option A: Using a Pre-configured Vocabulary**

List available pre-configured vocabularies:
```bash
dart run locorda_rdf_terms_generator list
```

Add a simple entry to enable generation:
```json
{
  "gs1": {
    "generate": true
  }
}
```

**Option B: Adding a Custom Vocabulary**

For vocabularies not in the pre-configured list:

```json
{
  "myOntology": {
    "type": "file",
    "namespace": "https://example.com/ontology#",
    "source": "file://path/to/ontology.ttl",
    "generate": true
  },
  "exampleUrlBased": {
    "type": "url",
    "namespace": "https://example.com/vocab#",
    "source": "https://example.com/vocab.ttl",
    "generate": true
  },
  "exampleWithAllOptions": {
    "type": "url",
    "namespace": "https://example.com/advanced#",
    "source": "https://example.com/advanced.ttl",
    "contentType": "text/turtle",
    "parsingFlags": [
      "allowPrefixWithoutAtSign"
    ],
    "generate": true
  }
}
```

**Configuration Options:**
- `type`: `"file"` (local file) or `"url"` (remote ontology)
- `namespace`: The vocabulary's namespace URI
- `source`: Path to the ontology file or URL
- `contentType`: (Optional) MIME type - defaults to auto-detection
- `parsingFlags`: (Optional) Parser flags for non-standard RDF files
- `generate`: Set to `true` to include in code generation

#### Step 4: Create Export File

Create a file in `lib/` named after the vocabulary prefix (snake_case), e.g., `lib/acl.dart`:

```dart
export 'src/vocab/generated/acl.dart';
export 'src/vocab/generated/acl/index.dart';
```

**Naming Convention:** Use the lowercase, snake_case version of the vocabulary prefix:
- `foaf` → `lib/foaf.dart`
- `dcterms` → `lib/dcterms.dart`
- `schema` → `lib/schema.dart`

#### Step 5: Run the Generator

Generate the vocabulary code:

```bash
melos run generate
```

This processes all `vocabularies.json` configurations across the workspace and generates the Dart constants.

#### Step 6: Include in Meta-Package (If Applicable)

If the vocabulary should be part of `locorda_rdf_terms`:

1. Add your package as a dependency in `packages/locorda_rdf_terms/pubspec.yaml`
2. Create a corresponding export file in `packages/locorda_rdf_terms/lib/`

#### Step 7: Test Your Changes

Add test cases in the package's `test/` folder:

```dart
import 'package:your_package/your_vocab.dart';
import 'package:test/test.dart';

void main() {
  test('vocabulary constants are accessible', () {
    expect(YourVocab.someProperty, isNotNull);
    expect(YourVocab.someProperty.value, contains('your-namespace'));
  });
}
```

Run tests to verify:
```bash
melos test
```

### 🔄 Updating an Existing Vocabulary

1. Update the `source` path or URL in `lib/src/vocabularies.json`
2. Run `melos run generate`
3. Review the generated changes
4. Run tests to ensure compatibility

### 🔧 Improving Generator Logic

If you find structural issues with generated code (incorrect naming, missing metadata, formatting bugs), the fix must be applied to the generator itself:

👉 **[locorda/rdf/packages/locorda_rdf_terms_generator](https://github.com/locorda/rdf/tree/main/packages/locorda_rdf_terms_generator)**

## Code Style
- Follow Dart best practices and formatting (`dart format`).
- Write clear, concise documentation for public APIs.
- Include usage examples where relevant.

## Community
- Be respectful and constructive in all interactions.
- See the [AI Policy](README.md#ai-policy) for how we leverage generative AI.

## License
By contributing, you agree that your contributions will be licensed under the MIT License.

---

Happy coding!
