```markdown
# eko-claude-plugins Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches the core development patterns and conventions used in the `eko-claude-plugins` repository. The codebase is written in TypeScript without a specific framework, and emphasizes clear file organization, consistent import/export styles, and conventional commit messages. This guide covers file naming, code style, commit practices, and testing patterns to help you contribute effectively.

## Coding Conventions

### File Naming
- **Pattern:** PascalCase for all file names.
- **Example:**  
  ```
  MyPlugin.ts
  PluginManager.test.ts
  ```

### Import Style
- **Pattern:** Use relative imports for all module references.
- **Example:**
  ```typescript
  import { PluginManager } from './PluginManager';
  ```

### Export Style
- **Pattern:** Use named exports rather than default exports.
- **Example:**
  ```typescript
  // In PluginManager.ts
  export function PluginManager() { ... }
  ```

### Commit Messages
- **Pattern:** Conventional commits with prefixes (e.g., `docs:`).
- **Average Length:** ~81 characters.
- **Example:**
  ```
  docs: update PluginManager usage example in README
  ```

## Workflows

### Conventional Commit Workflow
**Trigger:** When committing changes to the repository  
**Command:** `/conventional-commit`

1. Write your commit message using the conventional commit format.
2. Use a prefix such as `docs:` to indicate the type of change.
3. Keep the message concise but descriptive (around 80 characters).
4. Example:
   ```
   docs: add usage instructions for new plugin loader
   ```

### Adding a New Plugin
**Trigger:** When implementing a new plugin  
**Command:** `/add-plugin`

1. Create a new TypeScript file using PascalCase (e.g., `MyNewPlugin.ts`).
2. Use relative imports to include dependencies.
3. Export your plugin using named exports.
4. Write corresponding tests in a file named `MyNewPlugin.test.ts`.

### Writing Tests
**Trigger:** When adding or updating functionality  
**Command:** `/write-test`

1. Create a test file with the pattern `*.test.ts` (e.g., `PluginManager.test.ts`).
2. Write tests using the project's preferred testing framework (unspecified).
3. Use relative imports to import the module under test.

## Testing Patterns

- **Test File Naming:** Use the pattern `*.test.ts` for all test files.
- **Location:** Tests are placed alongside the modules they test.
- **Framework:** Not explicitly detected; follow existing patterns.
- **Example:**
  ```typescript
  // PluginManager.test.ts
  import { PluginManager } from './PluginManager';

  describe('PluginManager', () => {
    it('should register a plugin', () => {
      // test implementation
    });
  });
  ```

## Commands
| Command                | Purpose                                              |
|------------------------|------------------------------------------------------|
| /conventional-commit   | Guide for writing conventional commit messages       |
| /add-plugin            | Steps to add a new plugin module                     |
| /write-test            | Instructions for writing and organizing test files   |
```
