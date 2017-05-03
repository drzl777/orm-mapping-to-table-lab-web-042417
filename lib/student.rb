require 'pry'
class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_reader :name, :grade, :id
  def initialize(name, grade)
    @name, @grade,@id = name, grade, nil
  end

  def self.create_table
    #sql = "CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade TEXT)"
    sql = '''CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade TEXT
    )'''
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = '''DROP TABLE IF EXISTS students'''
    DB[:conn].execute(sql)
  end

  def save
    #save_sql = '''INSERT INTO students (name, grade) VALUES ("''' + @name + '''", "''' + @grade + '''")'''
    #sql = "INSERT INTO students (name, grade) VALUES ("''' + @name + '''", #{self.grade + })"
    save_sql = "INSERT INTO students (name, grade) VALUES (?, ?)"
    DB[:conn].execute(save_sql, self.name, self.grade)
    id_sql = "SELECT last_insert_rowid() FROM students"
    @id = DB[:conn].execute(id_sql)[0][0]
  end

  def self.create(attr_hash)
    new_student = self.new(attr_hash[:name], attr_hash[:grade])
    new_student.save
    new_student
  end


end
