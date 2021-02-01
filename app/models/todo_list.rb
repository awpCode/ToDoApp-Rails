class TodoList < ApplicationRecord

    #we can write length, uniqueness validations here
    
    has_many :todo_items
end