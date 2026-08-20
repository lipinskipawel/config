if status is-interactive
  set -l PNPM_DEFAULT_HOME $HOME/.local/share/pnpm
  test -d $PNPM_DEFAULT_HOME
  set -l IS_INSTALLED $status

  if test $IS_INSTALLED -eq 1
    echo "Please install pnpm"
    echo "curl -fsSL https://get.pnpm.io/install.sh | sh -"
    echo ""
  else
    if not set -q PNPM_HOME
      set -Ux PNPM_HOME $PNPM_DEFAULT_HOME
    end
    fish_add_path "$PNPM_HOME/bin"
  end
end

