class NosanaNode < Formula
  desc "The official Nosana Node command-line interface."
  homepage "https://nosana.io/"
  url "https://github.com/sjoerd-dijkstra/nosana-node/releases/download/v0.0.23/all-files-v0.0.23.tar.gz"
  sha256 "ece6fcb654b42a92c2ad1818038c8d6c912126e4b7a2be840aae3951b26eb2d4"
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
