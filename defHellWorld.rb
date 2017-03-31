# declare a function/method with parameter
# concat String with +
def hello(what)
  out = 'Hello ' + what + '!'
  puts out
end

# Try to get a argument from command line, if it exist, if not uses '...'
what = '...'
if ARGV[0]
  what = ARGV[0]
end

# execute a function wit parameter
hello(what)