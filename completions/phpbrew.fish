function __fish_phpbrew_needs_command
  set -l cmd (commandline -opc)
  if test (count $cmd) -eq 1 -a $cmd[1] = 'phpbrew'
    return 0
  end
  return 1
end

function __fish_phpbrew_using_command
  set -l cmd (commandline -opc)
  if set -q cmd[2]
    if test $argv[1] = $cmd[2]
      return 0
    end
  end
  return 1
end

function __fish_phpbrew_known_version
  command phpbrew known | grep -v 'You can run' | sed 's/ //g'| sed 's/\.\.\.//g'| cut -d ':' -f 2| tr ',' \n
end

function __fish_phpbrew_installed_version
  command phpbrew list | cut -d '-' -f 2 | sed 's/ //g'
end

complete -f -c phpbrew -s v -l verbose -d "Print verbose message."
complete -f -c phpbrew -s d -l debug -d "Print debug message."
complete -f -c phpbrew -s q -l quiet -d "Be quiet."
complete -f -c phpbrew -s h -l help -d "Show help."
complete -f -c phpbrew -l version -d "Show version."
complete -f -c phpbrew -s p -l profile -d "Display timing and memory usage information."
complete -f -c phpbrew -l no-interact -d "Do not ask any interactive question."
complete -f -c phpbrew -l no-progress -d "Do not display progress bar."

# commands
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a help -d "show help message of a command"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a init -d "Initialize phpbrew config file."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a known -d "List known PHP versions"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a install -d "Install php"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a list -d "List installed PHPs"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a use -d "Use php, switch version temporarily"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a switch -d "Switch default php version."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a each -d "Iterate and run a given command over all php versions managed by PHPBrew."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a config -d "Edit your current php.ini in your favorite $EDITOR"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a info -d "Show current php information"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a env -d "Export environment variables"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a extension -d "List extensions or execute extension subcommands"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a variants -d "List php variants"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a path -d "Show paths of the current PHP."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a cd -d "Change to directories"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a download -d "Download php"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a clean -d "Clean up the source directory of a PHP distribution"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a update -d "Update PHP release source file"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a ctags -d "Run ctags at current php source dir for extension development."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a list-ini -d "List loaded ini config files."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a self-update -d "Self-update, default to master version"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a remove -d "Remove installed php build."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a purge -d "Remove installed php version and config files."
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a off -d "Temporarily go back to the system php"
complete -f -c phpbrew -n '__fish_phpbrew_needs_command' -a switch-off -d "Definitely go back to the system php"

# install
complete -f -c phpbrew -n '__fish_phpbrew_using_command install' -a '(__fish_phpbrew_known_version)' -d " version"

# use / switch / cd /env / path / remove /purge
complete -f -c phpbrew -n '__fish_phpbrew_using_command use' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command switch' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command cd' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command env' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command path' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command remove' -a '(__fish_phpbrew_installed_version)' -d " installed version"
complete -f -c phpbrew -n '__fish_phpbrew_using_command purge' -a '(__fish_phpbrew_installed_version)' -d " installed version"
