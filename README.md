<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### phpbrew
[phpbrew] integration for [Oh My Fish][omf].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

<br/>

A lightweight [phpbrew] plugin that provides integration with Fish shell. This plugin is designed to be much more performant than the official phpbrew Fish integration, and not all phpbrew features are available.


## Install
Installation with [Oh My Fish][omf]:

    omf install phpbrew


## Usage
See the [phpbrew] documentation for full details.


## Unsupported features
Here are the phpbrew features that are currently **not** supported by this plugin:

- `.phpbrewrc` files
- PHP-FPM integration
- PHP version info prompt via `$PHPBREW_SET_PROMPT`
- Quick directory commands (such as `phpbrew build-dir`)


## License
[MIT][mit] © [Stephen Coakley][author] et [al][contributors]. Includes some code from the official phpbrew scripts, which are © Yo-An Lin under the MIT license.


[author]: http://github.com/coderstephen
[contributors]: https://github.com/oh-my-fish/plugin-config/graphs/contributors
[license-badge]: https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[mit]: http://opensource.org/licenses/MIT
[omf]: https://www.github.com/oh-my-fish/oh-my-fish
[phpbrew]: http://phpbrew.github.io/phpbrew/
