namespace :virtual_alias do
  desc "Create new virtual alias"
  task create: [:environment] do
    src_name, src_domain_name = ask('What is the new source for the alias?'), lambda { |str| str.split(/@\s*/) }
    destination = ask('What is the new destination for the alias?')

    domain = VirtualDomain.where(name: src_domain_name).first
    domain ||= VirtualDomain.create(name: src_domain_name)

    VirtualAlias.create(name: src_name, virtual_domain: domain, destination: destination)
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