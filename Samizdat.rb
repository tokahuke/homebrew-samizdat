class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/get-samizdat/latest/node/aarch64-apple-darwin/samizdat.tar.gz"
    # sha256 "d1a02e06cc82913812b5f4e82b2a56e892cfe4739413163dfbd84a957ee04eb8"
    license "AGPLv3"

    def install
        bin.install "samizdat"
        bin.install "samizdat-node"
    end

    service do
        run [
            opt_bin/"samizdat-node",
            "--data", "/var/lib/samizdat/node/"
        ]
        log_path "/var/log/samizdat-node-stdout.log"
        error_log_path "/var/log/samizdat-node-stderr.log"
        keep_alive true
        restart_delay 1
    end

    def post_install
        system "samizdat", "hub", "new", "testbed.hubfederation.com", "UseBoth"
    end
end
