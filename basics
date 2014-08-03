-- A more concise way of preloading stuff
require = shell.run

-- Quite useful for method construction
-- like:
-- > file.delete = bind(fs.delete, file.path)

function bind(f, ...)
  return function()
    return f( unpack(arg) )
  end
end
