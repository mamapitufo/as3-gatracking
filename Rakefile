# Main flex compilation tasks

task :default => [ :compile_swc ]

desc 'Compile main library SWC'
task :compile_swc do
  puts 'Compiling main library SWC'
  sh %{ compc -load-config config-swc.xml }
end

desc 'Generate API documentation'
task :compile_asdoc do
  puts 'Generating API documentation'
  sh %{ asdoc -load-config config-asdoc.xml }
end
