class Memorypilot < Formula
  desc "Local memory layer for AI agents (MCP server)"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.12.0.tar.gz"
  version "4.12.0"
  sha256 "224e10832dab9e9b8c08648466ee493b073553c509278a721d6f1a8ddf7afc37"
  license :cannot_represent # Soflution Source Available License

  head do
    url "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Soflutionltd/MemoryPilot/releases/download/v4.12.0/MemoryPilot-aarch64-apple-darwin.tar.gz"
      sha256 "c8b8b1be50cb3c4dbc2280f4b6fa25c9864798747443ca8ea0e5b4429de96f7b"
    end
    on_intel do
      depends_on "rust" => :build
    end
  end

  on_linux do
    depends_on "rust" => :build
  end

  def install
    if OS.mac? && Hardware::CPU.arm? && build.stable?
      bin.install "MemoryPilot"
    else
      system "cargo", "install", *std_cargo_args(path: "."), "--features", "http", "--bin", "MemoryPilot"
    end
  end

  test do
    assert_match "memorypilot", shell_output("#{bin}/MemoryPilot --version")
  end
end
