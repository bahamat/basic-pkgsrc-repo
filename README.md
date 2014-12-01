# A Basic pkgsrc Repository

This will create a very basic pkgsrc repository, suitable for use with pkgin
and pkg_add. This means that it should support anything that uses pkgsrc.

See <http://www.pkgsrc.org> for more information.

This is meant only for quick and easy repositories. It's not intended to be
"full featured", whatever that means. If you have a few packages and need to
serve them, this might be for you. If you want to run a large scale high 
bandwidth package repository, you might want to look into other options.

# Getting Started

1. Clone this repository to someplace that can be served by a web server.
3. Copy `tgz` package files into this directory with any heirarchy you like.
4. Run `make` to generate package indices.

# Installing pacakges from the repository

Install packages using one of the following forms, where `pkg_name` is simple
package name, not the package file name. In either case dependencies will be
automatically resolved from the same repository or any repositories listed in
`pkg_install.conf` or `pkgin/repositories.conf` (the location of these will
vary by platform, but on SmartOS they're in `/opt/local/etc`).

* `pkg_add http://<webserver>/path/<pkg_name>`
* `PKG_PATH=http://<webserver>/path/ pkg_add <pkg_name>`

# Bug with `pkgin`

Currently `pkgin` has a bug that will cause a segfault when `upgrade` or
`full-upgrade` subcommands are requested if there are any packages installed
that are not listed in the *first* listed pkgin repository in
`pkgin/repositories.conf`.

Before issuing `upgrade` or `full-upgrade` you will need to mark all of your
"external" packages `unkeep`.

Issues filed:

* [NetBSDfr/pkgin#1](https://github.com/NetBSDfr/pkgin/issues/1)
* [joyent/pkgsrc#32](https://github.com/joyent/pkgsrc/issues/32)
