local otb = {
  ["0"] = "000",
  ["1"] = "001",
  ["2"] = "010",
  ["3"] = "011",
  ["4"] = "100",
  ["5"] = "101",
  ["6"] = "110",
  ["7"] = "111"
}
local otbf = function(i)
  return otb[i]
end
local NumToBinary = function(n)
  local s = (string.format("%.11o",n):gsub(".",otbf))
  return s:sub((s:find("1")))
end
local argstr = ""
for _, arg in ipairs({...}) do
  argstr = argstr .. string.format("%s ",arg)
end
argstr = argstr:sub(1,-2)
local strtoarr = function(str)
  local t = {}
  str:gsub(".",function(op)
    t[#t + 1] = op
  end)
  return t
end
local dstr = ""
local dtochr = {
  ["1"] = "penis",
  ["0"] = "vagina"
}
for _, chr in ipairs(strtoarr(argstr)) do
  for _, bchr in ipairs(strtoarr(NumToBinary(chr:byte()))) do
    dstr = dstr .. string.format("%s ",dtochr[bchr])
  end
  dstr = dstr .. "clitoris "
end
return dstr
