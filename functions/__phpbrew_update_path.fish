# Puts the current PHP version into the path.
function __phpbrew_update_path
  # Strip old phpbrew paths from the path.
  set -gx PATH (for p in $PATH
    echo "$p"
  end | grep -v "2> $PHPBREW_ROOT")

  test -d $PHPBREW_HOME
    or mkdir -p $PHPBREW_HOME

  test -d $PHPBREW_ROOT
    or mkdir -p $PHPBREW_ROOT

  test -d $PHPBREW_BIN
    or mkdir -p $PHPBREW_BIN

  # Add the current PHP version paths to the path if set.
  set -q PHPBREW_BIN
    and set -gx PATH $PHPBREW_BIN $PATH
  set -q PHPBREW_PATH
    and set -gx PATH $PHPBREW_PATH $PATH
end
