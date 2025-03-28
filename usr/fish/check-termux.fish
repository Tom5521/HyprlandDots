if set -q TERMUX_VERSION
  set IS_TERMUX 1
end

if not set -q PREFIX
  set PREFIX /
end

