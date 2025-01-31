# Dark Aperture Theme for Piwigo

A mobile-ready [Piwigo](http://piwigo.org) theme based on [Bootstrap 4](https://getbootstrap.com).

By [Andrew Johnson](http://andyjohnson.uk). See the repo at [https://github.com/andyjohnson0/dark-aperture-theme](https://github.com/andyjohnson0/dark-aperture-theme)

Based on [Bootstrap Darkroom theme](https://github.com/Piwigo/piwigo-bootstrap-darkroom) which is Copyright 2017 by Thomas Kuther. 
The original author and contributors are thanked for their work.
This derivative work created in accordance with the Apache 2.0 [licence](LICENSE.txt).


## Features

* Various color styles
  * [Bootswatch](https://bootswatch.com)
  * [Material Design](https://mdbootstrap.com/)
  * Darkroom: a dark, low contrast color scheme based on Lightroom® colors (the default)
* Optional page header with fancy fading full width background image, or a jumbotron banner
* Different layout option for the picture details page
* Video support using native HTML 5 video widget
* Fullscreen slideshow view using [PhotoSwipe](http://photoswipe.com)
  * Supports auto play
  * Supports HTML5 video
  * Album thumbnails can be linked to PhotoSwipe directly (like smartpocket)
* Configurable carousel album navigation on the picture page using [slick slider](https://kenwheeler.github.io/slick/)
* 100% mobile ready
  * fully responsive Navbars, Carousel, PhotoSwipe slideshow, video content
  * async/ondemand loading of carousel & PhotoSwipe content, adaptive image size selection, swipe & tap events
* Various configuration options
* Easy customization using CSS overrides or SASS custom build for advanced needs.
* Localised in 25 languages using [Smarty](https://www.smarty.net/) support in Piwigo
 

## Usage

1. Build as described below
2. Upload or copy the repo root directory, excluding the `.git` directory into `themes/dark_aperture` on the target
system.
3. Enable Dark Aperture theme
4. Disable the smartpocket theme (it's enabled by default). This is required in order to use Dark Aperture by default on mobile devices, too.


## Development & Customizing

This fork has been modified to build on Windows. The `build:material` and `build:bootswatch` node scripts will need to
be modified to build on other operating systems. See the [forked repo](https://github.com/Piwigo/piwigo-dark-aperture) for information.

### Dependencies

Many of the dependencies are quite old. For this reason, dependencies in `package.json` have been pinned to specific versions numbers
to prevent automatic upgrade to non-compatible versions.

### Prerequisites

1. Install [node.js v11.15.0-x64](https://nodejs.org/download/release/v11.15.0/).
This is the most recent version that [supports none-sass v4.11.0](https://github.com/sass/node-sass#node-version-support-policy)

2. In Visual Studio Installer, install “Desktop development with C++” workload. Ensure that "Windows 10 SDK" is installed.
This is required to enable some packages to be re-built.

3. Install [Python-2.7.18](https://www.python.org/downloads/release/python-2718/) in `C:\Program Files (x86)\Python27\`.
Some dependencies require Python 2 and this is the latest, and likely the last, version. Do not add it to the path unless
you understand the implications of doing so.

4. Install and configure Yarn with:
- `npm install yarn -g`
- `yarn config set python "C:\Program Files (x86)\Python27\python.exe"`

### Build Process

To build for development:

1. `yarn install`

2. In an admin command window, execute the Windows command `mklink /d "%CD%\node_modules\~bootstrap" "%CD%\node_modules\bootstrap"`
from the repo root directory. This aliases `node_modules\~bootstrap` to `node_modules\bootstrap` and is required to be able to build
Bootstrap Material Design, which contains paths with a `~` suffix.

3. `yarn build`

To build for deployment:

1. Yarn install

2. Alias `~bootstrap` to `bootstrap` as described above.

3. `yarn install --production`

4. Upload or copy the repo root directory, excluding the `.git` directory into `themes/dark_aperture` on the target
system.


## Credits

Based on [Bootstrap Darkroom theme](https://github.com/Piwigo/piwigo-dark-aperture) by Thomas Kuther. The original author is thanked
for their work. This derivative work created in accordance with the [licence](LICENSE.txt).

Logo by [Gabriele Malaspina](https://www.svgrepo.com/svg/488838/camera). Public domain licensed.

Photography icons by [Dmitry Baranovskiy](https://thenounproject.com/DmitryBaranovskiy/)</a>,
licensed under [Creative Commons 3.0](https://creativecommons.org/licenses/by/3.0/us/)


## License

```
Based on original work copyright 2017 Thomas Kuther

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
