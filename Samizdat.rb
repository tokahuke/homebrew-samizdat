class Samizdat < Formula
    desc "Samizdat: your content, available (installer + updater for the node)"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.3.0"
    url "https://proxy.hubfederation.com/~get-samizdat/0.3.0/aarch64-apple-darwin/samizdat-up/samizdat-up"
    sha256 "5562f1e76c168a5bcadb46da9467dccfa025cbca68a3cab7fa8d92e1c5239bfe"
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
