{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
    pkgs.git
    pkgs.grub2
    pkgs.xorriso
    pkgs.wget
  ];

  scripts = {
    clean = {
      description = "Clean all built files";
      exec = ''./clean.sh'';
    };

    build = {
      description = "Build the project files.";
      exec = ''./build.sh'';
    };

    run = {
      description = "Run the operating system from an iso in the qemu emulator";
      exec = ''./qemu.sh'';
    };

    commit = {
      description = "Commit all changes with a message and push to main";
      exec = ''
        if [ -z "$1" ]; then
          echo "Usage: commit \"your commit message\""
          exit 1
        fi

        git add -A
        git commit -m "$1"
        git push origin main
      '';
    };
  };
}
