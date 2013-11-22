def encrypt(password)
  `doveadm pw -s ssha -p #{password}`
end

def binary_installed?
  File.exists?('/usr/bin/doveadm')
end

namespace :virtual_user do
  desc "Create new virtual user"
  task create: [:environment] do
    abort('doveadm is not installed') unless binary_installed?

    name, domain_name = ask('What is the new email address?', lambda { |str| str.split(/@\s*/) })
    
    password = ask('Password: ')
    rep_password = ask('Repeat password: ')
    abort('Password is not the same.') unless password == rep_password

    domain = VirtualDomain.where(name: domain_name).first
    domain ||= VirtualDomain.create(name: domain_name)

    VirtualUser.create(name: name, password: encrypt(password),virtual_domain: domain).save!
  end

  desc "List all virtual domains"
  task list: :environment do
    user = VirtualUser.all
    abort('No users defined.') if user.empty?
    max_source = user.map { |a| a.id.to_s.length }.max
    max_dest = user.map { |a| "#{a.name}@#{a.virtual_domain.name}".length }.max

    printf("%#{max_source}s | %#{max_dest}s\n", "Id", "Email")
    puts ("-" * (max_source + max_dest + 4))
    user.each do |a|
      printf("%#{max_source+1}d | %#{max_dest}s\n", a.id, "#{a.name}@#{a.virtual_domain.name}")
    end
  end
end