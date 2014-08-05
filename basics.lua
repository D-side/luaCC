-- A more concise way of preloading stuff
require = shell.run

-- Quite useful for method construction
-- like:
-- > file.delete = bind(fs.delete, file.path)

function bind(f, ...)
  higherArg = arg
  return function(...)
    return f( unpack(higherArg), unpack(arg) )
  end
end
