Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todo_lists do
    resources :todo_items do
    end
  end
  root 'todo_lists#index'
  patch 'todo_lists/:todo_list_id/todo_items/:id/complete', to: 'todo_items#mark_complete', as: :mark_complete_todo_list_todo_item
end
