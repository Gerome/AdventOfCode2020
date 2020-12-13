import numpy

input_lines = open("input.txt", "r").read()

split_lines = input_lines.split('\n')
split_lines = [int(i) for i in split_lines if i]
split_lines = sorted(split_lines)
diff_values = numpy.diff(split_lines)

x = list(diff_values).count(1) + 1
y = list(diff_values).count(3) + 1
print(diff_values)
print(x)
print(y)
print(x * y)