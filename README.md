# Markdown2Html

## Overview

Convert local markdown files or entire GitHub wikis to html.

## Installation

```bash
  gem install markdown2html
```

## Usage

### Local conversion

```bash
  markdown2html file.md
  markdown2html file1.md file2.md ...
```

The html file will be created in the same directory with a similar name and the `.html` extension.

### GitHub wiki

```bash
  markdown2html plataformatec/devise
```

This command clones the wiki in the current directory and then it converts each md file on it to html.
