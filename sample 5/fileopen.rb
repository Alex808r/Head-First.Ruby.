review_file = File.open("reviews.txt")
lines = review_file.readlines
review_file.close
# #Эквивалентно.
# Блок открывает файл, помещает его в переменную review_file
# затем в переменнюу lines сохраняется массив строк по помощи метода .readlines
# при использовании блока файл закрывается автоматически.
lines = []
File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

#Поиск слова "Truncated" в массиве строк длинный способ
lines = []
File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

relevant_lines = []
lines.each do |line|
  if line.include?("Truncated")
    relevant_lines << line
  end
end
#puts relevant_lines

#Поиск слова "Truncated" в массиве короткий способ
lines = []
File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end
relevant_lines = lines.find_all { |line| line.include?("Truncated") }
#puts relevant_lines

#Убрать подписи метод reject обратный метод find_all
reviews = relevant_lines.reject { |line| line.include?("--") }
#puts reviews

def find_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

adjectives = []
  reviews.each do |review|
    adjectives << find_adjective(review)
  end
#puts adjectives

# короткая запись с использоваением map
#adjectives = reviews.map { |review| find_adjective(review) }
#p adjectives

#Выделяем найденные слова в кавычки
adjectives = reviews.map do |review|
  adjective = find_adjective(review)
  "'#{adjective.capitalize}'"
  end
puts adjectives