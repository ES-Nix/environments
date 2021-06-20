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

          # Customize your oh-my-zsh options here
          export ZSH_THEME="agnoster"
          export plugins=(git)
          source $ZSH/oh-my-zsh.sh

          source ${pkgs.fzf}/share/fzf/key-bindings.zsh
          source ${pkgs.fzf}/share/fzf/completion.zsh
