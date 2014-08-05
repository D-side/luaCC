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
  if not fs.exists(self.path)
    return false, "No such file or directory"
  -- ...and is it writable?
  if fs.isReadOnly(self.path)
    return false, "Only read access allowed"
  -- Alright, do it.
  fs.delete(self.path)
  return true, "Operation successful"
end

function File:run(...)
  if not fs.exists(self.path)
    return false, "No such file or directory"
  shell.run(self.path, unpack(arg))
end
