# Selects a given PHP version and activates it.
function __phpbrew_use -a php_version
  # Find the desired PHP version.
  set php_path $PHPBREW_ROOT/php/{php-$php_version*,$php_version*}

  # If none of the paths match, it doesn't exist.
  if not set -q php_path[1]
    echo "The version '$php_version' does not exist."
    return 1
  end

  # Choose the first match.
  set -l php_version (basename $php_path[1])
  echo "Using version '$php_version'."

  command phpbrew env $php_version | __phpbrew_read_config
    and __phpbrew_update_path
end
