class NosanaNode < Formula
  desc "The official Nosana Node command-line interface."
  homepage "https://nosana.io/"
  url "https://github.com/nosana-ci/nosana-node/releases/download/v0.3.127/all-files-v0.3.127.tar.gz"
  sha256 "1a439c2b65fc6702c3f55be5b25e69b81c6820a9ee7a22a8fbe1b339b9507b09"
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
