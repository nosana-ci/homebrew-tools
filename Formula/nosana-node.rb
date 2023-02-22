class NosanaNode < Formula
  desc "The official Nosana Node command-line interface."
  homepage "https://nosana.io/"
  url "https://github.com/nosana-ci/nosana-node/releases/download/v0.3.110/all-files-v0.3.110.tar.gz"
  sha256 "780056db251c6f064e8087487d04a1fd6b10cbaba8c1b45254876c4c70d3f2a0"
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
