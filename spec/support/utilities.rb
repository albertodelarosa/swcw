RSpec::Matchers.define :have_constant do |const|

  match do |owner|
    @owner = owner
    owner.const_defined?(const)
  end
  failure_message do |owner|
    "ERROR: Expected #{@owner} to have constant #{const}"
  end

  failure_message_when_negated do |owner|
    "ERROR: Expected #{@owner} to have constant #{const}"
  end

  description do |owner|
    "#{@owner} has constant #{const}"
  end
end
