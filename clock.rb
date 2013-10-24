require 'clockwork'
include Clockwork

handler do |job|
  job
end

every(30.seconds, 'job'){
  `rake jobs:work`
}