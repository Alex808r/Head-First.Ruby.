require_relative 'Chargemore2'
require_relative 'SalariedEmployee'
class HourlyEmployee < Employee
  def self.security_guard(name)
    HourlyEmployee.new(name, 19.25, 30)
  end
  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end
  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end
  attr_reader :hourly_wage, :hours_per_week
  def hourly_wage=(hourly_wage)
    if hourly_wage < 0
      raise "An hourly wage of #{hourly_wage} isn't valid!"
    end
    @hourly_wage = hourly_wage
  end
  def hours_per_week=(hours_per_week)
    if hours_per_week < 0
      raise "#{hours_per_week} hours per week isn't valid!"
    end
    @hours_per_week = hours_per_week
  end
  def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
    super(name)
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week
  end
  def print_pay_stub
    print_name
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end

jane = SalariedEmployee.new("Jane Doe", 50000)
jane.print_pay_stub
angela = HourlyEmployee.security_guard("Angela Matthews")
ivan = HourlyEmployee.cashier("Ivan Stokes")
angela.print_pay_stub
ivan.print_pay_stub







# class HourlyEmployee < Employee
#
#   attr_reader :hourly_wage, :hours_per_week
#
#   def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
#     super(name)
#     self.hourly_wage = hourly_wage
#     self.hours_per_week = hours_per_week
#   end
#
#   def self.security_guard(name)
#     HourlyEmployee.new(name, 19.25, 30)
#   end
#
#   def self.cashier(name)
#     HourlyEmployee.new(name, 12.75, 25)
#   end
#
#   def self.janitor(name)
#     HourlyEmployee.new(name, 10.50, 20)
#   end
#
#
#
#   def hourly_wage=(hourly_wage)
#     if hourly_wage < 0
#       raise "error"
#     end
#     @hourly_wage = hourly_wage
#   end
#
#   def hours_per_week=(hours_per_week)
#     if hours_per_week < 0
#       raise "error"
#     end
#     @hours_per_week = hours_per_week
#   end
#
#
#   def print_pay_stub
#     print_name
#     pay_for_period = hourly_wage * hours_per_week * 2
#     formatted_pay = format("$%.2f", pay_for_period)
#     puts "Pay This Period: #{formatted_pay}"
#   end
# end
#
# jane = SalariedEmployee.new("Jane Doe", 50000)
# jane.print_pay_stub
# angela = HourlyEmployee.security_guard("Angela Matthews")
# ivan = HourlyEmployee.cashier("Ivan Stokes")
# angela.print_pay_stub
# ivan.print_pay_stub
#
# # hourly_employee = HourlyEmployee.new
# # hourly_employee.name = "John Smith"
# # hourly_employee.hourly_wage = 14.97
# # hourly_employee.hours_per_week = 30
# # hourly_employee.print_pay_stub
# #
# # hourly_employee = HourlyEmployee.new("John Smith", 14.97, 30)
# # hourly_employee.print_pay_stub
#
# # hourly_employee = HourlyEmployee.new("John Smith", 14.97, 30)
# # hourly_employee.print_pay_stub