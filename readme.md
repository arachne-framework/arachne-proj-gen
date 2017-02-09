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

## Building a template

Templates have to satisfy a few requirements.

1. They need to have a `.template-name` file in their root, containing the fully-qualified name of the template (e.g `com.my-org/my-template`). This is used as the basis for renaming the project.
2. Both the template namespaces (e.g `com.my-org` and the template name `my-template`) should not conflict with any other names in the template, since they will be replaced via simple text substitution. This is why Arachne's core templates have a NS of `org.arachne-framework.template` instead of `org.arachne-framework`: So all the other legitimate instances of `org.arachne-framework` in the app don't get replaced.
3. Both the namespace and the name should have a hyphen. This is admittedly an odd requirement, but it guarantees that the replacement script is able to disambiguate instances that should be replaced with an underscore from those that should not, and it is transparent to the user.
