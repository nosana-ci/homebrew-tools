class NosanaNode < Formula
  desc "The official Nosana Node command-line interface."
  homepage "https://nosana.io/"
  url "https://github.com/nosana-ci/nosana-node/releases/download/v0.3.227/all-files-v0.3.227.tar.gz"
  sha256 "eb479fdfccea059e962e3b26fc7c886ba171015a963dd5083b5efd47f3c402d4"
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
