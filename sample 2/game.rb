# encoding: utf-8
#Игра угадай число
# Код для преобразования входного аргумента в кодировку utf-8 на Windows

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# начало игры
print "Введите ваше имя: "
name = gets.strip.capitalize
puts "Привет, #{name}! Я загадал число от 1 до 100. Попробуй угадай, у тебя 10 попыток."

#задаем количество попыток - константа
TRIAL = 10

#загадываем число
number = rand(1..5)

10.times do |i|
  print "Введите число: "
  choice = gets.to_i
  puts "Попытка № #{i+1}. Осталось #{9 - i}"
    if choice == number
      puts 'Поздравляю, число отгадано!'
      break
    else
      puts "Попробуйте еще раз!"
    end

end