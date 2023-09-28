# quick-media-conv

Scripts for quick ffmpeg/imagemagick conversions on Linux & macOS. These scripts emphasize usability and prioritize getting _a_ result with little thought, rather than providing many ways to customize and perfect the conversion process.

## Usage

```text
TKTK
```

### Options

All scripts accept the following options:

- `-h`, `--help`: Print help and exit.
- `-v`, `--version`: Print version and exit.

## Docker

TKTK

## Installation

### macOS via Homebrew

```shell
brew install cdzombak/oss/quick-media-conv
```

### Debian via PackageCloud

Install my PackageCloud Debian repository if you haven't already:
```shell
curl -s https://packagecloud.io/install/repositories/cdzombak/oss/script.deb.sh?any=true | sudo bash
```

Then install `quick-media-conv` via `apt-get`:
```shell
sudo apt-get install quick-media-conv
```

### Manual installation from build artifacts

Pre-built binaries for are downloadable from each [GitHub Release](https://github.com/cdzombak/quick-media-conv/releases). Debian packages for each release are available as well.

### Build and install locally

```shell
git clone https://github.com/cdzombak/quick-media-conv.git
cd quick-media-conv
make build
```

Then copy the resulting files from `out/` to your desired installation path.

## About

- Issues: https://github.com/cdzombak/quick-media-conv/issues/new
- Author: [Chris Dzombak](https://www.dzombak.com)
    - [GitHub: @cdzombak](https://www.github.com/cdzombak)

## License

LGPLv3; see `LICENSE` in this repository.
