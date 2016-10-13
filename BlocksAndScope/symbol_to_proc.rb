[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)

