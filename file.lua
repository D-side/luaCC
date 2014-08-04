File = {}

-- Merely a ghost of an existing file!
function File:new(fullpath)
  local file = {path = fullpath}
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
