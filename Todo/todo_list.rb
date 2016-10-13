class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    if todo.class == Todo
      @todos << todo
    else
      "Type Error: Can only add Todo objects."
    end
  end

  def size
    puts @todos.size
  end

  def first
    puts @todos.first
  end

  def last
    puts @todos.last 
  end

  def item_at(indx)
   return puts @todos[indx] if @todos[indx]
    puts "Index Error: No item at index: #{indx} exists."
  end

  def mark_done_at(indx)
    if @todos[indx]
      @todos[indx].done!
    else
      puts "Index Error: No item at index: #{indx} exists."
    end
  end

  def mark_undone_at(indx)
    if @todos[indx] && @todos[indx].done?
      @todos[indx].undone!
    elsif @todos[indx].done? == false
      puts "Item is not marked as done"
    else
      puts "Index Error: No item at index: #{indx} exists."
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(indx)
   return  @todos.delete_at(indx) if @todos[indx]
     puts "Index Error: No item at index: #{indx} exists."
  end

  def to_s
    puts "----- Today's Todos -----"
    puts @todos.each {|x| x.to_s}
  end

  def each
    counter = 0 

    while counter < @todos.size
      yield(@todos[counter])
      counter += 1
    end

    self
  end

  def select
    counter = 0
    arr = TodoList.new("New Todo List")
    while counter < @todos.size
      arr.add(@todos[counter]) if yield(@todos[counter])
      counter += 1
    end

    arr
  end

  def find_by_title(title)
  return puts @todos.select {|x| title == x.title} if @todos.select {|x| title == x.title}
  end

  def all_done
    select {|x| x.done? == true}
  end

  def all_not_done
    select {|x| x.done? == false}
  end

  def mark_done(arg)
    counter = 0 
    while counter < @todos.size
      if @todos[counter].title == arg 
        @todos[counter].done! 
        break
      end
      counter += 1
    end
  end

  def mark_all_done
    each {|x| x.done! if x.done? == false}
  end

  def mark_all_undone
    each {|x| x.undone! if x.done? == true}
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Clean room")
list = TodoList.new("Today's Todos")


list.add(todo1) 
list.add(todo2)
list.add(todo3)
list.add(todo4)

todo1.done!  


p list.to_s

list.mark_all_done

p list.to_s

list.mark_all_undone

p list.to_s