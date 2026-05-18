class Samizdat < Formula
    desc "Samizdat: your content, available (installer + updater for the node)"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.2.0"
    url "https://proxy.hubfederation.com/~get-samizdat/0.2.0/aarch64-apple-darwin/samizdat-up/samizdat-up"
    sha256 "6b793d0a833c16046c08cba719ffd63171b188b8faf2d138d8f27f09acc2748d"
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
