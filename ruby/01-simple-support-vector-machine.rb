# Training data
data = []; labels = []
data.push([1.2, 0.7]); labels.push(1)
data.push([-0.3, -0.5]); labels.push(-1)
data.push([3.0, 0.1]); labels.push(1)
data.push([-0.1, -1.0]); labels.push(-1)
data.push([-1.0, 1.1]); labels.push(-1)
data.push([2.1, -3]); labels.push(1)

# Initial parameters
a = 1
b = -2
c = -1

300.times do |iter|
  # Select random data point
  i = (rand * data.length).floor
  x = data[i][0]
  y = data[i][1]
  label = labels[i]

  # Calculate the score
  score = a*x + b*y + c

  # Set the pull
  pull = 0
  pull = 1 if (label === 1 && score < 1)
  pull = -1 if (label === -1 && score > 1)

  # Update the paremeters
  step_size = 0.01
  a += step_size * (x * pull - a)
  b += step_size * (y * pull - b)
  c += step_size * (1 * pull)

  # Check how many are correct
  if (iter % 25 == 0)
    num_correct = 0
    i = 0
    data.each_index do |i|
      x = data[i][0]
      y = data[i][1]
      true_label = labels[i]

      predicted_label = a*x + b*y + c > 0 ? 1 : -1

      if predicted_label === true_label
        num_correct = num_correct + 1
      end
    end

    puts "#{num_correct} out of #{data.length} correct after #{iter} iterations!"
  end
end
