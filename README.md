environments


```bash
nix \
develop \
--ignore-environment \
github:ES-Nix/environments/minimal \
--command \
ls -al
```

```bash
nix \
shell \
--ignore-environment \
github:ES-Nix/environments/minimal \
--command \
ls -al
```
