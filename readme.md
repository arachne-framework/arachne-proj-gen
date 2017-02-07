# Arachne Project Generator

This is a simple script which makes it easy to generate Arachne projects based on a template

## Installation

To install:

````bash
    curl https://raw.githubusercontent.com/arachne-framework/arachne-proj-gen/release/arachne.sh > ~/bin/arachne
    chmod +x ~/bin/arachne
````

## Usage

Usage: `arachne <operation> <arguments>`

Supported operations:

`new <name> <template>`

Create a new Arachne project with the given name, based on the provided template.

The name must be a fully-qualified project name (e.g, 'com.company/my-proj').

The template should be the clonable URI of a git repository to use as a template.

`update`

 update this initialization script

`version`

 Print out the version of this initialization script
