function times(n, f)
  for i = 1, n do
    f(i)
  end
end

function range(a, b, f)
  for i = a, b do
    f(i)
  end
end

function values(t, f)
  local r
  for k, v in pairs(t) do
    r[k] = f(v)
  end
end

in_place = {
  values = function(t, f)
    for k, v in pairs(t) do
      t[k] = f(v)
    end
  end,
}
