class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_reader :name, :grade, :id
  def new(name, grade)
    @name, @grade = name, grade

end
