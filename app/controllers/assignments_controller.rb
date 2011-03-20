class AssignmentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.build(params[:assignment])
  end
  
  def create
    @course = Course.find(params[:course_id])
    @assignment = @course.assignments.create!(params[:assignment])
    redirect_to course_path(@course)
  end
end
