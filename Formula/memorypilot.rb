class Memorypilot < Formula
  desc "Local memory layer for AI agents (MCP server)"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.14.0.tar.gz"
  version "4.14.0"
  sha256 "f46d2af2eb3943f337f770f7a1726d7fc1df6e7acdcc462b72db6573cc6c23b7"
  license :cannot_represent # Soflution Source Available License

  head do
    url "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"
    depends_on "rust" => :build
  end

  on_macos do
    on_arm do
      url "https://github.com/Soflutionltd/MemoryPilot/releases/download/v4.14.0/MemoryPilot-aarch64-apple-darwin.tar.gz"
      sha256 "08a81d0a5949dcbb389e197d9c9ddfeadc9e29cd139f4182c673e75a5da1e3ec"
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
