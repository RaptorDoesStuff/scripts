local argstr = ""
for _, v in ipairs({...}) do
  argstr = argstr .. string.format("%s ",v)
end
local strtoarr = function(str)
  local t = {}
  str:gsub(".",function(op)
    t[#t + 1] = op
  end)
  return t
end
local darr = {}
local chrtod = {
  penis = 1,
  vagina = 0,
  clitoris = false
}
local buf = ""
for _, chr in ipairs(strtoarr(argstr)) do
  if chr == " " then
    local d = chrtod[buf]
    assert(d ~= nil, string.format("\"%s\" not found in darr",buf))
    darr[#darr + 1] = d
    buf = ""
  else
    buf = buf .. chr
  end
end
local barr = {""}
local i = 1
for _, word in ipairs(darr) do
  if not word then
    barr[i] = string.char(tonumber(barr[i],2))
    i = i + 1
    barr[i] = ""
  else
    barr[i] = barr[i] .. tostring(word)
  end
end
local rstr = ""
for _, word in ipairs(barr) do
  rstr = rstr .. word
end
return rstr
