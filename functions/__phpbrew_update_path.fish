# Puts the current PHP version into the path.
function __phpbrew_update_path
  if not set -q PATH_WITHOUT_PHPBREW
    set -gx PATH_WITHOUT_PHPBREW $PATH
  end

  set -gx PATH $PHPBREW_PATH $PHPBREW_BIN $PATH_WITHOUT_PHPBREW
end
