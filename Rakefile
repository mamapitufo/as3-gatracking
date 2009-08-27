# Main flex compilation tasks

task :default => [ :compile_swc ]

desc 'Compile main library SWC'
task :compile_swc do
  puts 'Compiling main library SWC'
  sh %{ compc -load-config config-swc.xml }
end
