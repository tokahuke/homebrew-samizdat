class Samizdat < Formula
    desc "Samizdat: your content, available"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/_series/r0Km0HptEt6Fhosmy7qxaKxyDtwHkzi0-eYbt1WatdM/latest/node/aarch64-apple-darwin/samizdat.tar.gz"
    # sha256 "4fbb5a93d8ef87339782736bba1bdbc05f9bd646b95b4fddd8d5c356083fb4c7"
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
