require_relative './support/shared_examples_for_bike_container'
# Gives an instance of something containing 'BikeContainer',
# to initially run tests against
class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end
