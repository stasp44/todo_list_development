class TodoListsController < ApplicationController
	respond_to :html, :xml, :js

	def index
		respond_with(@todo_lists = TodoList.all)
	end

	def new
    @todo_lists = TodoList.new
  end
  
  def show
    @todo_list = TodoList.find(params[:id])
  end

  def create
    @todo_list = TodoList.new(params[:todo_list])
    if @todo_list.save
      flash[:notice] = "New TodoList succesfully created."
      respond_with(@todo_list, :location => todo_list_url(@todo_list))
    else
      flash[:error] = "Sorry you missing a title"
      redirect_to new_todo_list_url
    end
  end
  
  def edit
    @todo_list = TodoList.find(params[:id])
  end
  
  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update_attributes(params[:todo_list])
      flash[:notice] = "TodoList is succesfully updated."
      respond_with(@todo_list, :location => todo_list_url(@todo_list))
    else
      flash[:error] = "Sorry you missing a title"
      redirect_to edit_todo_list_path(@todo_list)
    end
  end
  
  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    flash[:notice] = "TodoList is finished great continue that way"
    redirect_to todo_list_url
   end
end
