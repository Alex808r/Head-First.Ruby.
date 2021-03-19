# encoding: utf-8
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Игра угадай число от 1 до 100 c циклом upto
print "Введите ваше имя: "

#обрезаем white spaces и делаем заглавную букву в имени
name = gets.strip.capitalize
puts "Привет, #{name}! Я загадал число от 1 до 100. Попробуй угадай, у тебя 10 попыток."

#задаем количество попыток (константа)
TRIAL = 10

#загадываем число
number = rand(1..100)
#запускаем главный игровой цикл
1.upto(10) do |i| # можно также применить цикл downto
  print "Введите число: "
  choice = gets.to_i
  puts "Попытка № #{i}. Осталось #{TRIAL - i}"
  if choice == number
    puts "Хорошая работа #{name}, число отгадано c #{i} раза!\n\n"
    exit
  elsif choice > number
    puts "Oops. Ваше число больше загаданного. Попробуйте еще.\n\n"
  elsif choice < number
    puts "Oops. Ваше число меньше загаданного. Попробуйте еще.\n\n"
  end

end
#выводим на экран, если игрок не угадал число.
#если игрок угадал, то исполнение программы не дойдет до этой строчки
#так как в 29 строке использован оператор exit
puts "Вам не удалось отгадать. Загаданное число #{number}."



