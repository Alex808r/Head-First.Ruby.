# encoding: utf-8
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Игра угадай число от 1 до 100 c циклом while
print "Введите ваше имя: "

#обрезаем white spaces и делаем заглавную букву в имени
name = gets.strip.capitalize
puts "Привет, #{name}! Я загадал число от 1 до 100. Попробуй угадай, у тебя 10 попыток."

#задаем количество попыток (константа)
TRIAL = 10

#загадываем число
number = rand(1..100)
#устанавливаем переменную для счетчика
count = 0

# признак продолжения игры
win = false
#запускаем главный игровой цикл
while count < 10 || win == true
  count += 1
  print "Введите число: "
  # в переменную будет принято для записи только число.
  choice = Integer(gets)
  puts "Попытка № #{count}. Осталось #{TRIAL - count}"
  if choice == number
    puts "Хорошая работа #{name}, число отгадано c #{count} раза!\n\n"
    win = true
  elsif choice > number
    puts "Oops. Ваше число больше загаданного. Попробуйте еще.\n\n"
  elsif choice < number
    puts "Oops. Ваше число меньше загаданного. Попробуйте еще.\n\n"
  end
end

#выводим на экран, если игрок не угадал число.
#если игрок угадал, то исполнение программы не дойдет до этой строчки
#так как в 29 строке использован оператор exit
unless win
  puts "Вам не удалось отгадать. Загаданное число #{number}."
end