# Reads config variables and exports them.
function __phpbrew_read_config
  tr = ' ' | while read -l dummy name value
    test "$dummy" = "export"
      and set -gx $name "$value"
  end

  return 0
end
