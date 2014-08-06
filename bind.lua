-- Argument binder
-- Useful for constructing functions that are
-- callers for existing ones with some (or all)
-- args predefined.

-- Dependencies:
--  none

-- Example:
-- f = bind(fs.delete, "file")
-- f() <- deletes "file" from filesystem

function bind(f, ...)
  local bound = arg
  return function(...)
    return f( unpack(bound), unpack(arg) )
  end
end
