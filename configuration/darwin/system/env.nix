{ ... }:
{
  environment = {
    # system env 
    variables = {
      EDITOR = "nvim visudo";
      VISUAL = "nvim visudo";
      SUDO_EDITOR = "nvim";
      GOPATH="$HOME/.local/go/workspace";
      GOBIN="$HOME/.local/go/bin";
      HELLO = "hello~ world hhh";
      WORLD = "world~ hello 233";
    };
  };
}