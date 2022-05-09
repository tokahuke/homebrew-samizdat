class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/_series//latest/node/aarch64-apple-darwin/samizdat.tar.gz"
    sha256 "c4f63c362cfdff68b3979e8d268e9ba3c9d93187550ba81ce34fd435dc299a1d"
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
