class Exam

  attr_reader :title, :due_date
  attr_accessor :grade

  def initialize(title, due_date)
    @title = title
    @due_date = due_date
    @assigned_to = nil
    @grade = nil
  end

  def assigned_to=(student)
    @assigned_to = student
  end
end
