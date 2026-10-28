class Memorypilot < Formula
  desc "Local memory layer for AI agents (MCP server)"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.11.0.tar.gz"
  version "4.11.0"
  sha256 "12c070e38049c475ab7c9c8ff1cdc20d40825c669e1fe11b39da39b199378efe"
  license :cannot_represent # Soflution Source Available License

  head do
    url "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Soflutionltd/MemoryPilot/releases/download/v4.11.0/MemoryPilot-aarch64-apple-darwin.tar.gz"
      sha256 "a0b517b1689471ca0f807d5333732faa119c4616e59d1d16120a6f80e281cb6c"
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
