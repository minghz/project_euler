def peter_vals
  [1, 2, 3, 4].repeated_combination(9)
end

def colin_vals
  [1, 2, 3, 4, 5, 6].repeated_combination(6)
end

def peter_poss_hash
  p_values_hash = {}

  peter_vals.each do |val|
    sum = val.sum
    p_values_hash[sum] ? p_values_hash[sum] << val : p_values_hash[sum] = [val]
  end

  p_poss_hash = {}

  p_values_hash.map do |k,v|
    #{ k => (v.map { |ar| ar.permutation.uniq.count }.sum) }
    if k >= 23
      lookback = 22 + (23 - k)
      possible_rolls = p_poss_hash[lookback]
    else
      possible_rolls = v.map { |ar| ar.permutation.uniq.count }.sum
    end

    p_poss_hash[k] = possible_rolls
  end
  p_poss_hash
end

def colin_poss_hash
  c_values_hash = {}

  colin_vals.each do |val|
    sum = val.sum
    c_values_hash[sum] ? c_values_hash[sum] << val : c_values_hash[sum] = [val]
  end

  c_poss_hash = {}

  c_values_hash.map do |k,v|
    #{ k => (v.map { |ar| ar.permutation.uniq.count }.sum) }
    if k > 21
      lookback = 21 + (21 - k)
      possible_rolls = c_poss_hash[lookback]
    else
      possible_rolls = v.map { |ar| ar.permutation.uniq.count }.sum
    end

    c_poss_hash[k] = possible_rolls
  end
  c_poss_hash
end

#puts colin_poss_hash.inspect
#puts peter_poss_hash.inspect
#
#peter_hash = peter_poss_hash.dup
#colin_hash = colin_poss_hash.dup

colin_hash = {6=>1, 7=>6, 8=>21, 9=>56, 10=>126, 11=>252, 12=>456, 13=>756, 14=>1161, 15=>1666, 16=>2247, 17=>2856, 18=>3431, 19=>3906, 20=>4221, 21=>4332, 22=>4221, 23=>3906, 24=>3431, 25=>2856, 26=>2247, 27=>1666, 28=>1161, 29=>756, 30=>456, 31=>252, 32=>126, 33=>56, 34=>21, 35=>6, 36=>1}
peter_hash = {9=>1, 10=>9, 11=>45, 12=>165, 13=>486, 14=>1206, 15=>2598, 16=>4950, 17=>8451, 18=>13051, 19=>18351, 20=>23607, 21=>27876, 22=>30276, 23=>30276, 24=>27876, 25=>23607, 26=>18351, 27=>13051, 28=>8451, 29=>4950, 30=>2598, 31=>1206, 32=>486, 33=>165, 34=>45, 35=>9, 36=>1}

peter_hash[6] = 0
peter_hash[7] = 0
peter_hash[8] = 0

# cheater cheater
win = 0
total_rolls = (4**9) * (6**6.0)

puts peter_hash
puts colin_hash

(6..36).each do |k|
  (k+1..36).each do |j|
    puts "pete #{peter_hash[k]}"
    puts "colin #{colin_hash[k]}"
    win += peter_hash[k] * colin_hash[j]
  end
end

puts "Project Euler 205 Solution = #{win/total_rolls}"











## sums up to 9
#puts %w[1 1 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 10
##puts %w[2 1 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count

## sums up to 11
#puts %w[3 1 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 12
#puts %w[4 1 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 13
#puts %w[4 2 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 14
#puts %w[4 3 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 15
#puts %w[4 4 1 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 2 2 2 1 1 1].permutation.map(&:join).uniq.count
#
## sums up to 16
#puts %w[4 4 2 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 2 2 2 2 1 1].permutation.map(&:join).uniq.count
#
## sums up to 17
#puts %w[4 4 3 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 2 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 3 3 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 3 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 2 2 2 2 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 2 2 2 2 2 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 2 2 2 2 2].permutation.map(&:join).uniq.count
#
## sums up to 18
#puts %w[4 4 4 1 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 3 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 2 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 3 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 2 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 2 2 2 2 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 3 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 2 2 2 2 1 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 2 2 2 2 1].permutation.map(&:join).uniq.count +
#%w[2 2 2 2 2 2 2 2 2].permutation.map(&:join).uniq.count
#
## sums up to 19
#puts %w[4 4 4 2 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 3 3 1 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 3 2 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 4 2 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 3 2 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 3 2 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[4 3 2 2 2 2 2 1 1].permutation.map(&:join).uniq.count +
#%w[4 2 2 2 2 2 2 2 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 3 3 1 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 3 2 2 1 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 3 2 2 2 2 1 1].permutation.map(&:join).uniq.count +
#%w[3 3 2 2 2 2 2 2 1].permutation.map(&:join).uniq.count +
#%w[3 2 2 2 2 2 2 2 2].permutation.map(&:join).uniq.count

