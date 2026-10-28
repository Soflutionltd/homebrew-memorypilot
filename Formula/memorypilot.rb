class Memorypilot < Formula
  desc "Local memory layer for AI agents (MCP server)"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.13.0.tar.gz"
  version "4.13.0"
  sha256 "49458eb00dedbff7524bc56a5314308b9f0b807cde105ec336c8378a29c3828d"
  license :cannot_represent # Soflution Source Available License

  head do
    url "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Soflutionltd/MemoryPilot/releases/download/v4.13.0/MemoryPilot-aarch64-apple-darwin.tar.gz"
      sha256 "87bc30deadb201ca9267bffbe327985a7c0a1a8c68174b641065ec060f952564"
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
