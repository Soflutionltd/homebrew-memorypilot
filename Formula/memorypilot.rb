class Memorypilot < Formula
  desc "Local memory layer for AI agents (MCP server)"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.14.1.tar.gz"
  version "4.14.1"
  sha256 "aebed8795ecc18e57b690c4b4642c812d45e42bbc586f2377fe5a5af55f5650f"
  license :cannot_represent # Soflution Source Available License

  head do
    url "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Soflutionltd/MemoryPilot/releases/download/v4.14.1/MemoryPilot-aarch64-apple-darwin.tar.gz"
      sha256 "c367cf214d2c10d941128b6f26447d7feb107f4769a5b5a8904a680a2965c997"
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
