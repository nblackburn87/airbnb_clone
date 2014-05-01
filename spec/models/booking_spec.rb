require 'spec_helper'

describe Booking do
  it { should belong_to :listing }
end
