module Count
  def <<(item)
    push(item)
    if @max_need.nil? || @max_need < size
        @max_need = size
    end
    self
  end
  def max_need
    @max_need
  end
end