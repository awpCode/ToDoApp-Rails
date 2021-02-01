class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
    def index
        @todo_lists = TodoList.all
    end
    def show

    end
    def new
        @todo_list = TodoList.new
    end
    def edit
    end
    def create
        @todo_list = TodoList.new(todo_list_params)
        if @todo_list.save
            flash[:notice] = "Todo List was created successfully."
            redirect_to todo_list_path(@todo_list)
        else
            render 'new'
        end
    end
    def update
        if @todo_list.update(todo_list_params)
            flash[:notice] = "Todo List was update successfully"
            redirect_to todo_list_path(@todo_list)
        else
            render 'edit'
        end
    end
    
    def destroy
        @todo_list.destroy
        redirect_to todo_lists_path
    end

    private
    def todo_list_params
        params[:todo_list].permit(:title, :description)
    end
    def set_todo_list
        @todo_list = TodoList.find(params[:id])
    end
end
