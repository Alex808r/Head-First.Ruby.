# encoding: utf-8
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Игра угадай число от 1 до 100
print "Введите ваше имя: "
name = gets.strip.capitalize
puts "Привет, #{name}! Я загадал число от 1 до 100. Попробуй угадай, у тебя 10 попыток."

#задаем количество попыток (константа)
TRIAL = 10

#загадываем число
number = rand(1..10)

10.times do |i|
  print "Введите число: "
  choice = gets.to_i
  puts "Попытка № #{i+1}. Осталось #{9 - i}"
    if choice == number
      puts "Хорошая работа #{name}, число отгадано c #{i+1} раза!"
      exit
    elsif choice > number
      puts "Oops. Ваше число больше загаданного. Попробуйте еще."
    elsif choice < number
      puts "Oops. Ваше число меньше загаданного. Попробуйте еще."
    end
end
