local function add(a, b)
    return a + b
end

local function subtract(a, b)
    return a - b
end

local function multiply(a, b)
    return a * b
end

local function divide(a, b)
    if b ~= 0 then
        return a / b
    else
        return "Can't devide by zero"
    end
end

local function perform_operation(operation, a, b)
    local result
    if operation == '+' then
        result = add(a, b)
    elseif operation == '-' then
        result = subtract(a, b)
    elseif operation == '*' then
        result = multiply(a, b)
    elseif operation == '/' then
        result = divide(a, b)
    else
        return "Invalid operation"
    end
    
    return string.format("%s %s %s = %s", a, operation, b, result)
end

-- Получения пользовательского ввода
local function get_user_input(prompt)
    io.write(prompt)
    return io.read()
end

local a = tonumber(get_user_input("Type the first number: "))
local operation = get_user_input("Choose the operation (+, -, *, /): ")
local b = tonumber(get_user_input("Type the second number "))


-- Выполнение операции и вывод результата
print(perform_operation(operation, a, b))