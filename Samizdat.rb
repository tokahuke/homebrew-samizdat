class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/get-samizdat/latest/node/aarch64-apple-darwin/samizdat.tar.gz"
    # sha256 "9e865bbf76bb35abc386223781a2e97142ff879245e8175bfa7cfa9131c2cbe0"
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
