function phpbrew -d "Brew & manage PHP versions" -a command
  if not type -q phpbrew
    echo "Please install phpbrew first!"
    echo "See http://phpbrew.github.io/phpbrew for instructions."
    return 1
  end

  # Wrap the phpbrew executable and provide the necessary shell-side commands.
  switch $command
    case use
      if not set -q argv[2]
        if not set -q PHPBREW_PHP
          echo "Currently using system php."
        else
          echo "Currently using $PHPBREW_PHP."
        end
      else
        __phpbrew_use $argv[2]
      end

    case 'switch'
      if not set -q argv[2]
        echo "Please specify the php version."
        return 1
      end

      __phpbrew_use $argv[2]
        and command phpbrew env > "$PHPBREW_HOME/init"

    case off
      set -e PHPBREW_PHP
      set -e PHPBREW_PATH
      __phpbrew_update_path
      echo "phpbrew is turned off."

    case switch-off
      set -e PHPBREW_PHP
      set -e PHPBREW_PATH
      __phpbrew_update_path
      echo "phpbrew is switched off."

    case cd
      test -d "$PHPBREW_ROOT/php/$PHPBREW_PHP"
        and cd "$PHPBREW_ROOT/php/$PHPBREW_PHP"

    case cd-src
      test -d "$PHPBREW_HOME/build/$PHPBREW_PHP"
        and cd "$PHPBREW_HOME/build/$PHPBREW_PHP"

    case purge
      if not set -q argv[2]
        echo "Please specify the php version."
        return 1
      end

      if test $argv[2] = $PHPBREW_PHP
        echo "Version $argv[2] is in use."
        return 1
      end

      set -l bin_path $PHPBREW_ROOT/php/$argv[2]
      set -l source_file $PHPBREW_ROOT/build/$argv[2].tar.bz2
      set -l build_path $PHPBREW_ROOT/build/$argv[2]

      if not test -d $bin_path
        echo "The version '$argv[2]' is not installed."
        return 1
      end

      rm -f $source_file
        and rm -rf $build_path
        and rm -rf $bin_path
        and echo "Version $argv[2] has been purged. I hope you're happy."
        or begin
          echo "Failed to purge version."
          return 1
        end

    case fpm
      echo "The '$command' command is not currently supported by this plugin."
      return 255

    case '*'
      command phpbrew $argv
  end
end
