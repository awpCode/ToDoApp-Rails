class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, only: [:destroy, :mark_complete, :update]
    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        redirect_to @todo_list
    end
    def destroy
        @todo_item.destroy
        redirect_to @todo_list
    end
    def mark_complete
        flash[:notice] = "Todo was mark as completed"
        @todo_item.update_attribute(:completed_at, Time.now)
        redirect_to todo_list_path(@todo_list)
    end
    private
    def todo_item_params
        params[:todo_item].permit(:content)
    end
    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end
    def set_todo_item
        @todo_item = TodoItem.find(params[:id])
    end
end
