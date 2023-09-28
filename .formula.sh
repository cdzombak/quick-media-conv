#!/usr/bin/env bash
set -euo pipefail

if [ -z "$FORMULA_VERSION_NO_V" ]; then
  echo "missing FORUMLA_VERSION_NO_V"
  exit 1
fi
if [ -z "$FORMULA_TGZ_SHA256" ]; then
  echo "missing FORMULA_TGZ_SHA256"
  exit 1
fi

cat << EOF
# typed: true
# frozen_string_literal: true

# This file was automatically generated. DO NOT EDIT.
class QuickMediaConv < Formula
  desc "Scripts for quick ffmpeg/imagemagick conversions"
  homepage "https://github.com/cdzombak/quick-media-conv"
  url "https://github.com/cdzombak/quick-media-conv/releases/download/v${FORMULA_VERSION_NO_V}/quick-media-conv-${FORMULA_VERSION_NO_V}-all.tar.gz"
  sha256 "${FORMULA_TGZ_SHA256}"
  license "LGPL-3.0"

  def install
    bin.install "flv2mp4"
    bin.install "toalac"
    bin.install "tom4a"
    bin.install "tomp4"
    bin.install "tomp4-hq"
    bin.install "tomp4-robust"
    bin.install "topng"
  end

  test do
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/flv2mp4 --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/toalac --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/tom4a --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/tomp4 --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/tomp4-hq --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/tomp4-robust --version"))
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/topng --version"))
  end
end
EOF
