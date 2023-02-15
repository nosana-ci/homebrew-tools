class NosanaNode < Formula
  desc "The official Nosana Node command-line interface."
  homepage "https://nosana.io/"
  url "https://github.com/sjoerd-dijkstra/nosana-node/releases/download/v0.0.25/all-files-v0.0.25.tar.gz"
  sha256 "f29305eca090021b27b45bca2d5191f2306a1fbe9f2333279479cae043b6d9f3"
  license "MIT-Modern-Variant"
  head "https://github.com/nosana-ci/nosana-node.git", branch: "main"

  depends_on "openjdk"

  def install

    # define jar file
    jar = "nosana-node-v#{version}"

    # verify sha
    system "shasum", "--check", "#{jar}.sha256sum"

    # move jar to libexec
    mkdir_p libexec/"lib"
    mv "#{jar}", libexec/"lib/#{jar}"

    # create nosana-node binary
    bin.write_jar_script libexec/"lib/#{jar}", "nosana-node"

    # docs message
    ohai "🤖 Check the Nosana Node docs 📘 out at https://docs.nosana.io/nodes/start.html"
  end

end
