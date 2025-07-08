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
echo "That's all, enjoy~"
      '';
    };
  };
}