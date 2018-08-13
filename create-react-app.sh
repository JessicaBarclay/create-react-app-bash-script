#!/bin/bash

#––––– colours –––––#
LIGHTGREEN='\033[1;32m';
BLUE='\033[0;40m';
NOCOLOUR='\033[0m';
#–––––––––––––––––––#

echo "${BLUE}–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––${NOCOLOUR}"

### Read project name from stdin

echo "${LIGHTGREEN}Project name:${NOCOLOUR}";
read NAME;

### Run create react app npm package

echo "${LIGHTGREEN}Creating React application... this may take a while...${NOCOLOUR}";

npx create-react-app $NAME;

echo "${LIGHTGREEN}App created${NOCOLOUR}"

### Move into project and install dependencies

cd $NAME;

echo "${LIGHTGREEN}Installing dependencies... this may take a while...${NOCOLOUR}";

npm install;

echo "${LIGHTGREEN}Dependencies installed${NOCOLOUR}";

### Install and configure Enzyme and Nightwatch for testing

echo "${LIGHTGREEN}Configuring Enzyme and Nightwatch for testing${NOCOLOUR}";

npm install enzyme enzyme-adapter-react-16 chromedriver nightwatch selenium-server-standalone-jar --save-dev;

echo "import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
configure({ adapter: new Adapter() });" > src/setupTests.js

echo 'const seleniumServer = require("selenium-server-standalone-jar");
const chromedriver = require("chromedriver");
module.exports = {
  "src_folders": [
    "src/integration"
  ],
  "output_folder": "./reports",
  "selenium": {
    "start_process": true,
    "server_path": seleniumServer.path,
    "host": "127.0.0.1",
    "port": 4444,
    "cli_args": {
      "webdriver.chrome.driver" : chromedriver.path
    }
  },
  "test_settings" : {
    "default" : {
      "launch_url" : "http://localhost",
      "selenium_port"  : 4444,
      "selenium_host"  : "localhost",
      "desiredCapabilities": {
        "browserName": "chrome",
        "javascriptEnabled": true,
        "acceptSslCerts": true
      }
    }
  }
}' > nightwatch.conf.js;

mkdir src/integration;

echo module.exports = "{
  'Google': function (browser) {
    browser
      .url('https://www.google.co.uk/')
      .waitForElementVisible('body', 2000)
      .assert.title('Google')
      .end();
  }
};" > src/integration/exampleTest.js;

### Complete

echo "${BLUE}                             Done!                             ${NOCOLOUR}";
echo "${BLUE}–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––${NOCOLOUR}"