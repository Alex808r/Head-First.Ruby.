# ancestors Чтобы просмотреть содержимое списка мест
# для поиска методов, вызовите метод класса

class Clip
  attr_reader :comments
  def initialize
    @comments = []
  end
  def add_comment(comment)
    comments << comment
  end
  def play
    puts "Playing #{object_id}..."
  end
end

class Video < Clip
  attr_accessor :resolution
end
class Song < Clip
  attr_accessor :beats_per_minute
end
video = Video.new
video.add_comment("Cool slow motion effect!")
video.add_comment("Weird ending.")
song = Song.new
song.add_comment("Awesome beat.")
p video.comments, song.comments


module AcceptsComments
  def comments
    if @comments
      @comments
    else
      @comments = []
    end
  end
end

# сокращенный вариант
module AcceptsComments
  def comments
    @comments = @comments || [] # или еще короче @comments ||= [] условный оператор присваивания
  end
end

module AcceptsComments
  def comments
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end
end
class Photo
  include AcceptsComments
  def initialize
    @format = 'JPEG'
  end
end
photo = Photo.new
photo.add_comment("Beautiful colors.")
p photo.comments

# полный код
module AcceptsComments
  def comments
    @comments ||= []
  end
  def add_comment(comment)
    comments << comment
  end
end
class Clip
  def play
    puts "Playing #{object_id}..."
  end
end
class Video < Clip
  include AcceptsComments
  attr_accessor :resolution
end
class Song < Clip
  include AcceptsComments
  attr_accessor :beats_per_minute
end
class Photo
  include AcceptsComments
  def initialize
    @format = 'JPEG'
  end
end
video = Video.new
video.add_comment("Cool slow motion effect!")
video.add_comment("Weird ending.")
song = Song.new
song.add_comment("Awesome beat.")
photo = Photo.new
photo.add_comment("Beautiful colors.")
p video.comments, song.comments, photo.comments
