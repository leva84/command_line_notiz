def result(command)
  output = IO.popen("#{command}")
  answer = output.read.strip
  output.close
  answer
end


