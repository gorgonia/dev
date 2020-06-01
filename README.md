# dev

Scripts and helpers for developing Gorgonia

This repository contains tools to help developers who want to contribute to the Gorgonia family of libraries.

# On `GOPATH` #

Gorgonia libraries support Go Modules out of the box. However, the development of Gorgonia is quite reliant on `GOPATH`. This is due to the nature of the libraries (i.e. `gorgonia.org/gorgonia` is a "symbolic" version of `gorgonia.org/tensor`), often developers working on a problem would need to co-develop for multiple libraries at the same time.

There currently isn't a good solution for doing this with Go Modules yet. However, the old `GOPATH` method works well, so a large majority of the scripts (including those `go:generate` scripts found in all the libraries) rely on `GOPATH`.

Users of the Gorgonia library shouldn't worry about `GOPATH` - Gorgonia fully supports modules and plays well with `GOPROXY`

# Go Modules `localdev` #

A helper bash script is available to allow development with Go Modules. Use it as such:

```
./localdev.sh -a true -l PATH/TO/LOCAL/DIRECTORIES
```

There are a few assumptions. First, that all your local gorgonia development work will be under one directory (usually a `src` directory).

So, here's the directory structure that this script works with:

```
.
├── src
|   ├── gorgonia.org
|   |   ├── gorgonia
|   |   ├── tensor
|   |   └── cu
```

Your `PATH/TO/LOCAL/DIRECTORIES` should be to the `src` directory. Then the script takes care of everything else.

This script does not work if you have your libraries checked out to different paths, for example as follows:

```
.
├── gorgonia
├── Other Location
|   ├── tensor
├── Other Location 2
|   ├── Other Location 3
|   |   └── cu
```

But that's a totally psychopathic way of doing things. You ... wouldn't do it like that right? Right?

## `localdev` Options and Arguments ##

* `-a`  is the parameter that indicates that you are working on all the known Gorgonia libraries.
* `-l` is the parameter that indicates the path to your local checked out files.
