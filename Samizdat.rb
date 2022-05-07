class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/_series/r0Km0HptEt6Fhosmy7qxaKxyDtwHkzi0-eYbt1WatdM/latest/node/aarch64-apple-darwin/samizdat.tar.gz"
    sha256 "3c60609b6a1064076c1ba7551623cd0f2f88f0908008c0abf348aadff16d7309"
    license "AGPLv3"

    def install
        bin.install "samizdat"
        bin.install "samizdat-node"
    end

    service do
        run [
            opt_bin/"samizdat-node",
            "--data", "/var/lib/samizdat/node/",
            "--hubs", "testbed.hubfederation.com"
        ]
        log_path "/var/log/samizdat-node-stdout.log"
        error_log_path "/var/log/samizdat-node-stderr.log"
        keep_alive true
        restart_delay 1
    end
end
