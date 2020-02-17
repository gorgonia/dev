# dev

Scripts and helpers for developing Gorgonia

This repository contains tools to help developers who want to contribute to the Gorgonia family of libraries.

# On `GOPATH` #

Gorgonia libraries support Go Modules out of the box. However, the development of Gorgonia is quite reliant on `GOPATH`. This is due to the nature of the libraries (i.e. `gorgonia.org/gorgonia` is a "symbolic" version of `gorgonia.org/tensor`), often developers working on a problem would need to co-develop for multiple libraries at the same time.

There currently isn't a good solution for doing this with Go Modules yet. However, the old `GOPATH` method works well, so a large majority of the scripts (including those `go:generate` scripts found in all the libraries) rely on `GOPATH`.

Users of the Gorgonia library shouldn't worry about `GOPATH` - Gorgonia fully supports modules and plays well with `GOPROXY`
