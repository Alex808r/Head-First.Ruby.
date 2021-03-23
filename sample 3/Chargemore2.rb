class Employee
  attr_reader :name

  def initialize(name = "Anonymous")
    self.name = name # тут self обязательно
  end

  def name=(name)
    if name == ""
      raise "Name can't be blank!"
    end
    @name = name
  end

  def print_name
    puts "Name: #{name}" # можно и без self
  end
end