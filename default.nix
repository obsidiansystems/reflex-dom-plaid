let
  reflex-platform = import ((import <nixpkgs> {}).fetchFromGitHub {
    owner  = "reflex-frp";
    repo   = "reflex-platform";
    rev    = "318eb23267471f0cfbb0c8be3efa26430f8627d4";
    sha256 = "0yn0lwa6z4jk09ng67m5wdfwah07a71zxbdswxm8qi7mgj0pim32";
  }) {};
in
reflex-platform.project ({ pkgs, ... }: {
  packages = {
    reflex-dom-plaid = ./reflex-dom-plaid;
    demo = ./demo;
  };

  shells = {
    ghc = ["reflex-dom-plaid" "demo"];
    ghcjs = ["reflex-dom-plaid" "demo"];
  };
})
