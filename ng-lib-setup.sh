#!/bin/bash

# Ask for library name
read -p 'Library name: ' libnamevar
read -p 'Library description: ' libdescriptionvar
echo
echo Setting up library: $libnamevar version 0.0.1
mkdir $libnamevar
echo $libnamevar directory created
cd $libnamevar
mkdir test
mkdir src
mkdir src/components

echo Directory structure created

echo TypeScript setup started

echo '{
  "compilerOptions": {
    "baseUrl": "./src",
    "experimentalDecorators": true,
    "moduleResolution": "node",
    "rootDir": "./src",
    "lib": ["es2015", "dom"],
    "skipLibCheck": true,
    "types": []
  }
}' > tsconfig.json

echo '{
  "compilerOptions": {
    "declaration": true,
    "module": "es2015",
    "target": "es5",
    "baseUrl": ".",
    "stripInternal": true,
    "experimentalDecorators": true,
    "moduleResolution": "node",
    "outDir": "../build",
    "rootDir": ".",
    "lib": ["es2015", "dom"],
    "skipLibCheck": true,
    "types": []
  },
  "files": [
    "./index.ts"
  ],
  "angularCompilerOptions": {
    "strictMetadataEmit": true,
    "skipTemplateCodegen": true
  }
}
' > src/tsconfig.json

echo tsconfig.json files created

#### npm package.json files and ignore file setup
echo npm setup started ...

echo '{
    "name": "'"$libnamevar"'",
    "version": "0.0.1",
    "description": "'"$libdescriptionvar"'",
    "author": "mapp.com",
    "license": "ISC",
    "devDependencies": {
          "@angular/compiler": "^4.3.0",
          "@angular/compiler-cli": "^4.3.0",
          "@angular/core": "^4.3.0",
          "@angular/common": "^4.3.0",
          "rollup": "^0.41.6",
          "rxjs": "^5.1.0",
          "typescript": "~2.3.3",
          "zone.js": "^0.8.4"
    }
}' > package.json

echo '{
  "name": "'"$libnamevar"'",
  "version": "0.0.1",
  "description":"'"$libdescriptionvar"'",
  "author": "mapp.com",
  "license": "ISC",
  "module": "index.js",
  "peerDependencies": {
    "@angular/core": "^4.3.0",
    "@angular/common": "^4.3.0",
    "rxjs": "^5.1.0",
    "zone.js": "^0.8.4"
  }
}' > src/package.json

echo package.json files created...

echo 'node_modules/' > .npmignore

########  build.sh file and permissions
echo Create utilities

echo '# Clean up previous distributions
rm -rf dist
rm -rf build

# Variables
NGC="node node_modules/.bin/ngc"
ROLLUP="node node_modules/.bin/rollup"

# Run Angular Compiler
$NGC -p src/tsconfig.json
# Rollup index.js to ui-badge-ng.js
$ROLLUP build/index.js -o dist/index.js


# Copy non-js files from build
rsync -a --exclude=*.js build/ dist

# Copy library package.json and README.md
cp src/package.json dist/package.json
cp README.md dist/README.md
cp CHANGELOG.md dist/CHANGELOG.md
' > build.sh
chmod +x build.sh

echo build.sh file created...

### Angular ts files
echo 'export * from '"'"'./components/'$libnamevar'.module'"'"';' > src/index.ts
echo '// your module code goes here' > src/components/$libnamevar.module.ts
echo '// your component code goes here' > src/components/$libnamevar.component.ts
echo TypeScript placeholder files completed

### Markdown files created
echo '#'$libnamevar' ng library' > README.md
echo README.md created

echo '# CHANGELOG for '$libnamevar' ng library' > CHANGELOG.md
echo CHANGELOG.md created

echo '# Developer guide' > DEV_ENVIRONMENT.md
echo DEV_ENVIRONMENT.md created

echo '# Contributing' > CONTRIBUTING.md
echo CONTRIBUTING.md created

### npm install
pwd
npm install


### git setup
echo 'dist
build
node_modules' > .gitignore



echo Cleaning up..
