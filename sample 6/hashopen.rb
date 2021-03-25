# открываем файл и записываем его в lines массивом строк.
lines = []
File.open("votes.txt") do |file|
  lines = file.readlines
end

# объявляем Хэш для определения количества голосов
votes = {}
lines.each do |line|
  name = line.downcase.strip
  if votes[name] != nil # можно заменить на votes[name] удалив "!= nil"
    votes[name] += 1
  else
    votes[name] = 1
  end
end
p votes

=begin
votes = {} эквивалентна, Hash.new() - если Hash.new() не передан аргумент по умолчанию Hash.new(0)
Если задан аргумент по умолчанию, то при обращении к ключу которого нет в  хеше votes будет возрващено значение по
умолчанию. Если значения по умолчанию нет, то возвращено будет nil.
=end
votes = {}
lines.each do |line|
  name = line.downcase.strip
  votes[name]? votes[name] += 1 : votes[name] = 1 # Конструкцию if else можно записать 1 остроку используя тернарный оператор
end
p votes

# от конструкции if и от тернарного оператора в данном случае можно отказатья, если задать хешу votes значение по
# умолчанию.
votes = Hash.new(0)
lines.each do |line|
  name = line.downcase.strip
  votes[name] += 1
end

#обработка хеша длинная запись
votes.each do |name, count|
  puts "#{name} : #{count}"
end
#обработка хеша коротккая запись
votes.each {|name, count| puts "#{name} : #{count}"}