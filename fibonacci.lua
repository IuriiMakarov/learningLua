local a = 0;
local b = 1;
local c = 0;

local n = io.read();
n = tonumber(n);

while n > 2 do
    a = b;
    b = c;
    c = a + b;
    print(c);
    n = n - 1;
    
end