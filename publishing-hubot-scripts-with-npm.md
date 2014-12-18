# Setting up Hubot scripts with NPM

## Register with npm

create account at npmjs.com

```bash
npm set init.author.name "Michi Kono"
npm set init.author.email "michikono@gmail.com.com"
npm set init.author.url "https://github.com/michikono"
npm adduser
```

## Set up your folders

### Properly place your scripts

Move your script from `/scripts/[script name]` to `/src/[script name]`

Update `package.json` to have these lines:

```json
    "main": "index.coffee",
    "devDependencies": {
        "coffee-script": "~1.6",
        "mocha": "*",
        "chai": "*",
        "sinon-chai": "*",
        "sinon": "*",
        "grunt-mocha-test": "~0.7.0",
        "grunt-release": "~0.6.0",
        "matchdep": "~0.1.2",
        "grunt-contrib-watch": "~0.5.3"
    },
    "scripts": {
        "test": "grunt test"
    },
```

Create `index.coffee`:

```coffeescript
fs = require 'fs'
path = require 'path'

module.exports = (robot, scripts) ->
  scriptsPath = path.resolve(__dirname, 'src')
  fs.exists scriptsPath, (exists) ->
    if exists
      for script in fs.readdirSync(scriptsPath)
        if scripts? and '*' not in scripts
          robot.loadFile(scriptsPath, script) if script in scripts
        else
          robot.loadFile(scriptsPath, script)
```

### Create tests

Create a `test` folder and in it, place your test file(s). If you have none, create `/test/[script name]`:

```coffeescript
chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe '[script name]', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/[script name]')(@robot)

  it 'compiles', ->
    true
```


### Make sure it works by running these commands

```bash
npm run boostrap
npm run test
```

You should see test output (if not, make sure those files are executable and try again):

>    Running "mochaTest:test" (mochaTest) task
>
>
>      [script name]
>        ✓ compiles
>
>
>      1 passing (71ms)

Commit everything.

## Publish your project at npm

```bash
cd /path/to/your-project
npm init
npm publish ./


## Adding it to a bot

Install it into your bot.

```bash
npm install [script-name] --save
```

Add the script into your `external-scripts.json` file:

```json
[
  "[SCRIPT-NAME]"
]
```

You can also submit your script to https://github.com/hubot-scripts/packages

If you do this, your users will be able use your script WITHOUT `npm install` and instead place its name inside
`hubot-scripts.json`. For example:

```json
["redis-brain.coffee", "shipit.coffee", "whatis.coffee", "[your-script].coffee"]
```

More details here: https://github.com/github/hubot/blob/master/docs/scripting.md#anatomy-of-script-loading

