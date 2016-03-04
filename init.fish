# Set up default environment values.
set -q PHPBREW_HOME
  or set -gx PHPBREW_HOME "$HOME/.phpbrew"
set -q PHPBREW_ROOT
  or set -gx PHPBREW_ROOT "$HOME/.phpbrew"
set -q PHPBREW_BIN
  or set -gx PHPBREW_BIN "$PHPBREW_HOME/bin"

# Read the saved init file.
if test -f "$PHPBREW_HOME/init"
  cat "$PHPBREW_HOME/init" | __phpbrew_read_config
end

# Make sure the path contains the configured version.
__phpbrew_update_path
