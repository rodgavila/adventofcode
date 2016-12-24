# Yes, I know this is an n^2 implementation of a priority queue, don't judge me this should be enough to solve
# the problem though.
class PriorityQueue
  def initialize(lambda_comparator=nil)
    @elements = []
    @lambda_comparator = lambda_comparator
  end

  def pop
    if @lambda_comparator.nil?
      @elements.sort!
    else
      @elements.sort_by! { |e| @lambda_comparator.call(e) }
    end
    @elements.delete_at(@elements.size-1)
  end

  def push(element)
    @elements << element
  end
  alias enq push
  alias << push

  def empty?
    @elements.empty?
  end

  def size
    @elements.size
  end
end