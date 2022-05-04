class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/_series/r0Km0HptEt6Fhosmy7qxaKxyDtwHkzi0-eYbt1WatdM/samizdat/latest/node/samizdat.tar.gz"
    sha256 :no_check
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
