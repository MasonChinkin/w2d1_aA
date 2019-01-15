require 'byebug'
class Employee
  attr_reader :name, :salary, :title, :boss 
  def initialize(name, salary, title, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  def assign_boss(boss)
    @boss = boss
    boss.employees << self 
  end

  def inspect
    puts self.name
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, title, boss=nil)
    @employees = []
    super(name, salary, title, boss=nil)
  end

  def bonus(multiplier)
    total_sal = employees_salary
    total_sal * multiplier
  end


  def assign_employee(employee)
    employee.assign_boss(self)
  end

  
  def employees_salary 
    salaries_sum = 0
    self.employees.each do |emp|
      emp.is_a?(Manager) ?
      salaries_sum += emp.employees_salary :
      salaries_sum += emp.salary
    end 
    salaries_sum
  end 
end

if __FILE__ == $PROGRAM_NAME
  David = Employee.new('David',10000,'TA')
  Shawna = Employee.new('Shawna',12000,'TA')
  Darren = Manager.new('Darren',78000,'TA Manager')
  Ned = Manager.new('Ned',1000000,'Founder')

  Darren.assign_employee(Shawna)
  Darren.assign_employee(David)
  Ned.assign_employee(Darren)

  # debugger
  p Ned.bonus(5) # => 500_000
  # p Darren.bonus(4) # => 88_000
  # p David.bonus(3) # => 30_000 


end

