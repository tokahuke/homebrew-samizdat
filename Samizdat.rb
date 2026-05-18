class Samizdat < Formula
    desc "Samizdat: your content, available (installer + updater for the node)"
    homepage "https://github.com/tokahuke/samizdat"
    version "0.1.0"
    url "https://proxy.hubfederation.com/~get-samizdat/latest/aarch64-apple-darwin/samizdat-up/samizdat-up"
    license "AGPLv3"
    depends_on arch: :aarch64

    def install
        # Brew sees the URL as a single file (no extraction); rename to
        # /usr/local/bin/samizdat-up (or HOMEBREW_PREFIX/bin/samizdat-up
        # on Apple Silicon).
        bin.install Pathname(@downloader.cached_location) => "samizdat-up"
    end

    def caveats; <<~EOS
        samizdat-up is the cross-platform installer for the Samizdat
        daemons. After `brew install samizdat`, install the node
        service as a launchd daemon with:

            sudo samizdat-up install node

        Other components (Linux only; left here for reference):
            sudo samizdat-up install hub
            sudo samizdat-up install proxy

        To uninstall while preserving local data:
            sudo samizdat-up uninstall node
            brew uninstall samizdat

        To wipe series private keys, bookmarks, and cached objects:
            sudo samizdat-up uninstall node --purge

        To upgrade just the daemon binaries (without touching
        samizdat-up itself):
            sudo samizdat-up update

        Series keys + cached objects live at /var/lib/samizdat/. They
        survive `brew uninstall` and `samizdat-up uninstall` unless you
        pass `--purge`.
    EOS
    end
end
