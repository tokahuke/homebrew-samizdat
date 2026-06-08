class Samizdat < Formula
    desc "Samizdat: your content, available (installer + updater for the node)"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.3.3"
    url "https://series-v5bknud2nujn5bmgrmtmxovrncwhedw4a6jtrnhz4yn3ovm2wxjq.hubfederation.com/0.3.3/aarch64-apple-darwin/samizdat-up/samizdat-up"
    sha256 "587a481e9abdc9aa4600af4a101a6f6882305f72dc734005d894e2ddc43655f2"
    license "AGPLv3"
    depends_on arch: :arm64

    def install
        bin.install "samizdat-up"
    end

    def caveats; <<~EOS
        samizdat-up is the cross-platform installer for the Samizdat
        daemons. After `brew install samizdat`, install the node
        service as a launchd daemon with:

            sudo samizdat-up install node

        To uninstall while preserving local data:
            sudo samizdat-up uninstall node
            brew uninstall samizdat

        To wipe series private keys, bookmarks, and cached objects:
            sudo samizdat-up uninstall node --purge

        To upgrade just the daemon binaries:
            sudo samizdat-up update

        Series keys + cached objects live at /var/lib/samizdat/. They
        survive `brew uninstall` and `samizdat-up uninstall` unless
        you pass `--purge`.
    EOS
    end
end
