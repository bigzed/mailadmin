require 'highline/import'

namespace :virtual_alias do
  desc "Create new virtual alias"
  task :create, [:source, :destination] => [:environment] do |t,args|
    source = args[:source]
    destination = args[:destination]
    source ||= ask('What is the new alias source?')
    destination ||= ask('What is the new alias destination?')

    ('Alias already exists.') if VirtualAlias.exists?(source: source, destination: destination)
    VirtualAlias.create(source: source, destination: destination)
  end

  desc "List all virtual aliases"
  task :list => [:environment] do
    aliases = VirtualAlias.all
    abort('No aliases defined.') if aliases.empty?
    max_source = aliases.map { |a| a.source.length }.max
    max_dest = aliases.map { |a| a.destination.length }.max

    printf("%#{max_source}s | %#{max_dest}s\n", "Source", "Destination")
    puts ("-" * (max_source + max_dest + 3))
    aliases.each do |a|
      printf("%#{max_source}s | %#{max_dest}s\n", a.source, a.destination)
    end
  end
end