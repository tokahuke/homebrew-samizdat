class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    url "https://proxy.hubfederation.com/_series/r0Km0HptEt6Fhosmy7qxaKxyDtwHkzi0-eYbt1WatdM/samizdat/$VERSION/node/samizdat.tar.gz"
    sha256 :no_check
    license "AGPLv3"

    def install
        bin.install "samizdat"
        bin.install "samizdat-node"
    end
end
