def greeting
  say = ""
  ARGV.each_with_index do |arg , indx |
    indx == 0 ? say = arg : (puts "#{say} #{arg}")
  end
end
greeting