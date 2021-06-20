environments

nix develop --ignore-environment github:ES-Nix/environments/dev -c zsh
```bash
nix \
develop \
--ignore-environment \
github:ES-Nix/environments/dev \
--command \
zsh
```

```bash
nix \
shell \
--ignore-environment \
github:ES-Nix/environments/dev \
--command \
zsh
```

source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme