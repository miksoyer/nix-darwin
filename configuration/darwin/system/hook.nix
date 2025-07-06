{ ... }:
{
  # Every time the terminal is started
  environment.extraInit = ''
    echo "hello nixer"
  '';
  # Every time the switch is successful
  system.activationScripts = {
    postscript = {
      enable = true;
      # source = "hook.sh";
      text = ''
#!/usr/bin/env zsh
pkill -f \"borders\"
pkill -f \"aerospace\"

source ~/.zshrc

nohup aerospace >/dev/null 2>&1 &
disown

echo "That's all, enjoy~"
      '';
    };
  };
}