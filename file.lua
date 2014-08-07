-- A class representing a file in a more OOPish manner
-- ComputerCraft 1.5.8, assuming advanced (golden) computer
File = {}

-- Merely a ghost of an existing file!
function File:new(fullpath)
  local file = {path = fullpath, dir = fs.isDir(fullpath)}
  self.__index = self
  return setmetatable(file, self)
end

-- Delete - if exists
function File:delete()
  -- Does it even exist?
  if not fs.exists(self.path) then
    return false, "No such file or directory"
  end
  -- ...and is it writable?
  if fs.isReadOnly(self.path) then
    return false, "Write access denied"
  end
  -- Alright, do it.
  fs.delete(self.path)
  return true, "Operation successful"
end

function File:run(...)
  if not fs.exists(self.path) then
    return false, "No such file or directory"
  end
  return true, shell.run(self.path, unpack(arg))
end

function File:move(dest)
  if fs.isReadOnly(self.path) then
    return false, "Read-only files cannot be moved"
  end
  if fs.isReadOnly(dest) then
    return false, "Destination not writable"
  end
  return true, fs.move(dest)
end
