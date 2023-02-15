class NosanaNode < Formula
  desc "Nosana Node toolkit"
  homepage "https://nosana.io/"
  url "https://github.com/sjoerd-dijkstra/nosana-node/releases/download/v0.0.23/all-files-v0.0.23.tar.gz"
  sha256 "ece6fcb654b42a92c2ad1818038c8d6c912126e4b7a2be840aae3951b26eb2d4"
  license "MIT-Modern-Variant"
  head "https://github.com/nosana-ci/nosana-node.git", branch: "main"

  depends_on "openjdk"

  def install

    jar = "nosana-node-v#{version}"

    system "shasum", "-c", "#{jar}.sha256sum"

    mkdir_p libexec/"lib"
    mv "#{jar}", libexec/"lib/#{jar}"

    bin.write_jar_script libexec/"lib/#{jar}", "nosana-node"

    ohai "🤓 Check the toolkit docs 📘 out at https://docs.nosana.io"
  end

end
