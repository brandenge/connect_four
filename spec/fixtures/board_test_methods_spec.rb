module BoardTestMethods
  def columns
    @columns
  end

  def turns
    @turns
  end

  def set_turns(turns)
    @turns = turns
  end

  def set_slots(slots)
    @slots = slots
  end

  def insert_slots(color, columns)
    columns.each do |column|
      @slots[find_lowest_row(column)][@columns.index(column)] = color
    end
  end
end
