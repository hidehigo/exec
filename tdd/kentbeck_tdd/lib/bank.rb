class Bank
  def reduce( source, to )
    return source.reduce(to) if Money === source
    sum = source
    return sum.reduce(to)
  end
end
