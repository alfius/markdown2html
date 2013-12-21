#Gollum Export

<a href="http://www.omniref.com/ruby/gems/gollum-export"><img src="http://assets2.omniref.com/assets/logo-1e25ba89780a42da4556dd96c03ac954.png" height="18" width="75"></a>

##Overview

This gem includes the `gollum-export` command that allows converting local markdown files to html. It also includes a switch to download and convert a full wiki from a github repo.

##Installation

```bash
  $ gem install gollum-export
```

##Usage

Local conversion:

```bash
  gollum-export file1.md file2.md ...
```

Download and convert a github wiki:

```bash
  gollum-export plataformatec/devise
```
