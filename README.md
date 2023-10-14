# quick-media-conv

Scripts for quick ffmpeg/imagemagick conversions on Linux & macOS. These scripts emphasize usability and prioritize getting _a_ result with little thought, rather than providing many ways to customize and perfect the conversion process.

## Usage

```text
flv2mp4 [OPTIONS] file1 [file2 ...]
toalac [OPTIONS] file1 [file2 ...]
tom4a [OPTIONS] file1 [file2 ...]
tomp4[-hq|-robust] [OPTIONS] file1 [file2 ...]
topng [OPTIONS] file1 [file2 ...]
```

### Options

All scripts accept the following options:

- `-h`, `--help`: Print help and exit.
- `-v`, `--version`: Print version and exit.

## Installation

### macOS via Homebrew

```shell
brew install cdzombak/oss/quick-media-conv
```

### Debian via apt repository

Install my Debian repository if you haven't already:

```shell
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://dist.cdzombak.net/deb.key | sudo gpg --dearmor -o /etc/apt/keyrings/dist-cdzombak-net.gpg
sudo chmod 0644 /etc/apt/keyrings/dist-cdzombak-net.gpg
echo -e "deb [signed-by=/etc/apt/keyrings/dist-cdzombak-net.gpg] https://dist.cdzombak.net/deb/oss any oss\n" | sudo tee -a /etc/apt/sources.list.d/dist-cdzombak-net.list > /dev/null
sudo apt-get update
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

## Docker

Docker images are available for amd64 and arm64 from Docker Hub and GHCR:

```shell
docker pull cdzombak/quick-media-conv:1
docker pull ghcr.io/cdzombak/quick-media-conv:1
```

Commands within the container run in the `/work` directory, so take care to map this volume to the directory on your machine containing media files, and pass filenames to the container's command appropriately. Sample usage:

```text
$ ls mediafiles/
file1.webm  file2.flac

$ docker run --rm -v ./mediafiles:/work cdzombak/quick-media-conv:1 tomp4 file1.webm
$ docker run --rm -v ./mediafiles:/work cdzombak/quick-media-conv:1 toalac file2.flac

$ ls mediafiles/
file1.webm  file1.mp4  file2.flac  file2.alac
```

## About

- Issues: https://github.com/cdzombak/quick-media-conv/issues/new
- Author: [Chris Dzombak](https://www.dzombak.com)
  - [GitHub: @cdzombak](https://www.github.com/cdzombak)

## License

LGPLv3; see `LICENSE` in this repository.
