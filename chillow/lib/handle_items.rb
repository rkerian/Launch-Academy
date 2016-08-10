require 'pry'

module HandleItems

  def full?
    @inventory.count >= @max_inventory ? true : false
  end

  def add_item(name)
    if !self.full?
      @inventory << name
    else
      "full"
    end
  end

  def remove_item(name)
    if @inventory.include?(name)
      delete_index = @inventory.find_index(name)
      @inventory[delete_index] = nil
      "removed"
    else
      "#{name} not present"
    end
  end

  def empty(name)
    @inventory.delete(name)
    "empty"
  end
end
