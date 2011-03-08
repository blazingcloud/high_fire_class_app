class PeopleController < ApplicationController
  def index
    @people = Person.order(:last_name).all
  end
  def create
    @person = Person.create(params[:person])
    index
    render :index
  end
end
