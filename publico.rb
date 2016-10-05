class Employee
  attr_writer :name , :email 
  attr_reader :salary , :account

  def initialize(name, email, salary, account)
    @name = name
    @email = email
    @salary = salary
    @account = account
  end 

  def to_s
    "#{@name} <email:#{@email}> actt #{@account[-5..-9]="*****"}-#{@account[-5]}#{@account[-3..-1]}"
  end               

  def vacation_days
    coefficient * 7  
  end

  def bonus
    coefficient * 1000
  end


private
    def coefficient
        coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

        coefficients.find { |coefficient, range| range.include? @salary }.first
    end
    def salary
      @salary
    end  

end 


p employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

p employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200
puts employee.coefficient





