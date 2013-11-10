# Check for SHA-512-Crypt
RSpec::Matchers.define :be_a_sha_512_crypt do
  match do |a|
    a.should start_with("{SHA512-CRYPT}$6$")
  end
end