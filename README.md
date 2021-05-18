### create-react-app-bash-script

A simple helper script to create a React boilerplate app, using Enzyme and Nightwatch for testing.

#### Requirements
The script interally calls the [Create React App](https://reactjs.org/docs/create-a-new-react-app.html) script which requires `npx` and `npm`. More information can be found in the installation section of the Github React repository [here](https://github.com/facebook/react#installation).

#### How to use
Simply call the script from the command line as follows:
```sh
create-react-app.sh
```
You will be prompted for a project name - the project name must match [npm naming restrictions](https://docs.npmjs.com/cli/v7/configuring-npm/package-json#name), for example the name must not have any uppercase letters.

You can then use [yarn](https://github.com/yarnpkg/yarn) or [npm](https://github.com/npm/cli) to begin using your React app - enjoy!