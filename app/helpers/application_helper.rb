module ApplicationHelper

  def admin?
    true
  end

  def student_description
    @describe || nil
  end
end
