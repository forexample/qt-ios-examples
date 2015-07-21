# Qt on iOS examples

* mouse events
* touch events
* stylesheets
* analogclock

Originally from: https://github.com/jwintz/qt-ios-examples

# Usage

Download iOS toolchains from [Polly](https://github.com/ruslo/polly):

```bash
> git clone https://github.com/ruslo/polly
> export POLLY_ROOT="`pwd`/polly" # save location to some variable
```

Pick toolchain you need and build. For example `ios-8-4-armv7`:
```bash
> cmake -H. -B_builds/ios-8-4-armv7 -GXcode -DCMAKE_TOOLCHAIN_FILE="${POLLY_ROOT}/ios-8-4-armv7" -DHUNTER_STATUS_DEBUG=ON
```

Same with `build.py` script:
```bash
> export PATH="${POLLY_ROOT}/bin:${PATH}"
> which build.py
> build.py --toolchain ios-8-4-armv7 --verbose
```

# Links

* [Hunter cross-platform package manager](https://github.com/ruslo/hunter)
* [Hunter pkg.qt usage](https://github.com/ruslo/hunter/wiki/pkg.qt)
* [Collection of toolchains](https://github.com/ruslo/polly)
* [iOS toolchain](https://github.com/ruslo/polly/wiki/Toolchain-list#ios)
