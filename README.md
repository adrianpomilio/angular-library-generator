# Angular Library Skeleton
This is a shell script that will generate a skeleton to build a standalone Angular library.

## Key Library Concepts
- HOC (Higher Order Components) Principle is the basis of how we construct our applications, modules and components.
- Concise components, they are small building blocks.
- Independent components, the component is not dependent on external modules beyond the Angular core/framework (e.g. avoid dependencies on multiple 3rd party libraries and components).

## How to use this project
This is a seed project to use when creating a standalone Angular library component.


* > git clone
* > copy setup.sh to a different directory
* > ./setup.sh




## Contents produced by the setup script
* tsconfig.json - this file is for setup within your editor and is not used for building or distributing the Library
* README.md - what you are reading now, the documentation for the Library should replace all of this.
* CHANGELOG.md - to keep an accurate changlog for your component
* CONTRIBUTING.md - instructions on how to contribute to the lib and who is CONTRIBUTING
* DEV_ENVIRONMENT.md - instructions on what the dev needs are and how to set it up for local dev
* package.json - installs all the dependencies to contribute and develop the library, this is not used to publish to npm.
* build.sh - builds the library and sets it up for consumption during local development
* .npmignore - ignores the contents listed from npm
* .gitignore - ignores the contents listed from git
* src/
  * tsconfig.json - compiles and builds the actual library with angularCompilerOptions
  * package.json - defines the peerDependencies for the compiled library and is copied to the dist/ during the build script process
  * index.ts - entry point for your library and exports the library module for the build
  * components/
    * ui-library-seed-ng.module.ts - this is an example file of a base module. One module per component
    * ui-library-seed-ng.component.ts - this is an example file of a component. It should have a corresponding module file.
* dist/ - this directory is created by the build.sh, it is what will be published to npm.  Rollup does tree shaking during the build.sh and flattens all the js into one file and provides all the type (.d.ts), and metadata.json files for publishing.
  * package.json - copy from src/ that is used for publishing to npm
  * README.md - copy from src/
  * CHANGELOG.md - copy from src/
* build/ - this drictory contains all the compiled javascript, d.ts, and metadata files when the tsc compiler runs using src/tsconfig.json  




## Additional resources
* [https://www.youtube.com/watch?v=unICbsPGFIA] - terrific video demonstrating some of what we are doing here.
