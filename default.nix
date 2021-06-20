{ pkgs ?  import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "dev";
  buildInputs = with pkgs; [ coreutils lesspipe zsh ];

  # https://nix.dev/anti-patterns/language#reproducability-referencing-top-level-directory-with
  src = builtins.path { path = ./.; name = "dev"; };
  installPhase = ''
    mkdir --parent $out/bin

    install -t $out/bin ${pkgs.zsh}/bin/zsh
    install -t $out/bin ${pkgs.lesspipe}/bin/lesspipe.sh

    install -t $out/bin ${pkgs.coreutils}/bin/coreutils

    install -t $out/bin ${pkgs.coreutils}/bin/'['
    install -t $out/bin ${pkgs.coreutils}/bin/b2sum
    install -t $out/bin ${pkgs.coreutils}/bin/base32
    install -t $out/bin ${pkgs.coreutils}/bin/base64
    install -t $out/bin ${pkgs.coreutils}/bin/basename
    install -t $out/bin ${pkgs.coreutils}/bin/basenc
    install -t $out/bin ${pkgs.coreutils}/bin/cat
    install -t $out/bin ${pkgs.coreutils}/bin/chcon
    install -t $out/bin ${pkgs.coreutils}/bin/chgrp
    install -t $out/bin ${pkgs.coreutils}/bin/chmod
    install -t $out/bin ${pkgs.coreutils}/bin/chown
    install -t $out/bin ${pkgs.coreutils}/bin/chroot
    install -t $out/bin ${pkgs.coreutils}/bin/cksum
    install -t $out/bin ${pkgs.coreutils}/bin/comm
    install -t $out/bin ${pkgs.coreutils}/bin/coreutils
    install -t $out/bin ${pkgs.coreutils}/bin/cp
    install -t $out/bin ${pkgs.coreutils}/bin/csplit
    install -t $out/bin ${pkgs.coreutils}/bin/cut
    install -t $out/bin ${pkgs.coreutils}/bin/date
    install -t $out/bin ${pkgs.coreutils}/bin/dd
    install -t $out/bin ${pkgs.coreutils}/bin/df
    install -t $out/bin ${pkgs.coreutils}/bin/dir
    install -t $out/bin ${pkgs.coreutils}/bin/dircolors
    install -t $out/bin ${pkgs.coreutils}/bin/dirname
    install -t $out/bin ${pkgs.coreutils}/bin/du
    install -t $out/bin ${pkgs.coreutils}/bin/echo
    install -t $out/bin ${pkgs.coreutils}/bin/env
    install -t $out/bin ${pkgs.coreutils}/bin/expand
    install -t $out/bin ${pkgs.coreutils}/bin/expr
    install -t $out/bin ${pkgs.coreutils}/bin/factor
    install -t $out/bin ${pkgs.coreutils}/bin/false
    install -t $out/bin ${pkgs.coreutils}/bin/fmt
    install -t $out/bin ${pkgs.coreutils}/bin/fold
    install -t $out/bin ${pkgs.coreutils}/bin/groups
    install -t $out/bin ${pkgs.coreutils}/bin/head
    install -t $out/bin ${pkgs.coreutils}/bin/hostid
    install -t $out/bin ${pkgs.coreutils}/bin/id
    install -t $out/bin ${pkgs.coreutils}/bin/install
    install -t $out/bin ${pkgs.coreutils}/bin/join
    install -t $out/bin ${pkgs.coreutils}/bin/kill
    install -t $out/bin ${pkgs.coreutils}/bin/link
    install -t $out/bin ${pkgs.coreutils}/bin/ln
    install -t $out/bin ${pkgs.coreutils}/bin/logname
    install -t $out/bin ${pkgs.coreutils}/bin/ls
    install -t $out/bin ${pkgs.coreutils}/bin/md5sum
    install -t $out/bin ${pkgs.coreutils}/bin/mkdir
    install -t $out/bin ${pkgs.coreutils}/bin/mkfifo
    install -t $out/bin ${pkgs.coreutils}/bin/mknod
    install -t $out/bin ${pkgs.coreutils}/bin/mktemp
    install -t $out/bin ${pkgs.coreutils}/bin/mv
    install -t $out/bin ${pkgs.coreutils}/bin/nice
    install -t $out/bin ${pkgs.coreutils}/bin/nl
    install -t $out/bin ${pkgs.coreutils}/bin/nohup
    install -t $out/bin ${pkgs.coreutils}/bin/nproc
    install -t $out/bin ${pkgs.coreutils}/bin/numfmt
    install -t $out/bin ${pkgs.coreutils}/bin/od
    install -t $out/bin ${pkgs.coreutils}/bin/paste
    install -t $out/bin ${pkgs.coreutils}/bin/pathchk
    install -t $out/bin ${pkgs.coreutils}/bin/pinky
    install -t $out/bin ${pkgs.coreutils}/bin/pr
    install -t $out/bin ${pkgs.coreutils}/bin/printenv
    install -t $out/bin ${pkgs.coreutils}/bin/printf
    install -t $out/bin ${pkgs.coreutils}/bin/ptx
    install -t $out/bin ${pkgs.coreutils}/bin/pwd
    install -t $out/bin ${pkgs.coreutils}/bin/readlink
    install -t $out/bin ${pkgs.coreutils}/bin/realpath
    install -t $out/bin ${pkgs.coreutils}/bin/rm
    install -t $out/bin ${pkgs.coreutils}/bin/rmdir
    install -t $out/bin ${pkgs.coreutils}/bin/runcon
    install -t $out/bin ${pkgs.coreutils}/bin/seq
    install -t $out/bin ${pkgs.coreutils}/bin/sha1sum
    install -t $out/bin ${pkgs.coreutils}/bin/sha224sum
    install -t $out/bin ${pkgs.coreutils}/bin/sha256sum
    install -t $out/bin ${pkgs.coreutils}/bin/sha384sum
    install -t $out/bin ${pkgs.coreutils}/bin/sha512sum
    install -t $out/bin ${pkgs.coreutils}/bin/shred
    install -t $out/bin ${pkgs.coreutils}/bin/shuf
    install -t $out/bin ${pkgs.coreutils}/bin/sleep
    install -t $out/bin ${pkgs.coreutils}/bin/sort
    install -t $out/bin ${pkgs.coreutils}/bin/split
    install -t $out/bin ${pkgs.coreutils}/bin/stat
    install -t $out/bin ${pkgs.coreutils}/bin/stdbuf
    install -t $out/bin ${pkgs.coreutils}/bin/stty
    install -t $out/bin ${pkgs.coreutils}/bin/sum
    install -t $out/bin ${pkgs.coreutils}/bin/sync
    install -t $out/bin ${pkgs.coreutils}/bin/tac
    install -t $out/bin ${pkgs.coreutils}/bin/tail
    install -t $out/bin ${pkgs.coreutils}/bin/tee
    install -t $out/bin ${pkgs.coreutils}/bin/test
    install -t $out/bin ${pkgs.coreutils}/bin/timeout
    install -t $out/bin ${pkgs.coreutils}/bin/touch
    install -t $out/bin ${pkgs.coreutils}/bin/tr
    install -t $out/bin ${pkgs.coreutils}/bin/true
    install -t $out/bin ${pkgs.coreutils}/bin/truncate
    install -t $out/bin ${pkgs.coreutils}/bin/tsort
    install -t $out/bin ${pkgs.coreutils}/bin/tty
    install -t $out/bin ${pkgs.coreutils}/bin/uname
    install -t $out/bin ${pkgs.coreutils}/bin/unexpand
    install -t $out/bin ${pkgs.coreutils}/bin/uniq
    install -t $out/bin ${pkgs.coreutils}/bin/unlink
    install -t $out/bin ${pkgs.coreutils}/bin/uptime
    install -t $out/bin ${pkgs.coreutils}/bin/users
    install -t $out/bin ${pkgs.coreutils}/bin/vdir
    install -t $out/bin ${pkgs.coreutils}/bin/wc
    install -t $out/bin ${pkgs.coreutils}/bin/who
    install -t $out/bin ${pkgs.coreutils}/bin/whoami
    install -t $out/bin ${pkgs.coreutils}/bin/yes
  '';

  phases = [ "buildPhase" "installPhase" "fixupPhase" ];
}


