-- Хэш-таблица
local HashTable = {}
HashTable.__index = HashTable

-- Конструктор
function HashTable:new(size)
    local ht = {
        size = size or 100, -- Размер хэш-таблицы по умолчанию
        count = 0, -- Количество элементов в хэш-таблице
        buckets = {} -- Сами корзины (связанные списки для коллизий)
    }
    for i = 1, ht.size do
        ht.buckets[i] = {}
    end
    setmetatable(ht, HashTable)
    return ht
end

-- Функция хэширования
function HashTable:hash(key)
    local hash = 0
    for i = 1, #key do
        hash = (hash * 31 + string.byte(key, i)) % self.size
    end
    return hash + 1
end

-- Вставка элемента
function HashTable:insert(key, value)
    local index = self:hash(key)
    local bucket = self.buckets[index]

    -- Проверка, существует ли ключ, и обновление значения
    for i, pair in ipairs(bucket) do
        if pair[1] == key then
            pair[2] = value
            return
        end
    end

    -- Вставка нового элемента
    table.insert(bucket, {key, value})
    self.count = self.count + 1
end

-- Удаление элемента
function HashTable:remove(key)
    local index = self:hash(key)
    local bucket = self.buckets[index]

    for i, pair in ipairs(bucket) do
        if pair[1] == key then
            table.remove(bucket, i)
            self.count = self.count - 1
            return true
        end
    end
    return false
end

-- Проверка на пустоту
function HashTable:isEmpty()
    return self.count == 0
end

-- Получение размера
function HashTable:size()
    return self.count
end

-- Поиск элемента
function HashTable:get(key)
    local index = self:hash(key)
    local bucket = self.buckets[index]

    for i, pair in ipairs(bucket) do
        if pair[1] == key then
            return pair[2]
        end
    end
    return nil
end

-- Пример использования
local ht = HashTable:new(10)
ht:insert("key1", "value1")
ht:insert("key2", "value2")
print(ht:get("key1")) -- Вывод: value1
print(ht:remove("key2")) -- Вывод: true
print(ht:get("key2")) -- Вывод: nil
print(ht:isEmpty()) -- Вывод: false
