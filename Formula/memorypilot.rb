class Memorypilot < Formula
  desc "Fastest local memory layer for AI agents — 99.1% R@5 on LongMemEval-S"
  homepage "https://github.com/Soflutionltd/MemoryPilot"
  url "https://github.com/Soflutionltd/MemoryPilot/archive/refs/tags/v4.2.0.tar.gz"
  sha256 "4ef70a85cecf2d049db24d9d19381b86f77e93b5cfe0c6916d116f669cc58391"
  license :cannot_represent # Soflution Source Available License
  head "https://github.com/Soflutionltd/MemoryPilot.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".", root: prefix), "--features", "http", "--bin", "MemoryPilot"
  end

  test do
    assert_match "memorypilot", shell_output("#{bin}/MemoryPilot --version")
  end
end
