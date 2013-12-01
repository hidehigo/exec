class Bank
  def reduce( source, to )
    return source if Money === source
    sum = source
    return sum.reduce(to)
  end
end
