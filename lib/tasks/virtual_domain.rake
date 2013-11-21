namespace :virtual_domain do
  desc "Create new virtual domain"
  task create: [:environment] do
    name = ask('What is the new domain name?')

    abort('Domain already exists.') if VirtualDomain.exists?(name: name)
    VirtualDomain.create(name: name)
  end

  desc "List all virtual domains"
  task list: :environment do
    domains = VirtualDomain.all
    abort('No domains defined.') if domains.empty?
    max_source = domains.map { |a| a.id.to_s.length }.max
    max_dest = domains.map { |a| a.name.length }.max

    printf("%#{max_source}s | %#{max_dest}s\n", "Id", "Name")
    puts ("-" * (max_source + max_dest + 4))
    domains.each do |a|
      printf("%#{max_source+1}d | %#{max_dest}s\n", a.id, a.name)
    end
  end

  desc "Delete virtual domain"
  task delete: [:list] do
    id = ask('Which domain do you want to delete? [Id]')
    VirtualDomain.find(id.to_i).destroy
  end
end